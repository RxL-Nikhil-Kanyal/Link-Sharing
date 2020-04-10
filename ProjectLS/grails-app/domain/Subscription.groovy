class Subscription {
    static belongsTo = [user: User, topics: Topics]
    Date dateCreated
    Seriousness seriousness


    static constraints = {


    }
    static mapping = {
        table 'Subscription'

    }
}
