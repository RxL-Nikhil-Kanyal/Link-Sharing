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
    def posts(){}
    def topicsShow(){

    }
    def myAction(){

        String n=params.username;
        String p=params.passwd;
        User us=User.findByUsernameOrEmailIlike(params.username,params.username)
        if(us){
            if(us.password==params.passwd){
                session.user = us.username

                redirect(controller:'demo',action:'dashboard',model:['user':us.username])
                flash.message = "Logged in "

            }else{
                redirect(controller:'Demo',action:'auth')
                flash.message = "Invalid Username/Password, please try again."
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
//        List tl=Subsciption.findByUser("1").t
//
//        [top:tl]

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
}
