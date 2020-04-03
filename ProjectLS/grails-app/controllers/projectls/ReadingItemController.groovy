package projectls
import grails.converters.JSON

class ReadingItemController {

   ReadingItemService readingItemService
   def userReadPost(){

      if(readingItemService.markAsReadByUserMethod(session.user,params.resourceId)){
         return [success:true] as JSON
      }else{
         return [success:false] as JSON
      }

   }
}
