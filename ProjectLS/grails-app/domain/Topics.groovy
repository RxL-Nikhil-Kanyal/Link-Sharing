


class Topics {


    String name
    static belongsTo=[user:User]
    Date dateCreated
    Date dateUpdated
    Visibility visibility
    static hasMany=[resource:Resource]

    static constraints = {


        name blank:false,unique:true


    }
    static mapping = {
        //source-db=""
        table 'topics'

    }

}