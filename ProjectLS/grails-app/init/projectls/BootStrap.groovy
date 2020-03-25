package projectls

class BootStrap {

    def init = { servletContext ->


        User r=new User(email:"a@cv.com",username:"dirk",password:"dddddddd",firstName:"dirkFname",lastName:"dirkLname",admin:0,active:0)
        r.save()
        User x=new User(email:"admin@gmail.com",username:"admin",password:"adminadmin",firstName:"The",lastName:"Admin",admin:1,active:1)
        x.save()



        Topics t=new Topics(name:"firstTopic",user:x.id,visibility:"Private")
        t.save(flush:true,failOnError:true)

        Subscription newSub=new Subscription(user:x.id,topics:t.id,seriousness:"Serious")
        newSub.save(flush:true,failOnError: true)


        Topics t2=new Topics(name:"secTopic",user:x.id,visibility:"Public")
        t.save(flush:true,failOnError:true)

        Subscription newSub2=new Subscription(user:x.id,topics:t2.id,seriousness:"Serious")
        newSub.save(flush:true,failOnError: true)


    }
    def destroy = {
    }
}
