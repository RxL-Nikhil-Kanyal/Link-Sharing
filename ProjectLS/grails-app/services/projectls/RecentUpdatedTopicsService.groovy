package projectls

import grails.gorm.transactions.Transactional

@Transactional
class RecentUpdatedTopicsService {

    List topRecentUpdatedPublicTopics() {

        List publicTopics = Topics.findAllByVisibility("Public")
        List latestUpdatedPublicTopics=[]
        if(publicTopics){
            latestUpdatedPublicTopics = Resource.createCriteria().list() {
                and {
                    inList("topics", publicTopics)
                    order("lastUpdated", "desc")
                }
                maxResults(5)
            }
        }


        return latestUpdatedPublicTopics

    }
}
