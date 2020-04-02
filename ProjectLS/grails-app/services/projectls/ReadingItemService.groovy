package projectls

import grails.gorm.transactions.Transactional

@Transactional
class ReadingItemService {

    def unReadResourceMethod(String activeUsername) {
        println "==================="+activeUsername
        User au=User.findByUsername(activeUsername)
        println "==================="+au
        List l=ReadingItem.createCriteria().list(){
            eq('isRead',true)
            eq('user',au)
        }.resource.id
        println "===================="+l

        List s=Subscription.findAllByUser(au).topics.resource.id

        println "==================="+s
        List k=[]
        k=s.flatten()
        println "==================="+k
        List unRead=[]
        if((k-l).size()==0){
            return unRead
        }else{
            unRead=Resource?.createCriteria().list(){
                inList("id",(k-l))
                order("lastUpdated","desc")
            }
            return unRead
        }

    }

    def markAsReadByUserMethod(String activeUsername,String resourceId){
        User activeUser=User.findByUsername(activeUsername)
        Resource res=Resource.get(resourceId)
        ReadingItem hasRead=new ReadingItem(isRead:1,user:activeUser,resource:res)
        hasRead.validate()
        if(hasRead.hasErrors()){
            return false
        }else{
            hasRead.save(flush:true,failOnError:true)
            return true
        }

    }




}
