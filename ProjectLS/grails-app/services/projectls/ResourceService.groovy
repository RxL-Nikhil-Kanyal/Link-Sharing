package projectls

import grails.gorm.transactions.Transactional

@Transactional
class ResourceService {

    def deleteYourResourceMethod(String resourceId) {
        Resource resource = Resource.get(resourceId);

        try {
            resource.delete(flush: true, failOnError: true)

        }
        catch (e) {
            return false
        }

        return true

    }
}
