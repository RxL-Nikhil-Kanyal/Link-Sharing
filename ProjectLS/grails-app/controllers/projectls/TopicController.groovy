package projectls

import grails.converters.JSON


class TopicController {

    TopicsService topicsService
    ResourceRatingService resourceRatingService
    SearchService searchService

    def createTopicFormAction() {

        User user = User.findByUsername(session.user)
        Topics topic = new Topics(name: params.newTopicName, user: user.id, visibility: params.topicVisibility)

        topic.validate()    //topic creation by user
        if (topic.hasErrors()) {
            render ([success: false,message:"Topic Already Exists!"] as JSON)
        }
        topic.save(flush: true, failOnError: true)

        Subscription newSub = new Subscription(user: user.id, topics: topic.id, seriousness: "Serious")
        newSub.save(flush: true, failOnError: true)

        render ([success: true,message:"Topic ${topic.name} Created !"] as JSON)

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

    def adminTopics() {

        User au = User.findByUsername(session.user)
        List subscriptionOfUser = Subscription.findAllByUser(au)
        List subscribedTopics = subscriptionOfUser.topics
        List allTopics = Topics.list();
        return [activeUser            : au, subbedTopics: subscribedTopics, listOfSubs: subscriptionOfUser,
                trendingTopicsAndCount: topicsService.trendingTopics(), allTheTopics: allTopics,
                topPostsWithRating    : resourceRatingService.getTopRatedPosts(session.user)]
    }

    def changeTopicVisibility() {
        Topics topic=Topics.get(params.topicId)

        if (topicsService.changeVisibilityOfTopic(params.changeVisibility, params.topicId, session.user)) {
            String successMessage = "Changed Visibility of ${topic.name} to ${params.changeVisibility}"
            render ([success: true,message:successMessage] as JSON)
        } else {
            String restrictedMessage= "Action Restricted! Only Owners can change Visibility "
            render ([success: false,message:restrictedMessage] as JSON)
        }


    }

    def deleteTopic() {
        User activeUser = User.findByUsername(session.user)
        Topics topic = Topics.get(params.topicId)
        try {
            topic.delete(flush: true, failOnError: true)
        }
        catch (Exception e)  {
            render ([sucess:false,message:" Error deleting Topic ${topic.name}"]as JSON)
        }
        render ([sucess:true,message:" Successfully Deleted ${topic.name}"]as JSON)

    }

    def changeTopicName() {
        Topics topic = Topics.get(params.topicId)
        topic.name = params.newTopicName
        topic.validate();
        if (topic.hasErrors()) {
            render([success: false,message: "Error Changing Topic!"])
        } else {
            topic.save(flush: true, failOnError: true)
            render([success:true,message:"Topic Name Changed to ${params.newTopicName}"]as JSON)
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
                            'http://localhost:9090/subscription/subscribeThroughLink?userEmail=' + invitedUser.email + '&topicName=' + params.selectedTopicName
                }

            } catch (Exception e) {
                render([success: false,message: "Error sending Invite "]as JSON)
            }
            render([success: true,message: "Invite Sent to ${invitedUser.email} for topic ${params.selectedTopicName} "]as JSON)
        } else {
            render([success: false,message: "Can not Send Invite! Check the Email Again! "]as JSON)
        }
    }



}
