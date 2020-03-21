package projectls

class BootStrap {

    def init = { servletContext ->


        User x=new User(email:"a@cv.com",username:"dirk",password:"dddddddd",firstName:"dirkFname",lastName:"dirkLname",admin:0,active:1)
        x.save()


    }
    def destroy = {
    }
}
