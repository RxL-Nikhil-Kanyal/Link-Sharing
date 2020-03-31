
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
