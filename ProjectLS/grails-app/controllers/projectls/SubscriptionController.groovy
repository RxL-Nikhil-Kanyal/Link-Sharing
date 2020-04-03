package projectls

class SubscriptionController {

    SubService subService

    def subscribeTopic() {


        User activeUser = User.findByUsername(session.user);
        Topics topic = Topics.get(params.topicsId);


        Subscription newSub = new Subscription(user: activeUser, topics: topic, seriousness: 'Serious');
        newSub.validate();
        if (newSub.hasErrors()) {
            newSub.errors.allErrors.each {
                println it
            }
            flash.warning = "Error ! Action Unsuccessful"
            redirect(controller: 'demo', action: 'dashboard')
        } else {
            newSub.save(flush: true, failOnError: true)
            flash.message = "Subcribed to ${topic.name} Successfully"
            redirect(controller: 'demo', action: 'dashboard')

        }
    }

    def changeSeriousnessDash() {

        subService.changeSeriousnessMethod(params.changedSeriousness, params.subscriptionId);
        flash.message = "Changes Successful!"
        return true

    }


}
