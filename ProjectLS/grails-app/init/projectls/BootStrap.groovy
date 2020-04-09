package projectls

class BootStrap {

    def init = { servletContext ->

        if(!User.findByUsername('Admin')){
            User user=new User(email:'admin@gmail.com',username:'Admin',password:'adminadmin',
                    firstName:'Admin',lastName:'singh',admin:1)
            user.save(flush:true,failOnError:true)
        }
    }

    def destroy = {
    }
}
