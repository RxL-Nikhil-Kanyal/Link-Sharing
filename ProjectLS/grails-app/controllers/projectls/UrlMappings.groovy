package projectls

class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(controller:"Authentication")


        "500"(view:'/error')
        "404"(view:'/notFound')
    }
}
