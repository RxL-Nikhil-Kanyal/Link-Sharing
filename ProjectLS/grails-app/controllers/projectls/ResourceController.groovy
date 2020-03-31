package projectls

class ResourceController {
    ResourceService resourceService

    def index() { }

    def deleteResource(){

        println "000000000000000000000000  "+ params.resourceId;

        if(resourceService.deleteYourResourceMethod(params.resourceId)){
            flash.message="Post Deleted!"
            return true
        }else{
            flash.warning="Error in deleting Post!"
            return

        }


    }
}
