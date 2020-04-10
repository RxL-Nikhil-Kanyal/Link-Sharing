package projectls
import grails.converters.JSON

class ResourceController {
    ResourceService resourceService
    ViewPostService viewPostService


    def deleteResource() {

        if (resourceService.deleteYourResourceMethod(params.resourceId)) {
            render([success: true,message: "Post deleted Successfully!Reload to see Changes!"]as JSON)
        } else {
            render([success: false,message: "can Not Delete Post!"]as JSON)
        }
    }

    def updateResource(String resourceId,String newDescription) {

        Resource resource = Resource.get(resourceId);
        resource.name =newDescription
        resource.validate()
        if (resource.hasErrors()) {
            render([success:false,message:"Error Updating resource!"]as JSON)
        } else {
            resource.save(flush: true, failOnError: true)
            render([success:true,message:"Description Changed Successfully!"]as JSON)
        }
    }
    def viewPost() {

        return viewPostService.viewPostInformation(session.user,params.topicId,params.userId)

    }

    def shareLink() {

        Topics topic = Topics.findByName(params.linkTopicName)
        User user = User.findByUsername(session.user)

        LinkResources linkResource = new LinkResources(name: params.linkDesc, URl: params.LinkTopicUrl,
                user: user.id, topics: topic.id)
        linkResource.validate()

        if (linkResource.hasErrors()) {
            render ([success: false,message: "Please Enter a Valid URL"] as JSON)
        } else {
            linkResource.save(flush: true, failOnError: true)
            ReadingItem readingItem = new ReadingItem(isRead: 'true', user: user, resource: linkResource)
            readingItem.save(flush: true, failOnError: true)

            render ([success: true,message: "Resource Added to ${topic.name}"] as JSON)
        }

    }

    def shareDocument() {
        Topics topic = Topics.findByName(params.docChosenTopic)
        User user = User.findByUsername(session.user)
        DocumentResources docResource = new DocumentResources(name: params.myDocField, user: user.id, topics: topic.id)

        def file =request.getFile("docfile")
        byte[] doc = file.bytes
        docResource.doc=doc

        docResource.validate()

        if (docResource.hasErrors()) {
            docResource.errors.allErrors.each {
                println it
            }
            flash.warning = "Error ,Please Try Again"
        } else {
            docResource.save(flush: true, failOnError: true)

            ReadingItem readingItem = new ReadingItem(isRead: 'true', user: user, resource: docResource)
            readingItem.save(flush: true, failOnError: true)
            flash.message = "Added Resource Successfully"
        }

        redirect(controller: "user", action: "dashboard")
    }

    def downloadFile = {

        DocumentResources docRes = DocumentResources.findById(params.res)
        response.setHeader("Content-Type", "application/octet-stream;")
        response.setHeader("Content-Disposition", "attachment; filename=\"" + "document" + "\"")
        response.outputStream << docRes.doc

    }

}
