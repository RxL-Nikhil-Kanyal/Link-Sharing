<html>
<head>

<title>Dashboard</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<%--addin--%>



<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>

$(document).ready(function(){
  $("#button1").click(function(){

  $('html, body').animate({
  		scrollTop: $("#shareLink").offset().top
  	},1000);


    $("#shareLink").children().toggle();
  });
});

$(document).ready(function(){
  $("#button2").click(function(){

    $('html, body').animate({
    		scrollTop: $("#sharetopic").offset().top
    	},1000);

    $("#sharetopic").children().toggle();
  });
});

$(document).ready(function(){
  $("#button3").click(function(){

    $('html, body').animate({
    		scrollTop: $("#createtopic").offset().top
    	},1000);

    $("#createtopic").children().toggle();
  });
});

$(document).ready(function(){
  $("#button4").click(function(){

    $('html, body').animate({
    		scrollTop: $("#sendinvites").offset().top
    	},1000);

    $("#sendinvites").children().toggle();
  });
});
</script>


</head>
<body>


<nav class="navbar navbar-expand-lg navbar-light bg-light">

<div class="container">
    <div class="col-3">

  <a class="navbar-brand" href="/demo/dashboard"><h4>Link Sharing</h4><h6>Welcome</h6></a>


    </div>

     <div class="col-4">

    <form class="form-inline my-2 my-lg-0">

      <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">

      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
    </form>
     </div>


     <div class="col">
        <span class="col">



             <g:img dir="images" file="topic.png" width="20" height="20" id="button3"/>



        </span>

        <span class="col">



                     <g:img dir="images" file="Link.png" width="20" height="20" id="button1"/>




        </span>

        <span class="col">



                     <g:img dir="images" file="msg.jpg" width="20" height="20" id="button4"/>




        </span>


        <span class="col">



                     <g:img dir="images" file="doc.png" width="20" height="20" id="button2"/>




        </span>


        <span class="col">

        <div class="btn-group dropdown">
          <button type="button" class="btn btn-secondary">

                <span> <g:img dir="images" file="defaultpic.png" width="50" height="60" id="button3"/></span>
                <span>username</span>

          </button>
          <button type="button" class="btn btn-secondary dropdown-toggle dropdown-toggle-split" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <span class="sr-only">Toggle Dropdown</span>
          </button>
          <div class="dropdown-menu">
               <a class="dropdown-item" href="/demo/index">Profile</a>

               <a class="dropdown-item" href="/demo/index">User</a>
               <a class="dropdown-item" href="/demo/topicsShow">Topic</a>
               <a class="dropdown-item" href="/demo/index">Posts</a>
               <div class="dropdown-divider"></div>
               <a class="dropdown-item" href="/demo/logout">Logout</a>
          </div>
        </div>

        </span>

     </div>

   </div>

  </div>
</nav>




</body>
</html>