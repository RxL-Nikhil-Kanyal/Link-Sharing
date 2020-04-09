package projectls

class PublicResourcesController {
    SearchService searchService

    def publicTopicsShow(String topicRelated,String searchedStringAtHomePage) {

        if (topicRelated) {
            Resource resource = Resource.findById(topicRelated)
            List updatedTopics = Resource.findAllByTopics(resource?.topics)

            return [recentUpdatedTopics: updatedTopics]
        } else {
            if (!searchedStringAtHomePage) {
                flash.warning="Invalid Search! "
                redirect (uri:"")
            }
            String noActiveUser = '';
            return [recentUpdatedTopics: searchService.searchInputString(noActiveUser, searchedStringAtHomePage)]

        }
    }

    def userImage() {
        def user = User.get(params.userId)
        byte[] imageInByte = user.photo
        response.contentType = 'image/png/jpeg'
        response.outputStream << imageInByte
        response.outputStream.flush()
    }

    def downloadFile = {
        DocumentResources docRes = DocumentResources.findById(params.res)
        response.setHeader("Content-Type", "application/octet-stream;")
        response.setHeader("Content-Disposition", "attachment; filename=\"" + "document" + "\"")
        response.outputStream << docRes.doc

    }
}
