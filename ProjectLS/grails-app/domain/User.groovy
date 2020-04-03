class User {

    String email
    String username
    String password
    String firstName
    String lastName
    byte[] photo
    boolean admin
    boolean active
    Date dateCreated
    Date lastUpdated

    static hasMany = [topics        : Topics, subscription: Subscription,
                      resource      : Resource, readingItem: ReadingItem,
                      resourceRating: ResourceRating]


    static constraints = {

        email(unique: true, email: true)
        username blank: false, unique: true
        password size: 8..12, blank: false

        firstName blank: false, nullable: false
        lastName blank: false, nullable: false

        photo(nullable: true, maxSize: 1073741824)//4gb max


    }
    static mapping = {
        //source-db=""
        table 'usr'


    }
}
