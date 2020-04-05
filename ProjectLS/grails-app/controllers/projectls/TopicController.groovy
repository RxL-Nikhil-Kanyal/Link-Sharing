package projectls

import grails.converters.JSON


class TopicController {

    TopicsService topicsService
    ResourceRatingService resourceRatingService
    SearchService searchService

    def createTopicFormAction() {

        User x = User.findByUsername(session.user)
        Topics t = new Topics(name: params.newTopicName, user: x.id, visibility: params.topicVisibility)

        t.validate()    //topic creation by user
        if (t.hasErrors()) {

            flash.warning = "An Error Occurred! Topic already Exists! "
            return [success: false] as JSON

        }
        t.save(flush: true, failOnError: true)

        Subscription newSub = new Subscription(user: x.id, topics: t.id, seriousness: "Serious")
        newSub.save(flush: true, failOnError: true)
        flash.message = "Topic Created !"
        return [success: true] as JSON

    }

    def topicsShow() {

        User au = User.findByUsername(session.user)
        List allActiveUserSubs = Subscription.findAllByUser(au)
        List subscribedTopicsByActiveUser = allActiveUserSubs.topics
        List subscriptionsOfTopic = []
        List resourcesOfTopics = []
        Topics topic

        if (params.topicId) {
            topic = Topics.get(params.topicId);
            if (au.admin || topic.visibility == Visibility.valueOf('Public') || subscribedTopicsByActiveUser.contains(topic)) {
                subscriptionsOfTopic = Subscription.findAllByTopics(topic)
                resourcesOfTopics = Resource.findAllByTopics(topic)

            }
        }

        render(view: "topicsShow", model: [activeUser    : au, subbedTopics: subscribedTopicsByActiveUser,
                                           allSubsOfTopic: subscriptionsOfTopic, allResourceOfTopic: resourcesOfTopics,
                                           chosenTopic   : topic, activeUserSubs: allActiveUserSubs])

    }

    def deleteTopic() {

        Topics topic = Topics.get(params.topicId)
        topic.delete(flush: true, failOnError: true)

        flash.message = "Topic Deleted"
        redirect(controller: 'demo', action: 'editProfile')
    }

    def search() {
        User au = User.findByUsername(session.user)
        List subscribedTopics = Subscription.findAllByUser(User.get(au.id)).topics
        def topicsWithCount = topicsService.trendingTopics();
        if (!params.search && !au.admin) {
            render "Cannot search Empty string! Invalid Search!"
            return
        }


        return [activeUser        : au, subbedTopics: subscribedTopics,
                allResource       : searchService.searchMethod(session.user, params.search), trendingTopicsAndCount: topicsWithCount,
                topPostsWithRating: resourceRatingService.getTopRatedPosts(session.user)]
    }

    def changeTopicVisibDash() {

        if (topicsService.changeSeriousnessMethod(params.changeVisibility, params.topicId, session.user)) {
            flash.message = "Changed Visibility Successfully !"
            return true
        } else {
            flash.warning = "Action Restricted! Cannot Change Visibility of others Topics"
            return
        }


    }

    def deleteTopicAjax() {
        User activeUser = User.findByUsername(session.user)
        Topics topic = Topics.get(params.topicId)

        try {
            topic.delete(flush: true, failOnError: true)

        }
        catch (e) {
            flash.warning = "Error deleting Topic"
            return
        }

        flash.message = "Successfully Deleted ${topic.name}"
        return true

    }

    def changeTopicName() {
        Topics topic = Topics.get(params.topicId)
        topic.name = params.newTopicName
        topic.validate();
        if (topic.hasErrors()) {
            return
        } else {
            topic.save(flush: true, failOnError: true)
            return true
        }

    }

    def shareInvite() {

        String userEmail = params.userEmail.trim()
        User invitedUser = User.findByEmail(userEmail)

        if (invitedUser) {
            try {
                sendMail {

                    to invitedUser.email
                    subject "Invite For Topic: " + params.selectedTopicName
                    body 'First Login To your Link sharing Account and then Click the Link here : ' +
                            'http://localhost:9090/topic/subscribeThroughLink?userEmail=' + invitedUser.email + '&topicName=' + params.selectedTopicName
                }
                flash.message = "Invite Mail sent!"
                return true

            } catch (Exception e) {
                flash.warning = "can not send invite Link!"
                return false
            }


        } else {
            flash.warning = "User does not Exist!"
            return false
        }
    }

    def subscribeThroughLink() {

        Topics topic = Topics.findByName(params.topicName)
        User user = User.findByEmail(params.userEmail)

        Subscription newSubscription = Subscription.findByTopicsAndUser(topic, user)
        if (newSubscription) {
            render "Already Subscribed!"
        } else {
            newSubscription = new Subscription(user: user, topics: topic, seriousness: 'Serious')
            newSubscription.validate()
            if (newSubscription.hasErrors()) {
                render "Error ! Try Again Later"
            } else {
                newSubscription.save(flush: true, failOnError: true)
                render "Subscribed To the Topic " + topic.name
            }
        }

    }


}
