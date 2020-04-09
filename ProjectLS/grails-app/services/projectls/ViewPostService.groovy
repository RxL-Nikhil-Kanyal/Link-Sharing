package projectls

import grails.gorm.transactions.Transactional

@Transactional
class ViewPostService {
    TopicsService topicsService
    def viewPostInformation(String activeUsername,String topicId,String userId) {
        User activeUser = User.findByUsername(activeUsername)
        List subscribedTopics = Subscription.findAllByUser(activeUser).topics
        Resource resourceOfSelectedTopic

        List allResourceScoreAndCount = []

        if (topicId && userId) {
            resourceOfSelectedTopic = Resource.findByTopicsAndUser(Topics.get(topicId), User.get(userId))

            allResourceScoreAndCount = ResourceRating.createCriteria().list() {
                projections {
                    sum("score")
                    count("user")

                }
                groupProperty("resource")
                eq("resource", resourceOfSelectedTopic)
            }

        }
        ResourceRating userRating = ResourceRating.findByUserAndResource(activeUser, resourceOfSelectedTopic)
        List rating = []
        if (userRating) {
            rating = [userRating.score]
        }

        return [activeUser        : activeUser, subbedTopics: subscribedTopics,
                selectedResoftopic: resourceOfSelectedTopic, trendingTopicsAndCount: topicsService.trendingTopics(),
                userPastRating    : rating, scoreAndCount: allResourceScoreAndCount]

    }
}
