class ResourceRating {
    static belongsTo=[user: User, resource:Resource]
    int score


    static constraints = {

     score (range: 0..6)


    }
    static mapping = {
        //source-db=""
        table 'ResourceRating'

    }
}
