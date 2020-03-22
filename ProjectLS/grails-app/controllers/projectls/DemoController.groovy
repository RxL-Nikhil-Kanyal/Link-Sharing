package projectls

class DemoController {
    static defaultAction = "auth"
    def index() {

        if(session.user != null)
        {
            println "session active"
        }


        println session.user
        render "abc"
    }
    def top(){

    }


    def auth(){


    }
    def posts(){
        User au=User.findByUsername(session.user)
        return [activeUser:au]
    }
    def topicsShow(){

        User au=User.findByUsername(session.user)
        return [activeUser:au]

    }
    def myAction(){

        String n=params.username;
        String p=params.passwd;
        User us=User.findByUsernameOrEmailIlike(params.username,params.username)
        if(us){
            if(us.active){
                if(us.password==params.passwd){
                    session.user = us.username

                    redirect(controller:'demo',action:'dashboard')
                    flash.message = "Logged in "

                }else{
                    redirect(controller:'Demo',action:'auth')
                    flash.message = "Invalid Username/Password, please try again."
                }
            }else{
                redirect(controller: 'Demo',action:'auth')
                flash.message="User Inactive , Contact Admin "

            }


        }else{

            redirect(controller:'Demo',action:'auth')
           flash.message = "User Does Not Exsist"
        }


    }

    def RegisterAction(){

        if(params.regpassword!=params.regconfirmpassword)
        {
            redirect(controller:'Demo',action:'auth')
            flash.message = "password and confirm password do not match"
            return
        }

        User u=new User(email:params.regemail,username:params.regusername,password:params.regpassword,firstName:params.regfirstname,lastName:params.reglastname,
        admin:0,active:1)

        u.photo=params.regphoto.bytes

        u.validate()
        if (u.hasErrors()) {
            u.errors.allErrors.each {
                println it
            }
//            render
//            return
        }

            u.save(flush:true,failOnError:true)



        session.user = params.regusername
        flash.message = "welcome new user"
        redirect(controller:'demo',action:'dashboard')




    }
    def search(){}

    def dashboard(){
        User au=User.findByUsername(session.user)
        [activeUser:au]


    }
    def logout(){

        println "session out"
        session.invalidate()
        redirect(action: "auth")
        flash.message="logged out successfully"
    }
    def createTopicFormAction(){

        println params.newTopicname
        println params.topic.visibility

        println session.user
        User x=User.findByUsername(session.user)

        //topic creation by user

        Topics t=new Topics(name:params.newTopicname,user:x.id,visibility:params.topic.visibility)
        t.save(flush:true,failOnError:true)

        Subscription newSub=new Subscription(user:x.id,topics:t.id,seriousness:"Serious")
        newSub.save(flush:true,failOnError: true)

        redirect(action:"dashboard")


    }

    def UsersA(){
        def persons = User.list()
        User au=User.findByUsername(session.user)
        def nu=persons.size()
        println "size of the list : "+ nu
       return [usr:persons,activeUser:au,numberOfUser:nu]



    }
    def editProfile(){

        User au=User.findByUsername(session.user)

        return [activeUser:au]
    }
    def changeUserPassword(){

        if(params.changePassword==params.changeConfirmPassword){
            User U=User.findByUsername(session.user)
            U.password=params.changePassword
            U.save(flush:true,failOnError: true)

            redirect (action:"editProfile")
            flash.message="Password changed"
        }else{
            redirect (action:"editProfile")
            flash.message="Password and Confirm Password do not match"

        }
    }
    def changeUserDeatails () {

        User y=User.findByUsername(session.user)
        println params.changeUsername
        println params.changeFirstname
        println params.changeLastname
        println params.changePhoto.bytes

        if(params.changeUsername){y.username=params.changeUsername}
        if(params.changeFirstname){y.firstName=params.changeFirstname}
        if(params.changeLastname) { y.lastName=params.changeLastname}
        if(params.changePhoto.bytes){ y.photo=params.changePhoto.bytes}

        y.save(flush:true,failOnError: true)

        redirect(action:"editProfile")
        flash.message="Changes Successfull"


    }
    def  userProfile(){
        User au=User.findByUsername(session.user)
        [activeUser:au]
    }


}
