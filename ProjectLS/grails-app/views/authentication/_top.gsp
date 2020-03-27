<html>
<head>


<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<%--addin--%>


<style>
#grad {
  background-image: linear-gradient(#33ccff,#ff99cc );
}

</style>

<g:javascript>

setTimeout(function() {
  $("#animateDiv").fadeOut("slow").empty();
}, 2500);

</g:javascript>

</head>
<body id="grad" >


<nav class="navbar navbar-expand-lg navbar-dark bg-dark " style="height: 100px;">

<div class="container">
    <div class="col-7">

  <a class="navbar-brand" href="/authentication/auth"><h4>LINK SHARING</h4></a>


    </div>

     <div class="col-5">

    <form class="form-inline my-2 my-lg-0">

      <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">

      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
    </form>
     </div>

   </div>

  </div>
</nav>



</body>
</html>