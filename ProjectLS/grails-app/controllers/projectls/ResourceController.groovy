package projectls

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


        Resource res = Resource.get(params.resourceId);
        res.name = params.newDescription
        res.validate()
        if (res.hasErrors()) {
            flash.warning = "Error Updating Resource! "
            return
        } else {
            res.save(flush: true, failOnError: true)
            flash.message = "Description Changed Successfully!"
            return true
        }

    }

    def downloadFile = {

        DocumentResources docRes = DocumentResources.findById(params.res)
        response.setHeader("Content-Type", "application/octet-stream;")
        response.setHeader("Content-Disposition", "attachment; filename=\"" + "document" + "\"")
        response.outputStream << docRes.doc

    }

}
