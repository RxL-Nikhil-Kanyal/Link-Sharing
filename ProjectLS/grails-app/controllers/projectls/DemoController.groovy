package projectls


class DemoController {
    TopicsService topicsService
    ReadingItemService readingItemService
    ResourceRatingService resourceRatingService

    static defaultAction = "dashboard"

    def adminTopics() {

        User au = User.findByUsername(session.user)
        List subscriptionOfUser=Subscription.findAllByUser(au)
        List subscribedTopics = subscriptionOfUser.topics
        def topicsWithCount = topicsService.trendingTopics();
        List allTopics=Topics.list();
        return [activeUser        : au, subbedTopics: subscribedTopics,listOfSubs:subscriptionOfUser,
                trendingTopicsAndCount: topicsWithCount,allTheTopics:allTopics,
                topPostsWithRating: resourceRatingService.getTopRatedPosts(session.user)]
    }


    def dashboard() {
        User au = User.findByUsername(session.user)
        List subscribedTopics = Subscription.findAllByUser(au).topics
        List listSub = Subscription.findAllByUser(au)//display subs of user
        List topicsByUser = Topics.findAllByUser(User.findAllByUsername(session.user))
        def topicsWithCount = topicsService.trendingTopics();//trend

        List UnReadResources = readingItemService.unReadResourceMethod(session.user)

        [activeUser : au, subbedTopics: subscribedTopics, listOfSubs: listSub,
         usersTopics: topicsByUser, trendingTopicsAndCount: topicsWithCount, userUnReadResource: UnReadResources]


    }


    def UsersA() {
        def persons = User.list()
        User au = User.findByUsername(session.user)
        List subscribedTopics = Subscription.findAllByUser(User.get(au.id)).topics

        return [usr: persons, activeUser: au, subbedTopics: subscribedTopics]

    }

    def editProfile() {

        User au = User.findByUsername(session.user)
        List subscribedTopics = Subscription.findAllByUser(User.get(au.id)).topics
        List topicsByUser = Topics.findAllByUser(User.findByUsername(session.user))

        if (!topicsByUser.isEmpty()) {
            List UserCreatedAndSubTopics = Subscription.createCriteria().list() {

                inList("topics", topicsByUser)
            }
            return [activeUser: au, subbedTopics: subscribedTopics, userSubbedTopics: UserCreatedAndSubTopics]
        }
        return [activeUser: au, subbedTopics: subscribedTopics]
    }

    def viewPost() {

        User au = User.findByUsername(session.user)
        List subscribedTopics = Subscription.findAllByUser(User.get(au.id)).topics
        Resource resourceOfSelectedTopic

        List allResourceScoreAndCount = []

        if (params.topicId && params.userId) {
            resourceOfSelectedTopic = Resource.findByTopicsAndUser(Topics.get(params.topicId), User.get(params.userId))

            allResourceScoreAndCount = ResourceRating.createCriteria().list() {
                projections {
                    sum("score")
                    count("user")

                }
                groupProperty("resource")
                eq("resource", resourceOfSelectedTopic)
            }

        }
        ResourceRating userRating = ResourceRating.findByUserAndResource(au, resourceOfSelectedTopic)
        List rating = []
        if (userRating) {
            rating = [userRating.score]
        }

        return [activeUser        : au, subbedTopics: subscribedTopics,
                selectedResoftopic: resourceOfSelectedTopic, trendingTopicsAndCount: topicsService.trendingTopics(),
                userPastRating    : rating, scoreAndCount: allResourceScoreAndCount]


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

                flash.warning = "Error, Please try again!"
                redirect(action: "editProfile")
            }

