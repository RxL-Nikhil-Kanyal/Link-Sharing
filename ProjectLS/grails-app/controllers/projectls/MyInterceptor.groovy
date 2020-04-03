package projectls


class MyInterceptor {


    public MyInterceptor() {
        println "my interceptor called"

        matchAll().excludes(controller: 'authentication')


    }

    boolean before() {

        if (!session.user) {
            redirect(controller: "Authentication", action: "auth")
            flash.warning = "please Login first!"

            return false
        } else {

            true
        }

    }

    boolean after() { true }

    void afterView() {

        // no-op
    }
}
