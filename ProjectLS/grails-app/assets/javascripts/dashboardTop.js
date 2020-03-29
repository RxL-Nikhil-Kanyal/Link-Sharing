
var createTopic = function(){
$.ajax({uri:"/Topic/createTopicFormAction",
type : "POST" ,
data : {"newTopicName":$("#newTopicNameId").val(),"topic.visibility":$("#topicVisibilityId").val()},
success : function () {
alert("Thank you");
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
