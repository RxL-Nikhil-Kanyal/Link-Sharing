//create Topic
var createTopic = function(){
$.ajax({url:"/topic/createTopicFormAction",
type : "POST" ,
data : {"newTopicName":$("#newTopicNameId").val(),"topicVisibility":$("#topicVisibilityId").val()},
success : function () {
if(!($("#newTopicNameId").val() && $("#topicVisibilityId").val())){
    alert("Fields Cannot be Empty!")
}else{
location.reload();
}
} ,
error : function () {
    alert("Failed!")
    }}
  );
};

$(document).ready(function () {
$("#createTopicButtonId").click(function(){
createTopic();
});
 });
// dashboard Subs serious and visibility change-seriousness
$(document).ready(function(){
  $(".changeSeriousclass").change(function(){

        $.ajax({url:"/Subscription/changeSeriousnessDash",
        type:"POST",
        data:{"changedSeriousness":$(this).val(),"subscriptionId":$(this).next().val()},
        success:function(){
        window.scrollTo(0,0);
        location.reload();
        },
        error:function(){
        window.scrollTo(0,0);
        location.reload();
        }
        });
  });
});

// dashboard Subs serious and visibility change-Visibility

$(document).ready(function(){
$(".visibilityChange").change(function(){
    alert($(this).val());
    alert($(this).next().val());
    $.ajax({url:"/topic/changeTopicVisibDash",
    type:"POST",
    data:{"changeVisibility":$(this).val(),"topicId":$(this).next().val()},
    success:function(){
    window.scrollTo(0,0);
    location.reload();
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
alert("edit");
alert($(this).attr("id"));
var classOfElementToToggle=$(this).attr("id");
$("."+classOfElementToToggle).toggle();
});
});
//save topic changes-dash
$(document).ready(function(){
$(".saveTopicChangesButton").click(function(){
alert("save Action!")
$.ajax({
    url:"/topic/changeTopicName",
    type:"POST",
    data:{"topicId":$(this).prev().attr("id"),"newTopicName":$(this).prev().val()},
    success:function(){
    alert("Topic Name changed Successfully!");
    location.reload();
    },
    error:function(){
    alert("Error ! Try Again Later!")
    }
    });
});
});