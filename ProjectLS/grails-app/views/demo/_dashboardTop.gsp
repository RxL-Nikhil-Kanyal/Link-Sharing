<html>
<head>

<title>Dashboard</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<%--addin--%>



<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>
#grad {
  background-image: linear-gradient(#7F00FF, #E100FF);
}

</style>


<script>

$(document).ready(function(){
  $("#button1").click(function(){
  if(window.location.pathname!="/demo/dashboard")
    {
    open("/demo/dashboard", "_self");
    }

  $('html, body').animate({
  		scrollTop: $("#shareLink").offset().top
  	},1000);


    $("#shareLink").children().toggle();
  });
});

$(document).ready(function(){
  $("#button2").click(function(){

    if(window.location.pathname!="/demo/dashboard")
      {
      open("/demo/dashboard", "_self");
      }

    $('html, body').animate({
    		scrollTop: $("#sharetopic").offset().top
    	},1000);

    $("#sharetopic").children().toggle();
  });
});

$(document).ready(function(){
  $("#button3").click(function(){

    if(window.location.pathname!="/demo/dashboard")
      {
      open("/demo/dashboard", "_self");
      }

    $('html, body').animate({
    		scrollTop: $("#createtopic").offset().top
    	},1000);

    $("#createtopic").children().toggle();
  });
});

$(document).ready(function(){
  $("#button4").click(function(){

    if(window.location.pathname!="/demo/dashboard")
      {
      open("/demo/dashboard", "_self");
      }

    $('html, body').animate({
    		scrollTop: $("#sendinvites").offset().top
    	},1000);

    $("#sendinvites").children().toggle();
  });
});
</script>


</head>
<body id="grad">


<nav class="navbar navbar-expand-lg navbar-dark bg-dark">

<div class="container">
    <div class="col-3">

  <a class="navbar-brand" href="/demo/dashboard"><h4>LINK SHARING</h4><h6>Welcome</h6></a>


    </div>

     <div class="col-4">

    <form class="form-inline my-2 my-lg-0">

      <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">

      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
    </form>
     </div>


     <div class="col">
        <span class="col">



             <g:img dir="images" file="topic.png" width="20" height="20" id="button3" />



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

                <span> <g:img dir="images" file="defaultpic.png" width="50" height="60" id="buttonimage"/></span>
                <span id="dp">${activeUser.username}</span>

          </button>
          <button type="button" class="btn btn-secondary dropdown-toggle dropdown-toggle-split" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <span class="sr-only">Toggle Dropdown</span>
          </button>
          <div class="dropdown-menu">
               <a class="dropdown-item" href="/demo/editProfile">Edit Profile</a>
               <g:if test="${activeUser.admin}">

                    <a class="dropdown-item" href="/demo/usersA">User</a>
                    <a class="dropdown-item" href="/demo/topicsShow">Topic</a>
               </g:if>



               <a class="dropdown-item" href="/demo/posts">Posts</a>
               <div class="dropdown-divider"></div>
               <a class="dropdown-item" href="/demo/logout">Logout</a>
          </div>
        </div>

        </span>

     </div>

   </div>

  </div>
</nav>



  <!-- Trigger the modal with a doc -->

    <g:img dir="images"  file="doc.png" style="background-color: white;border-radius: 5px;" width="20" height="20" data-toggle="modal" data-target="#myModaldoc" />
  <!-- Modal -->
  <div class="modal fade" id="myModaldoc" role="dialog">
    <div class="modal-dialog">

      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>

        </div>
        <div class="modal-body">
          <p>Some text in the doc modal.</p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>

    </div>
  </div>
  <!--end--->
    <!-- Trigger the modal with a link -->

      <g:img dir="images" file="Link.png" style="background-color: white;border-radius: 5px;"  width="20" height="20" data-toggle="modal" data-target="#myModallink" />
    <!-- Modal -->
    <div class="modal fade" id="myModallink" role="dialog">
      <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">&times;</button>

          </div>
          <div class="modal-body">
            <p>Some text in the link modal.</p>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
          </div>
        </div>

      </div>
    </div>
    <!--end--->

      <!-- Trigger the modal with a topic -->

          <g:img dir="images" file="topic.png" style="background-color: white;border-radius: 5px;"  width="20" height="20" data-toggle="modal" data-target="#myModaltopic" />
        <!-- Modal -->
        <div class="modal fade" id="myModaltopic" role="dialog">
          <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>

              </div>
              <div class="modal-body">
                <p>Some text in the topic modal.</p>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
              </div>
            </div>

          </div>
        </div>
        <!--end--->

         <!-- Trigger the modal with a invite -->

                  <g:img dir="images" file="msg.jpg" style="background-color: white;border-radius: 5px;"  width="20" height="20" data-toggle="modal" data-target="#myModalinvite" />
                <!-- Modal -->
                <div class="modal fade" id="myModalinvite" role="dialog">
                  <div class="modal-dialog">

                    <!-- Modal content-->
                    <div class="modal-content">
                      <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>

                      </div>
                      <div class="modal-body">
                        <p>Some text in the invite modal.</p>
                      </div>
                      <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                      </div>
                    </div>

                  </div>
                </div>
                <!--end--->


</body>
</html>