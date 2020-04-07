package projectls

import grails.converters.JSON

class AuthenticationController {
    static defaultAction = "auth"

    AuthService authService
    ResourceRatingService resourceRatingService
    SearchService searchService


    def auth() {

        render(view: "auth", model: [recentUpdatedTopics: authService.authMehod(),
                                     topPostsWithRating : resourceRatingService.getTopRatedPosts(session.user)])
    }

    def login() {

        String username = params.username;
        String password = params.passwd;
        User user = User.findByUsernameOrEmailIlike(params.username, params.username)
        if (user) {
            if (user.active) {
                if (user.password == params.passwd) {
                    session.user = user.username

                    redirect(controller: 'demo', action: 'dashboard')
                    flash.message = "Logged in as ${session.user} "

                } else {
                    redirect(controller: 'Authentication', action: 'auth')
                    flash.warning = "Invalid Username/Password, please try again."
                }
            } else {
                redirect(controller: 'Authentication', action: 'auth')
                flash.warning = "User Inactive , Contact Admin "
            }
        } else {
            redirect(controller: 'Authentication', action: 'auth')
            flash.warning = "User Does Not Exsist"
        }
    }

    def RegisterAction() {

        if (params.regpassword != params.regconfirmpassword) {
            redirect(controller: 'Demo', action: 'auth')
            flash.warning = "password and confirm password do not match"
            return
        }

        User user = new User(email: params.regemail, username: params.regusername, password: params.regpassword, firstName: params.regfirstname, lastName: params.reglastname,
                admin: 0, active: 1)

        if (params.regphoto.size != 0) {

            def file = request.getFile("regphoto")
            byte[] photo = file.bytes
            user.photo = photo
        }

        user.validate()
        if (user.hasErrors()) {
            user.errors.allErrors.each {
                println it
            }
            flash.warning = "Error Creating User."
            redirect(controller: 'authentication')
            return

        }

        user.save(flush: true, failOnError: true)
        flash.message = "User Created ${user.username}. Please Login"
        redirect(controller: 'Authentication', action: 'auth')

    }

    def logout() {

        session.invalidate()
        redirect(controller: "Authentication", action: "auth")
        flash.message = "logged out successfully"
    }

    def PublicTopicsShow() {

        if (params.topicRelated) {
            Resource res = Resource.findById(params.topicRelated)
            List updatedTopics = Resource.findAllByTopics(res?.topics)

            return [recentUpdatedTopics: updatedTopics]
        } else {
            if (!params.searchAtAuth) {
                render "Error ! Invalid Search!"
                return
            }
            String noActiveUser = '';
            return [recentUpdatedTopics: searchService.searchMethod(noActiveUser, params.searchAtAuth)]

        }
    }

    def userImage() {

        def user = User.get(params.userId)
        byte[] imageInByte = user.photo
        response.contentType = 'image/png/jpeg'
        response.outputStream << imageInByte
        response.outputStream.flush()

    }

    def forgotPasswordMail() {

        User user = User.findByUsernameOrEmail(params.userDetail, params.userDetail)
        if (user) {
            try {
                sendMail {
                    to user.email
                    subject "Password change"
                    body 'Change Password here : http://localhost:9090/authentication/passwordChange?userId=' + user.id
                }
            } catch (Exception e) {
              //  flash.warning = "can not send Reset Link!"
                render([success:false,message:"Error! Mail cannot be sent!"] as JSON)
            }
           // flash.message = "Reset Mail sent!"
            render([success: true,message:"Reset Mail Sent!"] as JSON)

        } else {
           // flash.warning = "User does not Exist!"
            render([success:false,message:"User does not Exist!"] as JSON)
        }
    }

    def passwordChange() {
        render(view: "passwordChange", model: [userId: params.userId])
    }

    def changeUserPassword() {

        User user = User.get(params.userId)
        user.password = params.newPassword
        user.save(flush: true, failOnError: true)

        return true
    }
    def downloadFile = {

        DocumentResources docRes = DocumentResources.findById(params.res)
        response.setHeader("Content-Type", "application/octet-stream;")
        response.setHeader("Content-Disposition", "attachment; filename=\"" + "document" + "\"")
        response.outputStream << docRes.doc

    }


}
