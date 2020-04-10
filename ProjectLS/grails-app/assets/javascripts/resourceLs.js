
//delete Resource/Post
$(document).ready(function(){
$(".deleteOwnResource").click(function(event){
event.preventDefault();
$.ajax({
    url:"/resource/deleteResource",
    type:"POST",
    data:{"resourceId":$(this).attr("id")},
    success:function(data){
       if(data.success==true){
       $("#successMessageId").text(data.message);
           $("#successMessageId").show();
           setTimeout(function() {
             $("#successMessageId").hide("slow").empty();
           }, 3500);
       }else{
         $("#errorMessageId").text(data.message);
         $("#errorMessageId").show();
          setTimeout(function() {
         $("#errorMessageId").hide("slow").empty();
          }, 3500);
       }}
});
});
});

//create link Resource
$(document).ready(function(){
$("#shareLinkFormId").on('submit',function(event){
event.preventDefault();
$.ajax({
    url:"/resource/shareLink",
    type:"POST",
    data:{"LinkTopicUrl":$("#linkTopicUrlId").val(),
    "linkDesc":$("#linkDescId").val(),"linkTopicName":$("#linkTopicName").val()},
    success:function(data){
     $("#myModallink").modal("hide");
     $("#myModallink").find('form').trigger('reset');
    if(data.success==true){

    $("#successMessageId").text(data.message);
        $("#successMessageId").show();
        setTimeout(function() {
          $("#successMessageId").hide("slow").empty();
        }, 2500);
    }else{
      $("#errorMessageId").text(data.message);
      $("#errorMessageId").show();
       setTimeout(function() {
      $("#errorMessageId").hide("slow").empty();
       }, 2500);
    }
    }
    });
});
});
//changeResourceDescription
$(document).ready(function(){
$("#editResourceFormId").on('submit',function(event){
event.preventDefault();
var description=$("#editResDesc").val()
$.ajax({
    url:"/resource/updateResource",
    type:"POST",
    data:{"resourceId":$("#hiddenResourceId").val(),"newDescription":$("#editResDesc").val()},
    success:function(data){
     $("#EditResourceModal").modal("hide");
     $("#EditResourceModal").find('form').trigger('reset');
    if(data.success==true){
        $("#descriptionId").text(description);
    $("#successMessageId").text(data.message);
        $("#successMessageId").show();
        setTimeout(function() {
          $("#successMessageId").hide("slow").empty();
        }, 2500);
    }else{
      $("#errorMessageId").text(data.message);
      $("#errorMessageId").show();
       setTimeout(function() {
      $("#errorMessageId").hide("slow").empty();
       }, 2500);
    }
    }
    });

});
});

//isRead update
$(document).ready(function(){
$(".changeReadStatus").click(function(event){
event.preventDefault();
$(this).parents().eq(4).hide("slow");

$.ajax({
    url:"/readingItem/userReadPost",
    type:"POST",
    data:{"resourceId":$(this).attr("id")},
    success:function(data){
    if(data.success){
        $("#successMessageId").text(data.message);
        $("#successMessageId").show();
        setTimeout(function() {
          $("#successMessageId").hide("slow").empty();
        }, 2500);
    }

    },
    error:function(){
       $("#errorMessageId").text(data.message);
       $("#errorMessageId").show();
        setTimeout(function() {
        $("#errorMessageId").hide("slow").empty();
        }, 2500);
    }

});
});
});
//delete Topic
$(document).ready(function(){
$(".deleteTopicClass").click(function(){
$.ajax({
    url:"/topic/deleteTopic",
    type:"POST",
    data:{"topicId":$(this).attr("id")},
    success:function(data){
       if(data.success==true){
         $("#successMessageId").text(data.message);
          $("#successMessageId").show();
           setTimeout(function() {
           $("#successMessageId").hide("slow").empty();
           }, 2500);
       }else{
         $("#errorMessageId").text(data.message);
         $("#errorMessageId").show();
          setTimeout(function() {
          $("#errorMessageId").hide("slow").empty();
          }, 2500);
       }
    },
});
});
});