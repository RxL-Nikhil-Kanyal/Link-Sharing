class ReadingItem {
    boolean isRead
    static belongsTo = [user: User, resource: Resource]


    static constraints = {


    }
    static mapping = {
        //source-db=""
        table 'ReadingItem'

    }
}
