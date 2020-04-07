package projectls
import grails.converters.JSON

class ResourceController {
    ResourceService resourceService


    def deleteResource() {

        if (resourceService.deleteYourResourceMethod(params.resourceId)) {
            flash.message = "Post Deleted!"
            return true
        } else {
            flash.warning = "Error in deleting Post!"
            return
        }
    }

    def updateResource() {

        Resource resource = Resource.get(params.resourceId);
        resource.name = params.newDescription
        resource.validate()
        if (resource.hasErrors()) {
            render([success:false,message:"Error Updating resource!"]as JSON)
        } else {
            resource.save(flush: true, failOnError: true)
            render([success:true,message:"Description Changed Successfully!"]as JSON)
        }
    }

    def downloadFile = {

        DocumentResources docRes = DocumentResources.findById(params.res)
        response.setHeader("Content-Type", "application/octet-stream;")
        response.setHeader("Content-Disposition", "attachment; filename=\"" + "document" + "\"")
        response.outputStream << docRes.doc

    }

}
