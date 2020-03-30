package projectls




class TopicController {

    TopicsService topicsService

    def createTopicFormAction() {


        println params.newTopicName
        println params.topicVisibility


        println session.user
        User x = User.findByUsername(session.user)

        //topic creation by user

        Topics t = new Topics(name: params.newTopicName, user: x.id, visibility: params.topicVisibility)
        t.validate()
        if (t.hasErrors()) {

//            flash.warning="Topic Already Exists. Try Again!"
//            redirect(action: "dashboard")
            return

        }
        t.save(flush: true, failOnError: true)

        Subscription newSub = new Subscription(user: x.id, topics: t.id, seriousness: "Serious")
        newSub.save(flush: true, failOnError: true)


        return true
//        flash.message = "Topic added Successfully"
//        redirect(action: "dashboard")
    }

    def deleteTopic() {
        println "------------------->" + params.topicId
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
                return [activeUser: au, subbedTopics: subscribedTopics, allResource: Resource.list(), trendingTopicsAndCount: topicsWithCount]
            } else {
                Topics topics = Topics.findByName(params.search)
                if (topics) {
                    List resource = Resource.findAllByTopics(topics)
                    if (!resource) {
                        render "no posts found for topic ${params.search}!"
                    } else {
                        return [activeUser: au, subbedTopics: subscribedTopics, allResource: resource, trendingTopicsAndCount: topicsWithCount]
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
                        return [activeUser: au, subbedTopics: subscribedTopics, allResource: resource, trendingTopicsAndCount: topicsWithCount]
                    }
                }
            }
        }
    }
}
