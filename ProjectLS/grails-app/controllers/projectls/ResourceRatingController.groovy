package projectls

class ResourceRatingController {

    def createOrUpdateStarRating(){
        println "0000000000000000000 "+params.resourceId+"============="+params.newResourceRating

        Resource res=Resource.get(params.resourceId)
        User activeUser=User.findByUsername(session.user)
        ResourceRating rating=ResourceRating.findByResourceAndUser(res,activeUser);

        if(!rating){
            ResourceRating newRating=new ResourceRating(user:activeUser,resource:res,score:params.float('newResourceRating'))
            newRating.save(flush:true,failOnError:true)
            return true
        }else{
            rating.score=params.float('newResourceRating')
            rating.save(flush:true,failOnError: true)
            return true

        }


    }
}