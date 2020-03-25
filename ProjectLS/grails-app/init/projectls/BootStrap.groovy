package projectls

class BootStrap {

    def init = { servletContext ->

        //users

        User r=new User(email:"a@cv.com",username:"dirk",password:"dddddddd",firstName:"dirkFname",lastName:"dirkLname",admin:0,active:0)
        r.save()
        User x=new User(email:"admin@gmail.com",username:"admin",password:"adminadmin",firstName:"The",lastName:"Admin",admin:1,active:1)
        x.save()


//topics and sub admin
        Topics t=new Topics(name:"firstTopic",user:x.id,visibility:"Private")
        t.save(flush:true,failOnError:true)

        Subscription newSub=new Subscription(user:x.id,topics:t.id,seriousness:"Serious")
        newSub.save(flush:true,failOnError: true)

//topic and sub admin
        Topics t2=new Topics(name:"secTopic",user:x.id,visibility:"Public")
        t2.save(flush:true,failOnError:true)

        Subscription newSub2=new Subscription(user:x.id,topics:t2.id,seriousness:"Serious")
        newSub2.save(flush:true,failOnError: true)

//topic and sub admin

        Topics t3=new Topics(name:"ThirdTopic",user:x.id,visibility:"Public")
        t3.save(flush:true,failOnError:true)

        Subscription newSub3=new Subscription(user:x.id,topics:t2.id,seriousness:"Serious")
        newSub3.save(flush:true,failOnError: true)

        //resource for topic 2
        LinkResources linkResource=new LinkResources(name:"blah blah Description",URl:"xy.com",user:x.id,topics:t2.id)
        linkResource.save(flush: true,failOnError: true)

        //resource for topic 3
        LinkResources linkResource2=new LinkResources(name:" 3 blah blah Description",URl:"kl.com",user:x.id,topics:t3.id)
        linkResource2.save(flush: true,failOnError: true)


    }
    def destroy = {
    }
}
