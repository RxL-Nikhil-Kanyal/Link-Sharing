package projectls

class DemoController {
    static defaultAction = ""

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

    def search() {}

    def dashboard() {
        User au = User.findByUsername(session.user)

        List subscribedTopics = Subscription.findAllByUser(User.get(au.id)).topics

        List L = Subscription.findAllByUser(User.findByUsername(session.user))//display subs


        List topicsByUSer = Topics.findAllByUser(User.findAllByUsername(session.user))


        [activeUser: au, subbedTopics: subscribedTopics, listOfSubs: L, usersTopics: topicsByUSer]


    }

    def createTopicFormAction() {

        println params.newTopicname
        println params.topic.visibility

        println session.user
        User x = User.findByUsername(session.user)

        //topic creation by user

        Topics t = new Topics(name: params.newTopicname, user: x.id, visibility: params.topic.visibility)
        t.save(flush: true, failOnError: true)

        Subscription newSub = new Subscription(user: x.id, topics: t.id, seriousness: "Serious")
        newSub.save(flush: true, failOnError: true)

        flash.message = "Topic added Successfully"
        redirect(action: "dashboard")


    }

    def PublicTopicsShow() {


        println "topic updates recently :---------" + params.topicRelated//res updated

        Resource res = Resource.findById(params.topicRelated)


        List updatedTopics = Resource.findAllByTopics(res?.topics)

        println "this is the list of res:-------" + res

        [recentUpdatedTopics: updatedTopics]


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
        List subscribedTopics = Subscription.findAllByUser(User.get(au.id)).topics

        [activeUser: au, subbedTopics: subscribedTopics]
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
        def user = User.findByUsername(session.user)
        byte[] imageInByte = user.photo
        String encoded = Base64.getEncoder().encodeToString(imageInByte)
        session.setAttribute("userPhoto", encoded)
//        response.contentType = 'image/png ,image/x-png,image/jpeg' // or the appropriate image content type
//        response.outputStream << User.photo
//        response.outputStream.flush()


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
//        def sub = params.res
//        println "here is the downfile res id :====== " + sub
//        def file = new File("${sub.doc}")
//        if (file.exists()) {
//            response.setContentType("application/octet-stream")
//            // or or image/JPEG or text/xml or whatever type the file is
//            response.setHeader("Content-disposition", "attachment;filename=\"${file.name}\"")
//            response.outputStream << file.bytes
//        } else render "Error!" // appropriate error handling

        render "downloading !!!"
    }


}
