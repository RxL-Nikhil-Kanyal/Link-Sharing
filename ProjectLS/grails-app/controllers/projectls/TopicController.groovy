package projectls

import grails.converters.JSON


class TopicController {

    TopicsService topicsService
    ResourceRatingService resourceRatingService

    def createTopicFormAction() {


        println params.newTopicName
        println params.topicVisibility


        println session.user
        User x = User.findByUsername(session.user)


        Topics t = new Topics(name: params.newTopicName, user: x.id, visibility: params.topicVisibility)
        //topic creation by user
        t.validate()
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
        //search
        if (au.admin) {
            if (!params.search) {
                return [activeUser            : au, subbedTopics: subscribedTopics, allResource: Resource.list(),
                        trendingTopicsAndCount: topicsWithCount,
                        topPostsWithRating    : resourceRatingService.getTopRatedPosts(session.user)]
            } else {
                Topics topics = Topics.findByName(params.search)
                if (topics) {
                    List resource = Resource.findAllByTopics(topics)
                    if (!resource) {
                        render "no posts found for topic ${params.search}!"
                    } else {
                        return [activeUser        : au, subbedTopics: subscribedTopics,
                                allResource       : resource, trendingTopicsAndCount: topicsWithCount,
                                topPostsWithRating: resourceRatingService.getTopRatedPosts(session.user)]
                    }
                } else {
                    render "This Topic Does not Exist! "
                }
            }
        } else {
            if (!params.search) {
                render "Error ! Action Prohibited ! Can not Search null ! Try Again"
            } else {
                List topics = Topics.findAllByNameAndVisibility(params.search, "Public") + Topics.findAllByNameAndUser(params.searach, au)
                topics = topics.unique()
                if (!topics) {
                    render "error , The searched Topic either Does not exsist or you Do not have Access."
                } else {
                    List resource = Resource.findAllByTopicsInList(topics)
                    if (!resource) {
                        render "no posts found about the topic!"
                    } else {
                        return [activeUser        : au, subbedTopics: subscribedTopics,
                                allResource       : resource, trendingTopicsAndCount: topicsWithCount,
                                topPostsWithRating: resourceRatingService.getTopRatedPosts(session.user)]
                    }
                }
            }
        }
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
        println "+++++++++++++++++   " + params.topicId
        Topics topic = Topics.get(params.topicId)
        println "---------------" + topic

        try {
            topic.delete(flush: true, failOnError: true)
//            topic.findAll().each { it.delete(flush:true, failOnError:true) }

        }
        catch (e) {
            flash.warning = "Error deleting Topic"
            return
        }

        flash.message = "Successfully Deleted ${topic.name}"
        return true

    }


}
