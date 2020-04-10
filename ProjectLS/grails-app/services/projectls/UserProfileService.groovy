package projectls

import grails.gorm.transactions.Transactional

@Transactional
class UserProfileService {

    def userProfileInformation(String activeUsername,String otherUserId) {
        User activeUser = User.findByUsername(activeUsername)
        List subscribed = Subscription.findAllByUser(activeUser)
        List subTopics = subscribed.topics
        List userResource = []

        List topicsByUser = Topics.findAllByUser(User.findByUsername(activeUsername))
        List subsOfTopicCreatedByUser=[]

        if (activeUser == User.get(otherUserId)) {
            if(topicsByUser){
                subsOfTopicCreatedByUser = Subscription.createCriteria().list() {

                    inList("topics", topicsByUser)
                    eq('user', User.findByUsername(activeUsername))
                }
            }
            if (!subTopics.isEmpty()) {
                userResource = Resource.createCriteria().list() {
                    eq('user',activeUser)
                }
            }

            return [activeUser        : activeUser, DisplayRes: userResource, subbedTopics: subTopics,
                    subsOfTopicByOUser: subsOfTopicCreatedByUser, usersTopics: topicsByUser,
                    ou                : activeUser, ouSubs: subscribed, ouTopic: topicsByUser]

        } else {
            User otherUser = User.get(otherUserId)
            List ouPublicTopics = Topics?.findAllByVisibilityAndUser("Public", otherUser)
            List allPublicTopics=Topics.findAllByVisibility("Public");
            List totalTopics = topicsByUser + ouPublicTopics +allPublicTopics
            totalTopics=totalTopics.unique()
            List subsOfTopicCreatedByOtherUser
            if(ouPublicTopics){
                subsOfTopicCreatedByOtherUser = Subscription.createCriteria().list() {
                    inList("topics", ouPublicTopics)
                    eq('user', otherUser)
                }
            }

            List subPublic = Subscription.createCriteria().list() {
                and {
                    inList("topics",totalTopics )
                    eq('user',otherUser)
                }
            }
            if (!subPublic?.topics?.isEmpty()) {
                userResource = Resource.createCriteria().list() {
                    inList("topics", subPublic?.topics)
                    eq('user',otherUser)

                }
            }
            return [activeUser        : activeUser, DisplayRes: userResource, subbedTopics: subTopics, usersTopics: topicsByUser,
                    subsOfTopicByOUser: subsOfTopicCreatedByOtherUser, ou: otherUser, ouSubs: subPublic,
                    ouTopic           : ouPublicTopics]
        }

    }
}
