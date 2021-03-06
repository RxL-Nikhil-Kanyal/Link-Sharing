package projectls
import grails.converters.JSON

class UserController {
    TopicsService topicsService
    ResourceRatingService resourceRatingService
    ReadingItemService readingItemService
    UserProfileService userProfileService

    static defaultAction = "dashboard"

    def dashboard() {
        User activeUser = User.findByUsername(session.user)
        List subscribedTopics = Subscription.findAllByUser(activeUser).topics
        List listOfSubscriptions = Subscription.findAllByUser(activeUser)
        List topicsByUser = Topics.findAllByUser(activeUser)

       render(view:'dashboard',model: [activeUser        : activeUser, subbedTopics: subscribedTopics, listOfSubs: listOfSubscriptions,
         usersTopics       : topicsByUser, trendingTopicsAndCount: topicsService.trendingTopics(),
         userUnReadResource: readingItemService.unReadResourceMethod(session.user)])

    }

    def updateUserProfile() {

        User user = User.findByUsername(session.user)
        if (params.changeUsername) {
            if (User.findByUsername(params.changeUsername)) {
                flash.warning = "Error! Username Already Taken!"
            } else {
                user.username = params.changeUsername
                flash.message = "Changes Successful!"
                session.user = params.changeUsername
            }
        }
        if (params.changeFirstname) {
            user.firstName = params.changeFirstname
        }
        if (params.changeLastname) {
            user.lastName = params.changeLastname
        }
        if (params.changePhoto.size != 0) {
            def file = request.getFile("changePhoto")
            byte[] photo = file.bytes
            user.photo = photo
        }
        try {
            user.save(flush: true)
        } catch (e) {
            flash.warning = "Error! Try another Image!"
        }

        redirect(controller: 'user', action: "editProfile")

    }

    def editProfile() {

        User activeUser = User.findByUsername(session.user)
        List subscribedTopics = Subscription.findAllByUser(activeUser).topics
        List topicsByUser = Topics.findAllByUser(activeUser)
        List UserCreatedAndSubTopics=[]
        if (!topicsByUser.isEmpty()) {
            UserCreatedAndSubTopics = Subscription.createCriteria().list() {
                inList("topics", topicsByUser)
            }
            return [activeUser: activeUser, subbedTopics: subscribedTopics, userSubbedTopics: UserCreatedAndSubTopics]
        }
        return [activeUser: activeUser, subbedTopics: subscribedTopics]
    }

    def userProfile() {

        return userProfileService.userProfileInformation(session.user,params.otherUserId)
    }

    def updateUserPassword(String changePassword,String changeConfirmPassword) {

        if (changePassword == changeConfirmPassword) {
            User user = User.findByUsername(session.user)
            user.password = changePassword
            user.save(flush: true)

            if (user.hasErrors()) {
                flash.warning = "Error, Please try again!"
                redirect(controller:'user' ,action: "editProfile")
            }

            redirect(controller:'user' ,action: "editProfile")
            flash.message = "Password changed"
        } else {
            redirect(controller: 'user', action: "editProfile")
            flash.warning = "Password and Confirm Password do not match"

        }
    }

    def displayAllUsersForAdmin() {
        List persons = User.list()
        User activeUser = User.findByUsername(session.user)
        List subscribedTopics = Subscription.findAllByUser(activeUser).topics

        return [allUsers: persons, activeUser: activeUser, subbedTopics: subscribedTopics]
    }

    def changeUserActiveStatus(String userId) {
        User otherUser = User.get(userId)
        if (otherUser.active) {
            otherUser.active = 0
        } else {
            otherUser.active = 1
        }
        otherUser.save(flush: true)
        render ([success:true,message:"Changed ${otherUser.username}s status to ${otherUser.active} ",newValue:otherUser.active]as JSON)
    }

    def fetchPersonImage() {

        def user = User.get(params.userId)
        byte[] imageInByte = user.photo
        response.contentType = 'image/png/jpeg'
        response.outputStream << imageInByte
        response.outputStream.flush()
    }
}
