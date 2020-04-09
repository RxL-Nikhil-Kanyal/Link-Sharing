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
        List listSub = Subscription.findAllByUser(activeUser)//display subs of user
        List topicsByUser = Topics.findAllByUser(activeUser)
        def trendingTopicsWithCount = topicsService.trendingTopics();//trend

        List UnReadResources = readingItemService.unReadResourceMethod(session.user)

        [activeUser : activeUser, subbedTopics: subscribedTopics, listOfSubs: listSub,
         usersTopics: topicsByUser, trendingTopicsAndCount: trendingTopicsWithCount, userUnReadResource: UnReadResources]

    }

    def updateUserProfile() {

        User user = User.findByUsername(session.user)

        if (params.changeUsername) {
            if(User.findByUsername(params.changeUsername)){
                flash.warning="Error! Username Already Taken!"

            }else{
                user.username = params.changeUsername
                flash.message = "Changes Successful!"
                session.user=params.changeUsername
            }

        }
        if (params.changeFirstname) {
            user.firstName = params.changeFirstname
        }
        if (params.changeLastname) {
            user.lastName = params.changeLastname
        }
        if(params.changePhoto.size!=0){

            def file =request.getFile("changePhoto")
            byte[] photo = file.bytes
            user.photo=photo
        }
        try {

            user.save(flush: true, failOnError: true)
        } catch(e) {
            flash.warning = "Error! Try another Image!"
        }

        redirect(controller:'user' , action: "editProfile")

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

    def updateUserPassword() {

        if (params.changePassword == params.changeConfirmPassword) {
            User user = User.findByUsername(session.user)
            user.password = params.changePassword
            user.save(flush: true, failOnError: true)

            if (user.hasErrors()) {
                user.errors.allErrors.each {
                    println it
                }

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

    def allUsersForAdmin() {
        def persons = User.list()
        User au = User.findByUsername(session.user)
        List subscribedTopics = Subscription.findAllByUser(au).topics

        return [usr: persons, activeUser: au, subbedTopics: subscribedTopics]
    }

    def changeUserActiveStatus(String userId) {
        User otherUser = User.get(userId)
        if (otherUser.active) {
            otherUser.active = 0
        } else {
            otherUser.active = 1
        }
        otherUser.save(flush: true, failOnError: true)
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
