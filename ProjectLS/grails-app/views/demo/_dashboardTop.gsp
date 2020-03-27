<html>
<head>

<title>Dashboard</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<%--addin--%>

<g:javascript>

setTimeout(function() {
  $("#animateDiv").fadeOut("slow").empty();
}, 2500);

</g:javascript>



<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>



#flow1{

  width: auto;
  height: 200px;
  overflow: scroll;
}
#ellps {
  white-space: nowrap;
  width: auto;
  overflow: hidden;
  text-overflow: ellipsis;

}


#grad {
  background-image: linear-gradient(#33ccff,#ff99cc );
}
<!-#7F00FF#E100FF->

</style>




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

                                <p align="center">Create Topic</p>
                            <%--form start here--%>



                                        <g:form name="createTopicForm" action="createTopicFormAction" id="1" class="form-group">

                                       <div class="row">
                                            <div class="col-4">Name</div>

                                            <div class="col-8"><g:textField name="newTopicname" value="${mytopic}" required="true" class="form-control"/></div>

                                       </div>
                                       <div class="row">&nbsp;</div>

                                          <div class="row">
                                           <div class="col-4">Visibility</div>

                                           <div class="col-8"><g:select name="topic.visibility" from="${['Public','Private']}" value="${vis}"
                                                                                                    noSelection="['':'-Choose Visibility-']" required="true" class="form-control"/>

                                            </div>

                                      </div>





                          </div>
                          <div class="modal-footer">
                          <div class="col-5">
                          <g:submitButton name="CreateTopicButton" value="Create" onclick="callMyAjax()" class="form-control"/>
                            </div><class="col-6">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                          </div>

                          </div>
                        </div>
                         </g:form>  <%--form end here---%>

                      </div>
                    </div>
                    <!--end--->




        </span>

        <span class="col">



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
                               <div class="modal-body"><p align="center">Share Link Here</p>


                                   <%-----------start here form-----------%>

                                     <g:form name="shareLinkForm" action="shareLinkAction" id="3">
                                       <table class="table">

                                         <tr>
                                         <td>Link</td>
                                            <td><g:textField name="LinkTopicUrl" value="${Ltopic}" required="true" class="form-control" /></td>
                                          </tr>

                                             <tr>
                                             <td>Description</td>
                                             <td><g:textArea name="myLinkField" value="Topic related Url" rows="3" cols="10" class="form-control" /> </td>

                                             </tr>

                                             <tr>
                                               <td>Topic</td>
                                               <td>   <%---add list of topic here---%>
                                                 <g:select name="linktopic.name" from="${subbedTopics.name}" value="${vis}" noSelection="['':'-Choose Topic-']" required="true" class="form-control" />

                                               </td>
                                             </tr>



                                           </table>







                               </div>
                               <div class="modal-footer">

                               <div class="col-3"><g:submitButton name="shareLinkButton" value="share" class="form-control" /></div>
                                 <div class="col-6"><button type="button" class="btn btn-default" data-dismiss="modal" class="form-control" >Close</button></div>
                               </div>
                             </div>

                                  </g:form>

                                            <%------------end here form-------------%>


                           </div>
                         </div>
                         <!--end--->




        </span>

        <span class="col">




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
                        <p align="center">Send Invites</p>

    <%-----------invite form start here form-----------%>

             <g:form name="sendInviteForm" action="dashboard" id="4">
               <table class="table">

                 <tr>
                 <td>Email</td>
                    <td><g:textField name="friendEmail" value="${sendtopic}" required="true" class="form-control"/></td>
                  </tr>
                    <tr>
                       <td>Topic</td>
                       <td>   <%---add list of topic here---%>
                         <g:select name="topic.visibility" from="${subbedTopics.name}" value="${vis}" noSelection="['':'-Choose Topic-']" required="true" class="form-control"/>

                       </td>
                     </tr>


                   </table>



                      </div>
                      <div class="modal-footer"><div class="col-5"><g:submitButton name="sendInviteButton" value="send" class="form-control"/></div>
                      <div class="col-6"><button type="button" class="btn btn-default" data-dismiss="modal" class="form-control">Close</button></div>

                      </div>
                    </div>



             </g:form>

            <%------------invites end here form-------------%>

                  </div>
                </div>
                <!--end--->





        </span>


        <span class="col">



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
                            <div class="modal-body"><p align="center">Share documents Here</p>
                             <%-------------form start here----------------%>

                                  <g:form name="shareDocForm" action="shareDocAction" id="2">
                                        <table class="table">

                                          <tr>
                                              <td>Document</td>
                                                 <td><input type="file" name="docfile" class="form-control" /></td>
                                          </tr>

                                          <tr>
                                          <td>Description</td>
                                          <td><g:textArea name="myDocField" value="" rows="3" cols="10" class="form-control"/> </td>

                                          </tr>

                                          <tr>
                                            <td>Topic</td>
                                            <td>   <%---add list of topic here---%>
                                              <g:select name="docChosenTopic" from="${subbedTopics.name}" value="${vis}" noSelection="['':'-Choose Topic-']" required="true" class="form-control"/>

                                            </td>
                                          </tr>

                                        </table>







                            </div>
                            <div class="modal-footer">
                            <div class="col-5"><td ><g:submitButton name="update" value="share" onclick="callMyAjax()" class="form-control"/></td></div>
                              <div class="col-4"><button type="button" class="btn btn-default" data-dismiss="modal"class="form-control">Close</button></div>
                            </div>
                          </div>
                            </g:form>

                                       <%------------end here form-------------%>

                        </div>
                      </div>
                      <!--end--->





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
               <a class="dropdown-item" href="/Authentication/logout">Logout</a>
          </div>
        </div>

        </span>

     </div>

   </div>

  </div>
</nav>







</body>
</html>