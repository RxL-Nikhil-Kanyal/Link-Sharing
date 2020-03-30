package projectls

class AuthenticationController {
    static defaultAction = "auth"

    AuthService authService


    def auth() {

        render(view:"auth",model:authService.authMehod())
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

                    if(us.photo){
                        String encoded = Base64.getEncoder().encodeToString(us.photo);
                        session.setAttribute("userPhoto", encoded)

                    }


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

        User u = new User(email: params.regemail, username: params.regusername, password: params.regpassword, firstName: params.regfirstname, lastName: params.reglastname,
                admin: 0, active: 1)

        u.photo = params.regphoto.bytes

        u.validate()
        if (u.hasErrors()) {
            u.errors.allErrors.each {
                println it
            }
            flash.warning = "Error Creating User. Username/email exists! "
            redirect(controller: 'authentication')
            return


        }

        u.save(flush: true, failOnError: true)



         flash.message="User Created ${u.username}. Please Login"
        redirect(controller: 'Authentication', action: 'auth')
        //     flash.message = "Welcome ${session.user}"



    }

    def logout() {


        session.invalidate()

        redirect(controller: "Authentication", action: "auth")
        flash.message = "logged out successfully"
    }

    def PublicTopicsShow() {


        println "topic updates recently :---------" + params.topicRelated//res updated

        Resource res = Resource.findById(params.topicRelated)
        List updatedTopics = Resource.findAllByTopics(res?.topics)

        [recentUpdatedTopics: updatedTopics]


    }


}
