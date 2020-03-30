package projectls

class SubscriptionController {


   def subscribeTopic(){
       println "------------------------>"+ params.topicsId

       User activeUser=User.findByUsername(session.user);
       Topics topic=Topics.get(params.topicId);


       Subscription newSub=new Subscription(user:activeUser,topics:topic,seriousness:'Serious');
       newSub.validate();
       if(newSub.hasErrors()){
           newSub.errors.allErrors.each {
               println it
           }
           flash.warning="Error ! Action Unsuccessful"
           redirect(controller: 'demo', action: 'dashboard')
       }else{
           newSub.save(flush:true,failOnError: true)
           flash.message="Subcribed to ${topic.name} Successfully"
           redirect(controller: 'demo', action: 'dashboard')

       }
   }



}
