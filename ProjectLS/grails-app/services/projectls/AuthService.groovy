package projectls

import grails.gorm.transactions.Transactional

@Transactional
class AuthService {

    def authMehod() {

        List PublicTopics = Topics?.findAllByVisibility("Public")
        List LatestUpdatedPublicTopics = Resource.createCriteria().list(offset: 0, max: 5) {
            and {
                inList("topics", PublicTopics)
                order("lastUpdated", "desc")
            }
        }
        return [recentUpdatedTopics: LatestUpdatedPublicTopics]

    }


}