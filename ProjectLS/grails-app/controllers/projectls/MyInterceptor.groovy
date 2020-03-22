//package projectls
//
//
//class MyInterceptor {
//
//
//    MyInterceptor(){
//        println "interceptor called"
//
//        matchAll().excludes(action:~/(auth|myAction|RegisterAction)/)
//
//
//
//
////        .except(action:"auth")
////        .except(action:"myAction")
////        .except(action:"RegisterAction")
//
//
//    }
//
//    boolean before() {
//        println "before called for session by :"+ session.user
//
//        if(!session.user) {
//            redirect(controller: "Demo", action: "auth")
//            flash.message = "please Login first!"
//            println "before was called!"
//            return false
//        }else {
//            true
//        }
//
//         }
//
//    boolean after() { true }
//
//    void afterView() {
//
//        // no-op
//    }
//}
