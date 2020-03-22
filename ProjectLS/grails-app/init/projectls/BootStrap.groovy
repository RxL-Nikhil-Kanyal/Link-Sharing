package projectls

class BootStrap {

    def init = { servletContext ->


        User x=new User(email:"a@cv.com",username:"dirk",password:"dddddddd",firstName:"dirkFname",lastName:"dirkLname",admin:0,active:0)
        x.save()
        User r=new User(email:"admin@gmail.com",username:"admin",password:"adminadmin",firstName:"The",lastName:"Admin",admin:1,active:1)
        r.save()


    }
    def destroy = {
    }
}
