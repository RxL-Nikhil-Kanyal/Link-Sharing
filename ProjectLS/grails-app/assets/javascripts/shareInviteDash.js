//shareInvite
$(document).ready(function(){
$("#sendInviteButtonId").click(function(){
$.ajax({
    url:"/topic/shareInvite",
    type:"POST",
    data:{"userEmail":$("#friendEmailId").val(),"selectedTopicName":$("#topicSelectedId").val()},
    success:function(){
    location.reload();
    },
    error:function(){
    alert("Error ! Try Again Later!")
    }
    });
});
});