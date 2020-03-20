//class LinkReource ,DocumentResource

class Resource {
    String name
    static belongsTo =[user: User, topics: Topics]
    Date dateCreated
    Date dateUpdated
    static hasmany=[readingItem:ReadingItem, resourceRating: ResourceRating]


    static constraints = {


        name blank:false

    }
    static mapping = {
        //source-db=""
        table 'Res'

    }
}
