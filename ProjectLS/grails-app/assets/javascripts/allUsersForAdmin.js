$(document).ready(function(){
$(".changeUserActiveStatus").click(function(event){
event.preventDefault();
var element=$(this).attr("id");
var selectElement=$(this)
$.ajax({
    url:"/user/changeUserActiveStatus",
    type:"POST",
    data:{"userId":element},
    success:function(data){
    $("#forgotPasswordModalId").modal("hide");
    $("#forgotPasswordModalId").find('form').trigger('reset');
    if(data.success==true){
    $("."+element).text(data.newValue);
    $(selectElement).find("p").toggle();
    $("#successMessageId").text(data.message);
    $("#successMessageId").show();
    setTimeout(function() {
      $("#successMessageId").hide("slow").empty();
    }, 2500);
    }},
    error:function(){
    $("#errorMessageId").text("Something Went Wrong!");
        $("#errorMessageId").show();
        setTimeout(function() {
          $("#errorMessageId").hide("slow").empty();
        }, 2500);
    }
    });
});
});