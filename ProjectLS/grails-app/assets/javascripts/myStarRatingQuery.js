
// Star Rating
$(".my-rating").starRating({
    totalStars: 5,
      starShape: 'rounded',
      starSize: 23,
      emptyColor: 'lightgray',
      hoverColor: 'salmon',
      activeColor: 'crimson',
      useGradient: false,
       initialRating: parseFloat($("#rate").val()),
          disableAfterRate: false,
    callback: function(currentRating, $el){
        $.ajax({
            url:"/resourceRating/createOrUpdateStarRating",
            type:"POST",
            data:{"resourceId":$("#hiddenResourceId").val(),"newResourceRating":currentRating},
            success:function(data){
            if(data.success==true){
               $("#successMessageId").text(data.message);
               $("#successMessageId").show();
               setTimeout(function() {
                  $("#successMessageId").hide("slow").empty();
                }, 2500);
            }

            },
        });
    }
});
