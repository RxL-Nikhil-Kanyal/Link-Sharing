$(document).ready(function(){
$(".topicUnsubscribeClass").click(function(event){
event.preventDefault();
var element = $(this)

$.ajax({
    url:"/subscription/unsubscribeTopic",
    type:"POST",
    data:{"topicId":$(this).attr("id")},
    success:function(data){
    if(data.success==true){
       element.next().show();
       element.hide();
       $("#successMessageId").text(data.message);
       $("#successMessageId").show();
       setTimeout(function(){
       $("#successMessageId").hide("slow").empty();
       },3000);
    }else{
           $("#errorMessageId").text(data.message);
               $("#errorMessageId").show();
               setTimeout(function(){
               $("#errorMessageId").hide("slow").empty();
               },3000);
    }
    }
});
});
});