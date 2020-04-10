

class Resource {
    String name//description
    static belongsTo = [user: User, topics: Topics]
    Date dateCreated
    Date lastUpdated
    static hasmany = [readingItem: ReadingItem, resourceRating: ResourceRating]

    static constraints = {
        name blank: false

    }
    static mapping = {

        table 'Res'
        name column: "name", sqlType: "varchar(5000)"
//        readingItem cascade: 'all-delete-orphan'
//        resourceRating cascade: 'all-delete-orphan'
    }
}
