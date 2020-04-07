//create Topic
var createTopic = function(){
$.ajax({url:"/topic/createTopicFormAction",
type : "POST" ,
data : {"newTopicName":$("#newTopicNameId").val(),"topicVisibility":$("#topicVisibilityId").val()},
success : function (data) {
$("#myModaltopic").modal("hide");
$("#myModaltopic").find('form').trigger('reset');
if(data.success){

$("#successMessageId").text("Topic Created SuccessFully! ");
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

}} ,
}
);
};

$(document).ready(function () {
$("#createTopicFormId").on('submit',function(event){
event.preventDefault();
createTopic();
});
 });



// dashboard Subs serious and visibility change-seriousness
$(document).ready(function(){
  $(".changeSeriousclass").change(function(){

        $.ajax({url:"/Subscription/changeSeriousnessDash",
        type:"POST",
        data:{"changedSeriousness":$(this).val(),"subscriptionId":$(this).next().val()},
        success:function(data){
        window.scrollTo(0,0);
        $("#successMessageId").text(data.message);
            $("#successMessageId").show();
            setTimeout(function() {
              $("#successMessageId").hide("slow").empty();
            }, 2500);
        },
        error:function(){
        window.scrollTo(0,0);
        }
        });
  });
});

// dashboard Subs serious and visibility change-Visibility

$(document).ready(function(){
$(".visibilityChange").change(function(){
    $.ajax({url:"/topic/changeTopicVisibDash",
    type:"POST",
    data:{"changeVisibility":$(this).val(),"topicId":$(this).next().val()},
    success:function(data){
    window.scrollTo(0,0);
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
    error:function(){
    window.scrollTo(0,0);
    location.reload();
    }
    });
  });
});
//get Topic change module name
$(document).ready(function(){
var editTopic=$(".editNameButtonClass").click(function(){
var classOfElementToToggle=$(this).attr("id");
$("."+classOfElementToToggle).toggle();
});
});
//save topic changes-dash
$(document).ready(function(){
$(".saveTopicChangesButton").click(function(){
$.ajax({
    url:"/topic/changeTopicName",
    type:"POST",
    data:{"topicId":$(this).prev().attr("id"),"newTopicName":$(this).prev().val()},
    success:function(data){
    if(data.success==true){
    window.scrollTo(0,0);
     $("#successMessageId").text(data.message);
     $("#successMessageId").show();
     setTimeout(function() {
      $("#successMessageId").hide("slow").empty();
     }, 2500);
    }else{
    window.scrollTo(0,0);
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