package projectls

import grails.gorm.transactions.Transactional

@Transactional
class ResourceRatingService {

    def getTopRatedPosts(String activeUsername) {

        List res = []
        List resourcesAvgScore = []
        List Topic = Topics.findAllByVisibility("Public")
        if (Topic) {
            List publicResources = Resource.createCriteria().list() {
                inList('topics', Topic)
            }
            if (publicResources) {


                User u = User.findByUsername(activeUsername)

                if (!u) {
                    res = publicResources
                } else {
                    if (!u.admin) {
                        List usertopic = Topics.findAllByUser(u)
                        res = Resource.createCriteria().list() {
                            inList('topics', Topic + usertopic)
                        }
                    } else {
                        res = Resource.list()
                    }
                }

                resourcesAvgScore = ResourceRating.createCriteria().list() {
                    projections {
                        avg("score", 'avgRating')
                    }
                    groupProperty("resource")
                    order('avgRating', 'desc')
                    inList('resource', res)
                    maxResults(5)
                }


            }

        }

        return resourcesAvgScore
    }
}
