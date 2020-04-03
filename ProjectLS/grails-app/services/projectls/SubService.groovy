package projectls

import grails.gorm.transactions.Transactional

@Transactional
class SubService {

    def changeSeriousnessMethod(String newSeriousness, String subscriptionId) {


        Subscription sub = Subscription.get(subscriptionId);
        sub.seriousness = newSeriousness
        sub.save(flush: true, failOnError: true)
        return
    }

}
