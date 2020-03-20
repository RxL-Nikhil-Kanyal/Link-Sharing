package projectls

class DemoController {
    static defaultAction = "auth"
    def index() {

        render "abc"
    }
    def top(){

    }

    def auth(){


    }
    def topicsShow(){

    }
    def myAction(){

        String n=params.username;
        String p=params.passwd;
        User us=User.findByUsernameOrEmailIlike(params.username,params.username)
        if(us){
            if(us.password==params.passwd){


                render (view:"dashboard");
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

        User u=new User(email:params.regemail,username:params.regusername,password:params.regpassword,firstName:params.regfirstname,lastName:params.reglastname,
        admin:0,active:1)

        u.photo=params.regphoto.bytes

        u.validate()
        if (u.hasErrors()) {
            u.errors.allErrors.each {
                println it
            }
//            render view: 'auth', model: [myUser: u]
//            return
        }

            u.save(flush:true,failOnError:true)

            render(view:"dashboard")


    }
    def search(){}

    def dashboard(){

    }
    def logout(){
        render "loggged out"
    }
    def formtest(){

        println params.param1
        println params.param2

        return
    }
}
