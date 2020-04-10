package projectls

import grails.gorm.transactions.Transactional

@Transactional
class TopicsService {

    def trendingTopics() {

        List result = Resource.createCriteria().list() {
            projections {
                count("id", 'myCount')
            }
            groupProperty("topics")
            order('myCount', 'desc')
            maxResults(5)
        }
        return result

    }

    def changeVisibilityOfTopic(String visibility, String topicId, String activeUsername) {

        Topics topic = Topics.get(topicId);
        User activeUser = User.findByUsername(activeUsername);
        if ((topic.user.username == activeUsername) || activeUser.admin) {
            topic.visibility = visibility
            topic.validate()
            if (topic.hasErrors()) {
                return false
            }
            topic.save(flush: true)
            return true
        } else {
            return false
        }


    }
}
