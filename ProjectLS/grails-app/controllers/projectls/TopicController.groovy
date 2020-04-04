package projectls

import grails.converters.JSON


class TopicController {

    TopicsService topicsService
    ResourceRatingService resourceRatingService
    SearchService searchService

    def createTopicFormAction() {


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
    def topicsShow() {

        User au = User.findByUsername(session.user)
        List subscribedTopics = Subscription.findAllByUser(User.get(au.id)).topics

        render(view:"topicsShow",model:[activeUser: au, subbedTopics: subscribedTopics])

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
        if(!params.search && !au.admin){
            render "Cannot search Empty string! Invalid Search!"
            return
        }


        return [activeUser        : au, subbedTopics: subscribedTopics,
                allResource       : searchService.searchMethod(session.user,params.search), trendingTopicsAndCount: topicsWithCount,
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
        println "+++++++++++++++++   " + params.topicId
        Topics topic = Topics.get(params.topicId)
        println "---------------" + topic

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
    def changeTopicName(){
        Topics topic=Topics.get(params.topicId)
        topic.name=params.newTopicName
        topic.validate();
        if(topic.hasErrors()){
            return
        }else{
            topic.save(flush:true,failOnError:true)
            return true
        }

    }


}
