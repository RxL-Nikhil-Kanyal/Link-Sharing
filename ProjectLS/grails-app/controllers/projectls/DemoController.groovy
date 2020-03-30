package projectls



class DemoController {
    TopicsService topicsService


    static defaultAction = "dashboard"

    def index() {

        if (session.user != null) {
            println "session active"
        }
        println session.user
        render "abc"
    }


    def posts() {
        User au = User.findByUsername(session.user)
        List subscribedTopics = Subscription.findAllByUser(User.get(au.id)).topics

        return [activeUser: au, subbedTopics: subscribedTopics]
    }

    def topicsShow() {

        User au = User.findByUsername(session.user)
        List subscribedTopics = Subscription.findAllByUser(User.get(au.id)).topics

        return [activeUser: au, subbedTopics: subscribedTopics]

    }

    def dashboard() {
        User au = User.findByUsername(session.user)
        List subscribedTopics = Subscription.findAllByUser(User.get(au.id)).topics
        List L = Subscription.findAllByUser(User.findByUsername(session.user))//display subs of user
        List topicsByUSer = Topics.findAllByUser(User.findAllByUsername(session.user))
        def topicsWithCount=topicsService.trendingTopics();//trend

        [activeUser: au, subbedTopics: subscribedTopics, listOfSubs: L, usersTopics: topicsByUSer,trendingTopicsAndCount:topicsWithCount]


    }




    def UsersA() {
        def persons = User.list()
        User au = User.findByUsername(session.user)
        //remove numbr of users for now p.s()
        List subscribedTopics = Subscription.findAllByUser(User.get(au.id)).topics

        return [usr: persons, activeUser: au, subbedTopics: subscribedTopics]


    }

    def editProfile() {

        User au = User.findByUsername(session.user)
        List subscribedTopics = Subscription.findAllByUser(User.get(au.id)).topics
        List topicsByUser=Topics.findAllByUser(User.findByUsername(session.user))


        if(!topicsByUser.isEmpty()){
            List UserCreatedAndSubTopics = Subscription.createCriteria().list() {

                inList("topics", topicsByUser)
            }
            return [activeUser: au, subbedTopics: subscribedTopics,userSubbedTopics:UserCreatedAndSubTopics]
        }


        return [activeUser: au, subbedTopics: subscribedTopics]
    }

    def changeUserPassword() {

        if (params.changePassword == params.changeConfirmPassword) {
            User U = User.findByUsername(session.user)
            U.password = params.changePassword
            U.save(flush: true, failOnError: true)

            if (U.hasErrors()) {
                U.errors.allErrors.each {
                    println it
                }

                flash.warning="Error, Please try again!"
                redirect(action:"editProfile")
            }

            redirect(action: "editProfile")
            flash.message = "Password changed"
        } else {
            redirect(action: "editProfile")
            flash.warning = "Password and Confirm Password do not match"

        }
    }

    def changeUserDeatails() {

        User y = User.findByUsername(session.user)
        println params.changeUsername
        println params.changeFirstname
        println params.changePhoto.bytes

        if (params.changeUsername) {
            y.username = params.changeUsername
        }
        if (params.changeFirstname) {
            y.firstName = params.changeFirstname
        }
        if (params.changeLastname) {
            y.lastName = params.changeLastname
        }
        if (params.changePhoto.bytes) {
            y.photo = params.changePhoto.bytes
        }

        y.save(flush: true, failOnError: true)

        redirect(action: "editProfile")
        flash.message = "Changes Successfull"


    }
    def userProfile() {


        User au = User.findByUsername(session.user)
        List subscribed = Subscription.findAllByUser(User.get(au.id))
        List subTopics=subscribed.topics
        List R=[]

        List topicsByUser = Topics.findAllByUser(User.findAllByUsername(session.user))

        //get from link
        if(au==User.get(params.otherUserId)){


            if(!subTopics.isEmpty()) {//posts
                R = Resource.createCriteria().list() {
                    inList("topics", subTopics)

                }

            }

            return [activeUser: au,DisplayRes:R, subbedTopics: subTopics,usersTopics: topicsByUser,ou:au,ouSubs:subscribed,ouTopic:topicsByUser]

        }else{
            User otherUser=User.get(params.otherUserId)
            List ouPublicTopics = Topics?.findAllByVisibilityAndUser("Public",otherUser)
            List subPublic = Subscription.createCriteria().list() {
                and {

                    inList("topics", ouPublicTopics)

                }
            }

            if(!subPublic?.topics?.isEmpty()) { ///posts
                R = Resource.createCriteria().list() {
                    inList("topics", subPublic?.topics)

                }

            }
            return [activeUser: au,DisplayRes:R, subbedTopics: subTopics,usersTopics: topicsByUser,ou:otherUser,ouSubs:subPublic,ouTopic:ouPublicTopics]



        }




    }

