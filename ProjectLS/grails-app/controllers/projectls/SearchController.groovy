package projectls

class SearchController {
    TopicsService topicsService
    ResourceRatingService resourceRatingService
    SearchService searchService

    def searchPosts() {
        User au = User.findByUsername(session.user)
        List subscribedTopics =[]
        subscribedTopics=Subscription.findAllByUser(au).topics
        def topicsWithCount = topicsService.trendingTopics();
        if (!params.search && !au.admin) {
            flash.warning="Can not Search Empty String!"
            redirect(controller:'user',action:'dashboard')
        }


        return [activeUser        : au, subbedTopics: subscribedTopics,
                allResource       : searchService.searchInputString(session.user, params.search), trendingTopicsAndCount: topicsWithCount,
                topPostsWithRating: resourceRatingService.getTopRatedPosts(session.user)]
    }

}
