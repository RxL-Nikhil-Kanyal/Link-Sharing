
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
        alert(currentRating);
        $.ajax({
            url:"/resourceRating/createOrUpdateStarRating",
            type:"POST",
            data:{"resourceId":$("#hiddenResourceId").val(),"newResourceRating":currentRating},
            success:function(){

            },
            error:function(){
            alert("An Error Occurred!");

            }

        });
    }
});
