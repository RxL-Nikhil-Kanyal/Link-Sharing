package projectls

import grails.gorm.transactions.Transactional

@Transactional
class ResourceRatingService {

    def getTopRatedPosts(String activeUsername) {

        List resource = []
        List resourcesAvgScore = []
        List Topic = Topics.findAllByVisibility("Public")
        if (Topic) {
            List publicResources = Resource.createCriteria().list() {
                inList('topics', Topic)
            }
            if (publicResources) {

                User user = User.findByUsername(activeUsername)
                if (!user) {
                    resource = publicResources
                } else {
                    if (!user.admin) {
                        List userTopic = Topics.findAllByUser(user)
                        resource = Resource.createCriteria().list() {
                            inList('topics', Topic + userTopic)
                        }
                    } else {
                        resource = Resource.list()
                    }
                }
                resourcesAvgScore = ResourceRating.createCriteria().list() {
                    projections {
                        avg("score", 'avgRating')
                    }
                    groupProperty("resource")
                    order('avgRating', 'desc')
                    inList('resource', resource)
                    maxResults(5)
                }
            }
        }
        return resourcesAvgScore
    }

}
