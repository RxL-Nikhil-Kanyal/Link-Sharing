<html>
<head>
<title>homePage</title>

<style>

#flow{

  width: auto;
  height: 180px;
  overflow: scroll;
  overflow-x: hidden;
}
#ellps {
  white-space: nowrap;
  width: auto;
  overflow: hidden;
  text-overflow: ellipsis;

}

</style>

</head>
<body>
<g:render template="top" />

<g:hasErrors>
    <g:eachError><p class="alert alert-danger"><g:message error="${it}"/></p></g:eachError>
</g:hasErrors>

     <div class="bodyContent" id="bodyContent">
     </div>

<div class="container">

<div class="row">&nbsp;</div>

  <div class="row">    <%-- row 1 --%>
    <div class="col-sm-6">                <%-- container 1--%>

      <div class="card shadow p-0 bg-white rounded">
        <div class="card-header">
          Recent Shares
        </div>
        <div class="card-body">
            <div class="container">

              <div id="flow">

                 <g:each in="${recentUpdatedTopics}" var="u" status="i">

                    <div class="row">
                        <div class="col-4">

                         <g:if test="${u?.user.photo!=null}">

                             <img height="90" style="margin-top: 10px;margin-left: 0px,margin-bottom: 10px;margin-right: 10px"  width="90" src="${createLink(controller: 'publicResources', action: 'userImage', params: ['userId':u?.user?.id])}"/>
                          </g:if>
                          <g:else>
                              <g:img dir="images" file="defaultpic.png" width="100" height="100" />
                          </g:else>

                        </div>
                        <div class="col-8"><%---right of pic---%>

                           <div class="row">
                               <div class="col-7">${u?.user.username}</div>
                               <div class="col-5">${u?.topics.name}</div>
                            </div><hr>
                            <div class="row"><div id="ellps" class="col-9">${u?.name}</div>

                            <div class="col-3">

                           <g:link controller="publicResources" action="PublicTopicsShow" params="[topicRelated:u.id]">
                                 more
                           </g:link>

                           </div></div>
                            <div class="row">&nbsp;</div>
                            <div class="row"><div class="col-8">${u?.user.email}</div>

                            <div class="col-4">

                                    <g:if test="${u?.class==LinkResources}">
                                       Resource: <a href="${u?.URl}">Go To Link</a>
                                   </g:if>
                                   <g:else>
                                        Resource:   <g:link controller="publicResources" action="downloadFile" params="[res:u?.id]"> Download
                                                                                                       </g:link>
                                   </g:else>

                            </div> </div>

                        </div>  <%---right of pic end---%>
                    </div>
                    <hr>
                 </g:each>
               </div>    <%----div flow end------%>
            </div>
            <a href="#"></a>
                </div>
      </div>

    </div>



    <div class="col-sm-6">                 <%-- container 2--%>

      <div class="card shadow p-0 bg-white rounded">
             <div class="card-header">
              Login
             </div>
             <div class="card-body">
               <Div class="container">
               <g:form name="myForm" controller="Authentication" action="login" >
                           <Div class="row form-group" >                              <%-- add in message--%>
                              <Div class="col-sm-6">
                               <g:message code="auth.login.username" />
                              </Div>
                              <Div class="col-sm-6 ">
                              <g:field type="text" name="username" value=""
                              required="true"  class="form-control" style="width:100%;"/>
                              </Div>
                           </Div>
                            <Div class="row form-group">
                            </Div>
                           <Div class="row">
                                   <Div class="col-sm-6">
                                       <g:message code="auth.login.password" />
                                   </Div>
                                   <Div class="col-sm-6">
                                       <g:field type="Password" name="password" value=""
                                       required="true" minlength="8" maxlength="12" class="form-control" style="width:100%;"/></Div>
                                    </Div>
                           </Div>
                           <Div class="row">
                                <Div class="col-sm-6">
                                           <a href="" id="forgotPasswordId" data-toggle="modal" data-target="#forgotPasswordModalId">Forgot Password</a>
                                 </Div>
                                  <Div class="col-sm-6 " >
                                    <g:submitButton name="update" value="Log In" class="form-control" style="width:95%;Background-color:#D3D3D3;"/></Div>
                                   </Div>
                           </div>
                </g:form>

                <div>

             </div>
           </div>

    </div>
  </div>

  <div class="row"><hr></div>   <%--space--%>

  <div class="row"> <%-- row 2 --%>

    <div class="col-sm-6">                   <%-- container 3--%>

        <div class="card shadow p-0 bg-white rounded">
                <div class="card-header">
                  Top Posts
                </div>
                <div class="card-body">
                 <%-----------------------%>
                    <div class="container" id="flow">
                       <g:if test="${!topPostsWithRating}">
                           <font size="3" color="gray">No Rating on Posts yet.</font>
                       </g:if>
                       <g:else>
                          <g:each in="${topPostsWithRating}" var="u" status="i">
                            <div class="row">
                                <div class="col-4">
                                     <g:if test="${u[1]?.user.photo!=null}">

                                         <img height="90" style="margin-top: 10px;margin-left: 0px,margin-bottom: 10px;margin-right: 10px"  width="90"
                                          src="${createLink(controller: 'publicResources', action: 'userImage', params: ['userId':u[1]?.user?.id])}"/>
                                      </g:if>
                                      <g:else>
                                          <g:img dir="images" file="defaultpic.png" width="100" height="100" />
                                      </g:else>


                                </div>
                                 <div class="col-8">
                                    <div class="row">
                                        <div class="col-6">${u[1]?.user?.username}</div>
                                        <div class="col-6">${u[1]?.topics?.name}</div>
                                    </div><hr>
                                    <div class="row">
                                        <div class="col">
                                            <div id="ellps" class="col-9">${u[1]?.name}</div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-8"></div>
                                        <div class="col-4">
                                         <g:link controller="publicResources" action="PublicTopicsShow" params="[topicRelated:u[1]?.id]">
                                                                         full Post
                                                                   </g:link>
                                        </div>
                                    </div>
                                 </div>
                             </div>
                             <hr>
                           </g:each>
                        </g:else>
                    </div>
                 <%-----------------------%>
                </div>
              </div>
      </div>
      <div class="col-sm-6">                 <%-- container 4--%>

        <div class="card shadow p-0 bg-white rounded">
                     <div class="card-header">
                      Register                                              <%--add in message--%>
                     </div>
                     <div class="card-body">
                       <Div class="container">
                       <g:uploadForm  name="myForm" controller="Authentication" action="register"
                       method="post" >

                                   <Div class="row form-group">                              <%-- add in message--%>
                                      <Div class="col-sm-6">
                                       <g:message code="auth.register.firstname" />
                                      </Div>
                                      <Div class="col-sm-6">
                                      <g:field type="text" name="firstName"  required="true" class="form-control" />
                                      </Div>
                                   </Div>


                                      <Div class="row form-group">                              <%-- add in message--%>
                                            <Div class="col-sm-6">
                                                   <g:message code="auth.register.lastname" />
                                             </Div>
                                            <Div class="col-sm-6">
                                                    <g:field type="text" name="lastName"  required="true" class="form-control"/>
                                              </Div>
                                       </Div>


                                          <Div class="row form-group">                              <%-- add in message--%>
                                                  <Div class="col-sm-6">
                                                          <g:message code="auth.register.email" />
                                                   </Div>
                                                   <Div class="col-sm-6">
                                                          <g:field type="email" name="email"  required="true" class="form-control"/>
                                                   </Div>
                                           </Div>


                                       <Div class="row form-group">                              <%-- add in message--%>
                                             <Div class="col-sm-6">
                                                          <g:message code="auth.register.username" />
                                             </Div>
                                             <Div class="col-sm-6 ">
                                                          <g:field type="text" name="username"  required="true" class="form-control"/>
                                              </Div>
                                       </Div>

                                        <Div class="row form-group">                              <%-- add in message--%>
                                             <Div class="col-sm-6">
                                                       <g:message code="auth.register.password" />
                                             </Div>
                                             <Div class="col-sm-6">
                                                        <g:field type="Password" name="password" id="rp" required="true" autocomplete="new-password" class="form-control" minlength="8" maxlength="12"/>
                                             </Div>
                                        </Div>



                                        <Div class="row form-group">                              <%-- add in message--%>
                                             <Div class="col-sm-6">
                                                       <g:message code="auth.register.confirmpassword" />
                                             </Div>
                                             <Div class="col-sm-6">
                                                        <g:field type="Password" name="registerConfirmPassword" id="crp" required="true" class="form-control" minlength="8" maxlength="12"/>
                                             </Div>
                                        </Div>

                                         <Div class="row form-group">                              <%-- add in message--%>
                                              <Div class="col-sm-6">
                                                         <g:message code="auth.register.photo" />
                                               </Div>
                                               <Div class="col-sm-6">
                                                         <input type="file" name="registerPhoto" accept="image/x-png ,image/jpeg,image/jpg" class="form-control"/>

                                                </Div>
                                               </Div>

                                    <div class="row">&nbsp;</div>
                                   <Div class="row form-group">
                                        <Div class="col-sm-6">
                                                               <%--empty--%>
                                         </Div>

                                          <Div class="col-sm-6">
                                            <g:submitButton name="update" value="Register" class="form-control" style="Background-color:#D3D3D3;"/></span></Div>
                                           </Div>


                                   </div>   <%--end of (in) row--%>

                        </g:uploadForm>

                        <div>

                     </div>
                   </div>

            </div>



      </div> <%-- e of container----%>


  <div>
</div>

<!-- Modal -->
<div class="modal fade" id="forgotPasswordModalId" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Forgot Password</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form id="forgotPasswordForm" >
      <div class="modal-body">

        <label class="form-control" style="Background-color:#ffcccb;">Enter Username Or Email :</label>
        <Input id="detailsOfUser" type="text" class="form-control" required="true"/>

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
        <button id="forgotPasswordSubmitButtonId" type="button" class="btn btn-primary">Send Reset Mail</button>
      </div></form>
    </div>
  </div>
</div>



</body>
</html>