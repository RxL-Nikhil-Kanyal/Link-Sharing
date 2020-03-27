package projectls


class MyInterceptor {


  public  MyInterceptor(){
        println "my interceptor called"

        matchAll().excludes(controller:'authentication')





//        .except(action:"auth")
//        .except(action:"myAction")
//        .except(action:"RegisterAction")


    }

    boolean before() {
        println "before called for session by :"+ session.user

        if(!session.user) {
            redirect(controller: "Authentication", action: "auth")
            flash.warning = "please Login first!"
            println "before was called!"
            return false
        }else {
            println "inside else"
            true
        }

         }

    boolean after() { true }

    void afterView() {

        // no-op
    }
}
