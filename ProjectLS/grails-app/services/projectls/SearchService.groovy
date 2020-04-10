package projectls

import grails.gorm.transactions.Transactional

@Transactional
class SearchService {

    def searchInputString(String activeUsername, String searchString) {

        User activeUser = User.findByUsername(activeUsername)
        String newSearchString = '%' + searchString + '%'
        List finalResource = []


        if (!activeUser) {//auth

            List foundTopic = Topics.findAllByNameIlikeAndVisibility(newSearchString, 'Public')
            if (foundTopic) {//search topic
                finalResource = Resource.findAllByTopicsInList(foundTopic)
                return finalResource
            }

            List foundUser = User.findAllByUsernameIlike(newSearchString)
            if (foundUser) {
                List publicTopics = Topics.findAllByVisibility('Public')
                if (publicTopics) {
                    finalResource = Resource.createCriteria().list() {
                        inList('user', foundUser)
                        inList('topics', publicTopics)
                    }
                    return finalResource

                }
            }//if
            List publicTopics = Topics.findAllByVisibility('Public')
            if (publicTopics) {//search description
                List foundPostDescription = Resource.createCriteria().list() {
                    inList('topics', publicTopics)
                    ilike('name', newSearchString)
                }
                return foundPostDescription
            }
        } else {


            if (activeUser.admin && !searchString) {
                finalResource = Resource.list();
                return finalResource

            } else {

                List SubscribedTopicsByUser = Subscription.findAllByUser(activeUser).topics.name
                List finaltopics=[]
                if(SubscribedTopicsByUser) {
                    finaltopics = Topics.createCriteria().list() {
                        ilike('name', newSearchString)
                        or {
                            inList('name', SubscribedTopicsByUser)
                            eq('visibility', Visibility.valueOf('Public'))
                        }
                    }
                }else{
                    finaltopics = Topics.createCriteria().list() {
                        ilike('name', newSearchString)
                        or {
                            eq('visibility', Visibility.valueOf('Public'))
                        }
                    }

                }

                if (finaltopics) {
                    finalResource = Resource.findAllByTopicsInList(finaltopics)

                    return finalResource

                } else {
                    List allSimilarUser = User.findAllByUsernameIlike(newSearchString)
                    if (allSimilarUser && SubscribedTopicsByUser) {//changed
                        List allTopic = Topics.createCriteria().list() {
                            inList('user', allSimilarUser)
                            or {
                                eq('visibility', Visibility.valueOf('Public'))
                                inList('name', SubscribedTopicsByUser)
                            }
                        }
                        if (allTopic) {
                            finalResource = Resource.findAllByTopicsInList(allTopic)
                            return finalResource
                        }

                    } else {
                        List subbedTopics = Subscription.findAllByUser(activeUser)
                        List allPublicAndSubbedTopics = Topics.findAllByVisibility('Public') + subbedTopics?.topics
                        List allSimilarDescriptions = Resource.createCriteria().list() {
                            ilike('name', newSearchString)
                            inList('topics', allPublicAndSubbedTopics)

                        }
                        return allSimilarDescriptions
                    }
                }


            }

        }


    }
}
