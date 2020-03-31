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