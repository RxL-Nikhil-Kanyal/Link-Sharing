
//delete Resource/Post
$(document).ready(function(){
$(".deleteOwnResource").click(function(){
$.ajax({
    url:"/resource/deleteResource",
    type:"POST",
    data:{"resourceId":$(this).attr("id")},
    success:function(){
    location.reload();
    }

});
});
});

//create link Resource
$(document).ready(function(){
$("#shareLinkButtonId").click(function(){
$.ajax({
    url:"/demo/ShareLinkAction",
    type:"POST",
    data:{"LinkTopicUrl":$("#linkTopicUrlId").val(),"linkDesc":$("#linkDescId").val(),"linkTopicName":$("#linkTopicName").val()},
    success:function(){
    location.reload();
    }
    });
});
});
//changeResourceDescription
$(document).ready(function(){
$("#editSaveButtonId").click(function(){
if($("#editResDesc").val()=="")
{
     alert("Description cannot be empty!");
}else{

$.ajax({
    url:"/resource/updateResource",
    type:"POST",
    data:{"resourceId":$("#hiddenResourceId").val(),"newDescription":$("#editResDesc").val()},
    success:function(){
       location.reload();
    },
    error:function(){
    alert("An Error Occurred!");

    }

});

}

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
        alert("Added to Read Posts!")
    }

    },
    error:function(){
    alert("An Error Occurred!");
    location.reload();
    }

});
});
});
//delete Topic
$(document).ready(function(){
$(".deleteTopicClass").click(function(){
$.ajax({
    url:"/topic/deleteTopicAjax",
    type:"POST",
    data:{"topicId":$(this).next().val()},
    success:function(){
        location.reload();
    },
    error:function(){
    alert("An Error Occurred!");
    }


});
});


});