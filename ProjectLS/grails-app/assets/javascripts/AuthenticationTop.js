//forgot password modal
$(document).ready(function(){
$("#forgotPasswordSubmitButtonId").click(function(){
$.ajax({
    url:"/authentication/forgotPasswordMail",
    type:"POST",
    data:{"userDetail":$("#detailsOfUser").val()},
    success:function(data){
    $("#forgotPasswordModalId").modal("hide");
    $("#forgotPasswordModalId").find('form').trigger('reset');
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
    }},
    error:function(){
    $("#errorMessageId").text("Something Went Wrong! Check your Connection!");
        $("#errorMessageId").show();
        setTimeout(function() {
          $("#errorMessageId").hide("slow").empty();
        }, 2500);
    }
    });
});
});
//sendPasswordChangeDetails
$(document).ready(function(){
$("#changePasswordButtonId").click(function(event){
event.preventDefault();
var password=$("#changePasswordId").val();
var confirmPassword=$("#confirmPasswordId").val();
if(!password || !confirmPassword){
$("#errorMessageId").text("Field Can not be Empty! ");
$("#errorMessageId").show();
setTimeout(function() {
  $("#errorMessageId").hide("slow").empty();
}, 2500);
}else{

if(password!=confirmPassword){
$("#errorMessageId").text("password and confirm password Do not Match! ");
$("#errorMessageId").show();
setTimeout(function() {
  $("#errorMessageId").hide("slow").empty();
}, 2500);
}else{
$.ajax({
    url:"/authentication/changeUserPassword",
    type:"POST",
    data:{"userId":$("#hiddenUser").val(),"newPassword":$("#changePasswordId").val()},
    success:function(){
    window.location.replace("/authentication/homePage");
    $("#successMessageId").text("Password Changed SuccessFully! ");
    $("#successMessageId").show();
    setTimeout(function() {
      $("#successMessageId").hide("slow").empty();
    }, 2500);
    },
    error:function(){
        $("#errorMessageId").text("Error Changing password!");
        $("#errorMessageId").show();
        setTimeout(function() {
          $("#errorMessageId").hide("slow").empty();
        }, 2500);
    }
    });
}

}
});
});