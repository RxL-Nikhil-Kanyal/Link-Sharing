class ResourceRating {
    static belongsTo=[user: User, resource:Resource]
    float score


    static constraints = {




    }
    static mapping = {
        //source-db=""
        table 'ResourceRating'

    }
}
