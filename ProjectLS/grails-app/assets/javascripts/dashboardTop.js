
var createTopic = function(){
$.ajax({url:"/topic/createTopicFormAction",
type : "POST" ,
data : {"newTopicName":$("#newTopicNameId").val(),"topicVisibility":$("#topicVisibilityId").val()},
success : function () {
alert("Data Saved!");
} ,
error : function () {alert("Topic Save Failed");
}}

);

};


$(document).ready(function () {
$("#createTopicFormId").click(function(){
createTopic();
  });
 });
