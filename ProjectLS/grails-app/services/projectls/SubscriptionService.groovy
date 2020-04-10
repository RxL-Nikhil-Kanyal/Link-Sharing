package projectls

import grails.gorm.transactions.Transactional

@Transactional
class SubscriptionService {

    def changeSeriousnessMethod(String newSeriousness, String subscriptionId) {

        Subscription subscription = Subscription.get(subscriptionId);
        subscription.seriousness = newSeriousness

        try {
            subscription.save(flush: true, failOnError: true)
        }
        catch (e) {
            return false
        }
        return true
    }

}
