class Topics {


    String name
    static belongsTo = [user: User]
    Date dateCreated
    Date lastUpdated
    Visibility visibility
    static hasMany = [resource: Resource, subscription: Subscription]

    static constraints = {


        name blank: false, unique: true


    }
    static mapping = {
        //source-db=""
        table 'topics'

        resource cascade: 'all-delete-orphan'
        subscription cascade: 'all-delete-orphan'

    }

}
