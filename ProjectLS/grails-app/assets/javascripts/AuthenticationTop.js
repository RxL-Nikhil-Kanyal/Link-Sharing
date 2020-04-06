//forgot password modal
$(document).ready(function(){
$("#forgotPasswordSubmitButtonId").click(function(){
alert($("#detailsOfUser").val());
$.ajax({
    url:"/authentication/forgotPasswordMail",
    type:"POST",
    data:{"userDetail":$("#detailsOfUser").val()},
    success:function(){
    location.reload();
    },
    error:function(){
    alert("Error ! Try Again Later!")
    }
    });
});
});
//sendPasswordChangeDetails
$(document).ready(function(){
$("#changePasswordButtonId").click(function(){
var password=$("#changePasswordId").val();
var confirmPassword=$("#confirmPasswordId").val();
if(password!=confirmPassword || !password || !confirmPassword){
alert("Error!");
}else{
$.ajax({
    url:"/authentication/changeUserPassword",
    type:"POST",
    data:{"userId":$("#hiddenUserId").val(),"newPassword":$("#changePasswordId").val()},
    success:function(){
    alert("Password changed!");
    window.location.replace('/authentication/auth');
    },
    error:function(){
    alert("Error ! Try Again Later!")
    }
    });
}
});
});