    def changeUserActiveStatus() {
        User otherUser = User.get(params.val)
        if (otherUser.active) {

            otherUser.active = 0
        } else {
            otherUser.active = 1
        }
        otherUser.save(flush: true, failOnError: true)
        println "change active called"
        redirect(action: "UsersA")
    }

    def fetchPersonImage() {
        User usr = User.findByUsername(session.user)

        String encoded = Base64.getEncoder().encodeToString(usr.photo)
        session.setAttribute("userPhoto", encoded)


    }

    def ShareLinkAction() {

        Topics t = Topics.findByName(params.linktopic.name)
        User u = User.findByUsername(session.user)


        LinkResources linkResource = new LinkResources(name: params.myLinkField, URl: params.LinkTopicUrl, user: u.id, topics: t.id)
        linkResource.validate()

        if (linkResource.hasErrors()) {
            linkResource.errors.allErrors.each {
                println it
            }
            flash.warning = "Error ,Please Try Again"
        } else {
            linkResource.save(flush: true, failOnError: true)
            flash.message = "Added Resource Successfully"
        }


        redirect(action: "dashboard")
    }

    def shareDocAction() {
        Topics t = Topics.findByName(params.docChosenTopic)
        User u = User.findByUsername(session.user)


        DocumentResources docResource = new DocumentResources(name: params.myDocField, user: u.id, topics: t.id)
        docResource.doc = params.docfile.bytes
        docResource.validate()

        if (docResource.hasErrors()) {
            docResource.errors.allErrors.each {
                println it
            }
            flash.warning = "Error ,Please Try Again"
        } else {
            docResource.save(flush: true, failOnError: true)
            flash.message = "Added Resource Successfully"
        }


        redirect(action: "dashboard")

    }

    def unsubscribeAction() {

        //needs correction
        println "----------->" + params.topicinfo
        Topics topic = Topics.findById(params.topicinfo)

        println "this is the topic here: " + topic
        User u = User.findByUsername(session.user)
        Subscription checksub = Subscription.findByTopicsAndUser(topic, u)

        if (u.id == topic.user.id) {
            topic.delete(flush: true, failOnError: true)
            flash.message = "Unsubscibed and deleted topic"
        } else {
            checksub.delete(flush: true, failOnError: true)
            flash.message = "Unsubscibed "
        }

        redirect(action: "dashboard")


    }


    def downloadFile = {
        println "------------------------->"+params.res
        DocumentResources docRes=DocumentResources.findById(params.res)

        response.setHeader("Content-Type", "application/octet-stream;")
       response.setHeader("Content-Disposition", "attachment; filename=\"" + "document" + "\"")
        response.outputStream << docRes.doc


        render "downloading !!!"
    }

    def changeVisibFromDash(){

        Topics topic=Topics.findByName(params.topicNa);
        User user=User.findByUsername(session.user);
        println "topic name ------------------>>>"+params.topicNa
        println "visibility------------------->>>>"+params.selectVisib
        println "topics ---------------------->>>>>"+topic
        if(topic.user.id==user.id){
            topic.visibility=params.selectVisib;

            println "changeed???-------------->"+topic.visibility
            topic.save(flush:true,failOnError: true)
            [success: true, "message": "Visibility Changed !"]


        }
        [success: false, "message": "Permission Denied! Topics Created By Other!"]
    }


     def editProfileChanges(){


         Subscription sub=Subscription.findById(params.subsIdentify)
         sub.topics.name=params.NewTopicName
         sub.seriousness=params.seriousnessChange
         sub.topics.visibility=params.visibilityChange
         sub.validate()
         if(sub.hasErrors()){
            flash.warning="Error! Try Again!"
             redirect(action:"editProfile")
         }
         else{
             sub.save(flush: true,failOnError: true)
             flash.message="Changes Saved! "
             redirect(action:"editProfile")

         }


    }



}
