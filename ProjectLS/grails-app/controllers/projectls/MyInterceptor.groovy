//package projectls
//
//
//class MyInterceptor {
//
//
//    MyInterceptor(){
//        println "my interceptor called"
//
// //       matchAll().excludes(controller:"Demo",action:~/(auth|myAction|RegisterAction)/)
//        matchAll()
//                .excludes(action:'auth')
//                .excludes(action:'myAction')
//                .excludes(action:'RegisterAction')
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
//            println "inside else"
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
