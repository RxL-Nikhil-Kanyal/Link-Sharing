package projectls

class AuthenticationController {
    static defaultAction = "auth"

    AuthService authService
    ResourceRatingService resourceRatingService


    def auth() {

        render(view:"auth",model:[recentUpdatedTopics:authService.authMehod(),
                                  topPostsWithRating:resourceRatingService.getTopRatedPosts(session.user)])
    }

    def login() {

        String n = params.username;
        String p = params.passwd;
        User us = User.findByUsernameOrEmailIlike(params.username, params.username)
        if (us) {
            if (us.active) {
                if (us.password == params.passwd) {
                    session.user = us.username

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

        if(params.regphoto.size!=0){

            def file =request.getFile("regphoto")
            byte[] photo = file.bytes
            user.photo=photo
        }

        user.validate()
        if (user.hasErrors()) {
            user.errors.allErrors.each {
                println it
            }
            flash.warning = "Error Creating User. Username/email exists! "
            redirect(controller: 'authentication')
            return

        }

        user.save(flush: true, failOnError: true)

         flash.message="User Created ${user.username}. Please Login"
        redirect(controller: 'Authentication', action: 'auth')

    }

    def logout() {


        session.invalidate()

        redirect(controller: "Authentication", action: "auth")
        flash.message = "logged out successfully"
    }

    def PublicTopicsShow() {


        Resource res = Resource.findById(params.topicRelated)
        List updatedTopics = Resource.findAllByTopics(res?.topics)

        [recentUpdatedTopics: updatedTopics]


    }

    def userImage() {

        def user = User.get(params.userId)
        byte[] imageInByte = user.photo
        response.contentType = 'image/png/jpeg'
        response.outputStream << imageInByte
        response.outputStream.flush()

    }


}
