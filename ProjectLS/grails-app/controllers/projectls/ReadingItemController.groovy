package projectls
import grails.converters.JSON

class ReadingItemController {

   ReadingItemService readingItemService
   def userReadPost(){

      println "---------------------------------"+session.user+"eeeeeeeeeeeeeeeeeeeeeeee"+params.resourceId

      if(readingItemService.markAsReadByUserMethod(session.user,params.resourceId)){
         return [success:true] as JSON
      }else{
         return [success:false] as JSON
      }

   }
}
