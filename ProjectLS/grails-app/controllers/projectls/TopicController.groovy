package projectls

class TopicController {

    def index() { }

    def createTopicFormAction() {

        println params.newTopicName
        println params.topic.visibility


        println session.user
        User x = User.findByUsername(session.user)

        //topic creation by user

        Topics t = new Topics(name: params.newTopicName, user: x.id, visibility: params.topic.visibility)
        t.validate()
        if(t.hasErrors()){

//            flash.warning="Topic Already Exists. Try Again!"
//            redirect(action: "dashboard")
            return [success: false]
        }
        t.save(flush: true, failOnError: true)

        Subscription newSub = new Subscription(user: x.id, topics: t.id, seriousness: "Serious")
        newSub.save(flush: true, failOnError: true)

        return [success: true]
//        flash.message = "Topic added Successfully"
//        redirect(action: "dashboard")


    }

    def deleteTopic(){
        println "------------------->"+ params.topicId
        Topics topic=Topics.get(params.topicId)

        topic.delete(flush:true,failOnError: true)

        flash.message="Topic Deleted"
        redirect (controller:'demo',action:'editProfile')
    }



}
