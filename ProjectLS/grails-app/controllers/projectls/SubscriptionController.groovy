package projectls
import grails.converters.JSON

class SubscriptionController {

    SubscriptionService subscriptionService

    def subscribeTopic() {


        User activeUser = User.findByUsername(session.user);
        Topics topic = Topics.get(params.topicId);

        Subscription newSub = new Subscription(user: activeUser, topics: topic, seriousness: 'Serious');
        newSub.validate();
        if (newSub.hasErrors()) {
            newSub.errors.allErrors.each {
                println it
            }

            render([success: false,message:"Action Unsuccessful" ]as JSON)
        } else {
            newSub.save(flush: true, failOnError: true)

            render([success: true,message:"Subscribe to ${topic.name} Successfully!" ]as JSON)

        }
    }

    def unsubscribeTopic() {

        Topics topic = Topics.findById(params.topicId)
        User user = User.findByUsername(session.user)

        Subscription checkSubscription = Subscription.findByTopicsAndUser(topic, user)
        if (user.id == topic.user.id) {
            render([success: false,message:"Can not UnSubscribe your own Topic!" ]as JSON)
        } else {
            checkSubscription.delete(flush: true, failOnError: true)
            render([success: true,message:"UnSubscribed to ${topic.name}" ]as JSON)
        }
    }

    def changeSeriousness() {

        subscriptionService.changeSeriousnessMethod(params.changedSeriousness, params.subscriptionId);
        Subscription subscription=Subscription.get(params.subscriptionId)

        String successMessage = "Changed Seriousness of ${subscription.topics.name} to ${params.changedSeriousness} "
        render ([success:true,message:successMessage] as JSON)

    }

    def subscribeThroughLink() {

        Topics topic = Topics.findByName(params.topicName)
        User user = User.findByEmail(params.userEmail)

        Subscription newSubscription = Subscription.findByTopicsAndUser(topic, user)
        if (newSubscription) {
            flash.message="Already Subscribed to The Topic!"
            redirect(controller:"user",action:"dashboard")
        } else {
            newSubscription = new Subscription(user: user, topics: topic, seriousness: 'Serious')
            newSubscription.validate()
            if (newSubscription.hasErrors()) {
                render "Error ! Try Again Later"
            } else {
                newSubscription.save(flush: true, failOnError: true)
                flash.message="Subscribed To the Topic ${topic.name}"
                redirect(controller:"user",action:"dashboard")
            }
        }
    }


}
