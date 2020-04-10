<html>
<head>

<title>Dashboard</title>

<asset:stylesheet src="bootstrap.min.css"/>
<asset:javascript src="popper.min.js"/>
<asset:javascript src="jquery-3.3.1.min.js"/>
<asset:javascript src="bootstrap.min.js"/>
<asset:javascript src="navbarCommonScripts.js"/>
<asset:javascript src="dashboardTop.js"/>
<asset:javascript src="resourceLs.js"/>
<asset:stylesheet src="navbarCommonStyling.css"/>

<asset:javascript src="shareInviteDash.js"/>
<asset:javascript src="unsubscribeTopic.js"/>

<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.css">
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.js"></script>

</head>
<body id="grad">
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">

<div class="container">
    <div class="col-3">
  <a class="navbar-brand" href="/user/dashboard"><h4>LINK SHARING</h4><h6>Welcome</h6></a>
    </div>
     <div class="col-4">
    <g:form name="searchBar" controller="search" action="searchPosts"  class="form-inline my-2 my-lg-0">
      <input name="search" class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
    </g:form>
     </div>
     <div class="col">
        <span class="col" >
                  <!-- Trigger the modal with a topic -->
                      <g:img dir="images" file="topic.png" style="background-color: white;border-radius: 5px;margin-top:20px;"  width="20" height="20" data-toggle="modal" data-target="#myModaltopic" />
                    <!-- Modal -->
                    <div class="modal fade" id="myModaltopic" role="dialog">
                      <div class="modal-dialog">
                        <!-- Modal content-->
                        <div class="modal-content">
                          <div class="modal-header">
                             <h5 class="modal-title" style="margin-left:35%;">Create Topic</h5>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                          </div>
                          <div class="modal-body">
                            <%--form start here--%>
                                        <form name="createTopicForm" id="createTopicFormId" class="form-group">

                                       <div class="row">
                                            <div class="col-4">Name</div>

                                            <div class="col-8"><g:textField id="newTopicNameId" name="newTopicName" value="${mytopic}" required="true" class="form-control"/></div>

                                       </div>
                                       <div class="row">&nbsp;</div>

                                          <div class="row">
                                           <div class="col-4">Visibility</div>

                                           <div class="col-8"><g:select id="topicVisibilityId" name="topicVisibility" from="${['Public','Private']}" value="${vis}"
                                                                                                    noSelection="['':'-Choose Visibility-']" required="true" class="form-control"/>

                                            </div>

                                      </div>
                          </div>
                          <div class="modal-footer">
                          <div class="col-5">

                            <Input type="submit" id="createTopicButtonId" value="Create" class="form-control" />
                            </div><class="col-6">
                            <button type="button" id="closeTopicButton" class="btn btn-default" data-dismiss="modal">Close</button>
                          </div>

                          </div>
                        </div>
                         </form>  <%--form end here---%>

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
                       <h5 class="modal-title" style="margin-left:35%;">Share Link</h5>
                     <button type="button" class="close" data-dismiss="modal">&times;</button>

                   </div>
                   <div class="modal-body" style="border:2px outset;border-radius:5px;">
                       <%-----------start here form-----------%>
                         <form name="shareLinkForm" id="shareLinkFormId">
                           <table class="table">
                             <tr>
                             <td>Link</td>
                                <td><g:field type="url" id="linkTopicUrlId" name="LinkTopicUrl" value="${Ltopic}" required="true" class="form-control" /></td>
                              </tr>
                                 <tr>
                                 <td>Description</td>
                                 <td><g:textArea id="linkDescId"name="linkDesc" value="Topic related Url" rows="3" cols="10" class="form-control" required="true"/> </td>
                                 </tr>

                                 <tr>
                                   <td>Topic</td>
                                   <td>   <%---add list of topic here---%>
                                     <g:select id="linkTopicName" name="linkTopicName" from="${subbedTopics.name}" value="${vis}" noSelection="['':'-Choose Topic-']" required="true" class="form-control" />

                                   </td>
                                 </tr>
                               </table>
                   </div>
                   <div class="modal-footer">
                   <div class="col-3"><Input type="submit" style="background-color:#D3D3D3;width:100px;" value="Share" id="shareLinkButtonId" name="shareLinkButton" class="form-control"/></div>
                     <div class="col-6"><button type="button" style="background-color:#D3D3D3;width:100px;" class="btn btn-default" data-dismiss="modal" class="form-control" >Close</button></div>
                   </div>
                 </div>
                      </form>
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
                       <h5 class="modal-title" style="margin-left:35%;">Send Invites</h5>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>

                      </div>
                      <div class="modal-body">

    <%-----------invite form start here form-----------%>

             <form name="sendInviteForm" id="sendInviteFormId">
               <table class="table">

                 <tr>
                 <td>Email</td>
                    <td><Input type="Email" id="friendEmailId" name="friendEmail" value=" " required="true" class="form-control"/></td>
                  </tr>
                    <tr>
                       <td>Topic</td>
                       <td>   <%---add list of topic here---%>
                         <g:select id="topicSelectedId" name="topicSelectedName" from="${subbedTopics.name}" value="${vis}" noSelection="['':'-Choose Topic-']" required="true" class="form-control"/>

                       </td>
                     </tr>
                   </table>
                      </div>
                      <div class="modal-footer"><div class="col-4"><Input type="submit"  style="background-color:#D3D3D3;width:100px;margin-left;20px;" value="Send"  id="sendInviteButtonId" name="sendInviteButton" class="form-control"/></div>
                      <div class="col-6"><button class="btn btn-default"  style="background-color:#D3D3D3;width:100px;" data-dismiss="modal" class="form-control">Close</button></div>
                      </div>
                    </div>
             </form>
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
                              <h5 class="modal-title" style="margin-left:35%;">Share Document</h5>
                              <button type="button" class="close" data-dismiss="modal">&times;</button>

                            </div>
                            <div class="modal-body">
                             <%-------------form start here----------------%>

                                  <g:uploadForm  name="shareDocForm" controller="resource" action="shareDocument" id="2">
                                        <table class="table">

                                          <tr>
                                              <td>Document</td>
                                                 <td><input type="file" name="docfile" class="form-control" required="true" /></td>
                                          </tr>

                                          <tr>
                                          <td>Description</td>
                                          <td><g:textArea name="myDocField" value="" rows="3" cols="10" class="form-control" required="true"/> </td>

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
                            </g:uploadForm >

                                       <%------------end here form-------------%>
                        </div>
                      </div>
                      <!--end--->
        </span>
        <span class="col">

        <div class="btn-group dropdown">
          <button type="button" class="btn btn-secondary">
                <g:link controller="user" action="userProfile" id="nameLink"  params="[otherUserId:activeUser.id]">
                <span>  <g:if test="${activeUser.photo!=null}">

                               <img height="50" style="margin-top: 10px;margin-left: 0px,margin-bottom: 10px;margin-right: 10px  "  width="50" src="${createLink(controller: 'user', action: 'fetchPersonImage', params: ['userId':activeUser.id])}"/>
                            </g:if>
                            <g:else>
                                <g:img dir="images" file="defaultpic.png" width="50" height="50"/>
                            </g:else></span>
                <span id="dp"><font color="white">${activeUser.username}</font></span>
                </g:link>
          </button>
          <button type="button" class="btn btn-secondary dropdown-toggle dropdown-toggle-split" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <span class="sr-only">Toggle Dropdown</span>
          </button>
          <div class="dropdown-menu">
               <a class="dropdown-item" href="/user/editProfile">Edit Profile</a>
               <g:if test="${activeUser.admin}">

                    <a class="dropdown-item" href="/user/displayAllUsersForAdmin">User</a>
                    <a class="dropdown-item" href="/topic/adminTopics">Topic</a>
                    <a class="dropdown-item" href="/search/searchPosts">Posts</a>
               </g:if>

               <a class="dropdown-item" href="/Authentication/logout">Logout</a>
          </div>
        </div>

        </span>

     </div>

   </div>

  </div>
</nav>
<div style="display: none;" id="successMessageId" class="alert alert-success" role="alert">
  Success
</div>
<div style="display: none;" id="errorMessageId" class="alert alert-danger" role="alert">
  Danger
</div>

 <g:if test="${flash.message}">
        <div id="animateDiv" class="alert alert-success" role="status">${flash.message}</div>
    </g:if>
    <g:if test="${flash.warning}">
        <div id="animateDiv" class="alert alert-danger" >${flash.warning}</div>
    </g:if>

</body>
</html>