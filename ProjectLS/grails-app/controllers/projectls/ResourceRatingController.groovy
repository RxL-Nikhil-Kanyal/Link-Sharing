package projectls
import grails.converters.JSON

class ResourceRatingController {

    def createOrUpdateStarRating() {


        Resource resource = Resource.get(params.resourceId)
        User activeUser = User.findByUsername(session.user)
        ResourceRating rating = ResourceRating.findByResourceAndUser(resource, activeUser);

        if (!rating) {
            ResourceRating newRating = new ResourceRating(user: activeUser, resource: resource, score: params.float('newResourceRating'))
            newRating.save(flush: true, failOnError: true)
            render([success:true,message:"Added Rating Successfully!"]as JSON)
        } else {
            rating.score = params.float('newResourceRating')
            rating.save(flush: true, failOnError: true)
            render([success: true,message: "Updated your Rating! New Rating is ${params.float('newResourceRating')}"]as JSON)

        }


    }
}
