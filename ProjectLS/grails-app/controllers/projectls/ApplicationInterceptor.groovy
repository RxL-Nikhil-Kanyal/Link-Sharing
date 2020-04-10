package projectls


class ApplicationInterceptor {

    public ApplicationInterceptor() {
        matchAll().excludes(controller: 'authentication')
        .excludes(controller:'publicResources')
    }

    boolean before() {
        if (!session.user) {
            redirect(controller: "Authentication", action: "homePage")
            flash.warning = "Please Login first!"
            return false
        } else {
            true
        }
    }

    boolean after() { true }

    void afterView() {

    }
}
