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

        def uploadedFile = request.getFile("regphoto");
        byte[] p=uploadedFile.bytes

        User u=new User(email:params.regemail,username:params.regusername,password:params.regpassword,firstName:params.regfirstname,lastName:params.reglastname,
        admin:0,active:1)
        u.photo=p
        u.save(flush:true,failOnError:true)
        render("rendered page")

    }
    def search(){}

    def dashboard(){

    }
    def logout(){
        render "loggged out"
    }
}
