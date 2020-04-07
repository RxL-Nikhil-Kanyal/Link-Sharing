package projectls
import grails.converters.JSON

class ReadingItemController {

   ReadingItemService readingItemService
   def userReadPost(){

      if(readingItemService.markAsReadByUserMethod(session.user,params.resourceId)){
         render ([success:true,message:"Marked as Read!"] as JSON)
      }else{
         render( [success:false,message: "Error!"] as JSON)
      }

   }
}
