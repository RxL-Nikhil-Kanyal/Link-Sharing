package projectls

import grails.gorm.transactions.Transactional

@Transactional
class TopicsService {

    def serviceMethod() {

    }
    def trendingTopics(){

        def result = Resource.createCriteria().list() {//trendingPublicTopic
            projections {
                count("id", 'myCount')
            }
            groupProperty("topics")
            order ('myCount', 'desc')
            maxResults(5)
        }
        return result

    }
}
