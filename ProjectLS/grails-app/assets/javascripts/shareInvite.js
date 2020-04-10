//shareInvite
$(document).ready(function(){
$("#sendInviteFormId").on('submit',function(event){
event.preventDefault();
$.ajax({
    url:"/topic/shareInvite",
    type:"POST",
    data:{"userEmail":$("#friendEmailId").val(),"selectedTopicName":$("#topicSelectedId").val()},
    success:function(data){
    $("#myModalinvite").modal("hide");
    $("#myModalinvite").find('form').trigger('reset');
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