            redirect(action: "editProfile")
            flash.message = "Password changed"
        } else {
            redirect(action: "editProfile")
            flash.warning = "Password and Confirm Password do not match"

        }
    }

    def changeUserDeatails() {

        User user = User.findByUsername(session.user)

        if (params.changeUsername) {
            user.username = params.changeUsername
        }
        if (params.changeFirstname) {
            user.firstName = params.changeFirstname
        }
        if (params.changeLastname) {
            user.lastName = params.changeLastname
        }
        if(params.changePhoto.size!=0){

            def file =request.getFile("changePhoto")
            byte[] photo = file.bytes
            user.photo=photo
        }
        try {
            flash.message = "Changes Successfull"
            user.save(flush: true, failOnError: true)
        } catch(e) {
            flash.warning = "Error! Try another Image!"
        }

        redirect(action: "editProfile")



    }

    def userProfile() {


        User au = User.findByUsername(session.user)
        List subscribed = Subscription.findAllByUser(au)
        List subTopics = subscribed.topics
        List R = []

        List topicsByUser = Topics.findAllByUser(User.findByUsername(session.user))

        //get from link
        if (au == User.get(params.otherUserId)) {
            List subsOfTopicCreatedByUser = Subscription.createCriteria().list() {

                inList("topics", topicsByUser)
                eq('user', User.findByUsername(session.user))

            }
            if (!subTopics.isEmpty()) {
                R = Resource.createCriteria().list() {//posts
                    inList("topics", subTopics)
                }
            }

            return [activeUser        : au, DisplayRes: R, subbedTopics: subTopics,
                    subsOfTopicByOUser: subsOfTopicCreatedByUser, usersTopics: topicsByUser,
                    ou                : au, ouSubs: subscribed, ouTopic: topicsByUser]

        } else {
            User otherUser = User.get(params.otherUserId)
            List ouPublicTopics = Topics?.findAllByVisibilityAndUser("Public", otherUser)
            List totalTopics = topicsByUser + ouPublicTopics

            List subsOfTopicCreatedByOtherUser = Subscription.createCriteria().list() {
                inList("topics", ouPublicTopics)
                eq('user', otherUser)

            }
//            List subPublic = Subscription.createCriteria().list() {
//                and {
//                    inList("topics", ouPublicTopics)
//                }
//            }
            List subPublic = Subscription.createCriteria().list() {
                and {
                    inList("topics",totalTopics )
                    eq('user',otherUser)

                }
            }

            if (!subPublic?.topics?.isEmpty()) { ///posts
                R = Resource.createCriteria().list() {
                    inList("topics", subPublic?.topics)

                }

            }
            return [activeUser        : au, DisplayRes: R, subbedTopics: subTopics, usersTopics: topicsByUser,
                    subsOfTopicByOUser: subsOfTopicCreatedByOtherUser, ou: otherUser, ouSubs: subPublic,
                    ouTopic           : ouPublicTopics]

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

        def user = User.get(params.userId)
        byte[] imageInByte = user.photo
        response.contentType = 'image/png/jpeg'
        response.outputStream << imageInByte
        response.outputStream.flush()

    }

    def ShareLinkAction() {

        Topics t = Topics.findByName(params.linkTopicName)
        User u = User.findByUsername(session.user)


        LinkResources linkResource = new LinkResources(name: params.linkDesc, URl: params.LinkTopicUrl,
                user: u.id, topics: t.id)
        linkResource.validate()

        if (linkResource.hasErrors()) {
            linkResource.errors.allErrors.each {
                println it
            }
            flash.warning = "Error! "
            return
        } else {
            linkResource.save(flush: true, failOnError: true)
            ReadingItem readingItem = new ReadingItem(isRead: 'true', user: u, resource: linkResource)
            readingItem.save(flush: true, failOnError: true)
            flash.message = "Added Resource Successfully"
            return true
        }

    }

    def shareDocAction() {
        Topics t = Topics.findByName(params.docChosenTopic)
        User u = User.findByUsername(session.user)


        DocumentResources docResource = new DocumentResources(name: params.myDocField, user: u.id, topics: t.id)

        def file =request.getFile("docfile")
        byte[] doc = file.bytes
        docResource.doc=doc


        docResource.validate()

        if (docResource.hasErrors()) {
            docResource.errors.allErrors.each {
                println it
            }
            flash.warning = "Error ,Please Try Again"
        } else {
            docResource.save(flush: true, failOnError: true)

            ReadingItem readingItem = new ReadingItem(isRead: 'true', user: u, resource: docResource)
            readingItem.save(flush: true, failOnError: true)
            flash.message = "Added Resource Successfully"
        }

        redirect(action: "dashboard")
    }

    def unsubscribeAction() {

        Topics topic = Topics.findById(params.topicinfo)

        println "this is the topic here: " + topic
        User u = User.findByUsername(session.user)
        Subscription checksub = Subscription.findByTopicsAndUser(topic, u)

        if (u.id == topic.user.id) {

            flash.warning = "can not UnSubcribe your own Topic!"

            redirect(action: "dashboard")

        } else {
            checksub.delete(flush: true, failOnError: true)
            flash.message = "Unsubscibed "
            redirect(action: "dashboard")
        }

    }


    def changeVisibFromDash() {

        Topics topic = Topics.findByName(params.topicNa);
        User user = User.findByUsername(session.user);

        if (topic.user.id == user.id) {
            topic.visibility = params.selectVisib;
            topic.save(flush: true, failOnError: true)
            [success: true, "message": "Visibility Changed !"]


        }
        [success: false, "message": "Permission Denied! Topics Created By Other!"]
    }


    def editProfileChanges() {

        Subscription sub = Subscription.findById(params.subsIdentify)
        sub.topics.name = params.NewTopicName
        sub.seriousness = params.seriousnessChange
        sub.topics.visibility = params.visibilityChange
        sub.validate()
        if (sub.hasErrors()) {
            flash.warning = "Error! Try Again!"
            redirect(action: "editProfile")
        } else {
            sub.save(flush: true, failOnError: true)
            flash.message = "Changes Saved! "
            redirect(action: "editProfile")

        }
    }

}
