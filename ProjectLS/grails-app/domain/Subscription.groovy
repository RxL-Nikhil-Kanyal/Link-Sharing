class Subscription {
    static belongsTo = [user: User, topics: Topics]
    Date dateCreated
    Seriousness seriousness


    static constraints = {


    }
    static mapping = {
        //source-db=""
        table 'Subscription'

    }
}
