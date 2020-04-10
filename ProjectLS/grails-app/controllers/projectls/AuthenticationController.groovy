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

        User user = User.findByUsernameOrEmail(username, username)
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

    def register(User user) {

        if (user.password!=params.registerConfirmPassword) {
            redirect(action: 'homePage')
            flash.warning = "Password and Confirm password do not match"
            return
        }
        if (params.registerPhoto.size > 0) {

            def file = request.getFile("registerPhoto")
            byte[] photo = file.bytes
            user.photo = photo
        }
        user.validate()
        if (user.hasErrors()) {
            render(view: 'homePage', model: [User              : user, recentUpdatedTopics: recentUpdatedTopicsService.topRecentUpdatedPublicTopics(),
                                             topPostsWithRating: resourceRatingService.getTopRatedPosts(session.user)])
            return
        }
        user.save(flush: true)
        flash.message = "User Created ${user.username}. Please Login"
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
            def encryptUserId=(Integer.toBinaryString((int)user.id)+11).reverse()+11
            try {
                sendMail {
                    to user.email
                    subject "Password change"
                    body 'Change Password here : http://localhost:9090/authentication/passwordChange?userId=' + encryptUserId
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

        User user
        try{
            def decryptUserId=(Integer.parseInt((userId-11).reverse()-11,2))
            user = User.get(decryptUserId)
        }catch(e){
            flash.message="Error! User does not Exist!"
            render ([success: false]as JSON)
        }
        if(user){
            user.password = newPassword
            user.save(flush: true)
            flash.message="Password Changed Successfully!"
            render ([success: true]as JSON)
        }
    }

}
