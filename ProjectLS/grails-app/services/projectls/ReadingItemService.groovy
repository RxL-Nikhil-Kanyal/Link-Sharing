package projectls

import grails.gorm.transactions.Transactional

@Transactional
class ReadingItemService {

    def unReadResourceMethod(String activeUsername) {

        User activeUser = User.findByUsername(activeUsername)
        List read = ReadingItem.createCriteria().list() {
            eq('isRead', true)
            eq('user', activeUser)
        }.resource.id

        List sub = Subscription.findAllByUser(activeUser).topics.resource.id
        List listSub = []
        listSub = sub.flatten()

        List unRead = []
        if ((listSub - read).size() == 0) {
            return unRead
        } else {
            unRead = Resource?.createCriteria().list() {
                inList("id", (listSub - read))
                order("lastUpdated", "desc")
            }
            return unRead
        }

    }

    def markAsReadByUserMethod(String activeUsername, String resourceId) {
        User activeUser = User.findByUsername(activeUsername)
        Resource res = Resource.get(resourceId)
        ReadingItem hasRead = new ReadingItem(isRead: 1, user: activeUser, resource: res)
        hasRead.validate()
        if (hasRead.hasErrors()) {
            return false
        } else {
            hasRead.save(flush: true, failOnError: true)
            return true
        }

    }


}
