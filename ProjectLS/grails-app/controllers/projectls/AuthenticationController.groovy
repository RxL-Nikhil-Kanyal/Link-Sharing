package projectls

import grails.converters.JSON

class AuthenticationController {
    static defaultAction = "homePage"

    RecentUpdatedTopicsService recentUpdatedTopicsService
    ResourceRatingService resourceRatingService

    def homePage() {

        render(view: "homePage", model: [recentUpdatedTopics: recentUpdatedTopicsService.topRecentUpdatedPublicTopics(),
                                     topPostsWithRating : resourceRatingService.getTopRatedPosts(session.user)])
    }

    def login(String username,String password) {

        User user = User.findByUsernameOrEmailIlike(username, username)
        if (user) {
            if (user.active) {
                if (user.password == password) {
                    session.user = username
                    redirect(controller: 'user', action: 'dashboard')
                    flash.message = "Logged in as ${session.user} "
                } else {
                    redirect(controller: 'Authentication', action: 'homePage')
                    flash.warning = "Invalid Username/Password, please try again."
                }
            } else {
                redirect(controller: 'Authentication', action: 'homePage')
                flash.warning = "User Inactive , Contact Admin "
            }
        } else {
            redirect(controller: 'Authentication', action: 'homePage')
            flash.warning = "User Does Not Exsist"
        }
    }

    def register(User userCo) {

        if (userCo.password!=params.registerConfirmPassword) {
            redirect(action: 'homePage')
            flash.warning = "Password and Confirm password do not match"
            return
        }
        if (params.registerPhoto.size > 0) {

            def file = request.getFile("registerPhoto")
            byte[] photo = file.bytes
            userCo.photo = photo
        }
        userCo.validate()
        if (userCo.hasErrors()) {
            render(view: 'homePage', model: [User              : userCo, recentUpdatedTopics: recentUpdatedTopicsService.topRecentUpdatedPublicTopics(),
                                             topPostsWithRating: resourceRatingService.getTopRatedPosts(session.user)])
            return
        }
        userCo.save(flush: true, failOnError: true)
        flash.message = "User Created ${userCo.username}. Please Login"
        redirect(controller: 'Authentication', action: 'homePage')

    }

    def logout() {
        session.invalidate()
        redirect(controller: "Authentication", action: "homePage")
        flash.message = "logged out successfully"
    }

    def forgotPasswordMail(String userDetail) {

        User user = User.findByUsernameOrEmail(userDetail,userDetail)
        if (user) {
            try {
                sendMail {
                    to user.email
                    subject "Password change"
                    body 'Change Password here : http://localhost:9090/authentication/passwordChange?userId=' + user.id
                }
            } catch (Exception e) {
                render([success:false,message:"Error! Mail cannot be sent!"] as JSON)
            }
            render([success: true,message:"Reset Mail Sent!"] as JSON)
        } else {
            render([success:false,message:"User does not Exist!"] as JSON)
        }
    }

    def passwordChange(String userId) {
        render(view: "passwordChange", model: [userId:userId])
    }

    def changeUserPassword(String userId,String newPassword) {

        User user = User.get(userId)
        user.password = newPassword
        user.save(flush: true, failOnError: true)
        flash.message="Password Changed Successfully!"
        return true
    }

}
