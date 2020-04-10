<html>
<head>
<title>Edit Profile</title>

</head>

<body>
<g:render template="/user/dashboardTop" />
<asset:javascript src="editProfile.js"/>

<div class="row">&nbsp;</div>


     <div class="bodyContent" id="bodyContent">

     </div>

<div class="container">
  <div class="row">    <%-- row 1 --%>
    <div class="col-sm-6">                <%-- container 1--%>

      <div class="container">  <%--e--%>


                         <div class="row">
                             <div class="card shadow p-0 bg-white rounded " style="border:2px solid;">

                                   <div class="card-body " style="border:2px solid;border-radius: 15px;box-shadow: 10px 15px #888888;">

                                       <span class="col-4">
                                       <g:if test="${activeUser.photo!=null}">
                                           <img height="90" style="margin-top: 10px;margin-left: 0px,margin-bottom: 10px;margin-right: 10px "  width="90" src="${createLink(controller: 'user', action: 'fetchPersonImage', params: ['userId':activeUser.id])}"/>
                                        </g:if>
                                        <g:else>
                                            <g:img dir="images" file="defaultpic.png" width="100" height="100"/>
                                        </g:else>
                                       </span>
                                       <span class="col-8" id="displayName"> ${activeUser.firstName} ${activeUser.lastName}</span>

                                       <div class="row"><span class="col-6"><font size="2" color="gray">Subscribed: ${subbedTopics?.size()}</font></span>
                                       <span class="col-6"><font size="2" color="gray">Posts:${activeUser?.topics?.size()}</font></span></div>
                                   </div>
                             </div>
                         </div><%--end of first row --%>
       </div>
    </div>
    <div class="col-sm-6">                 <%-- container 2--%>

      <div class="card shadow p-0 bg-white rounded">
             <div class="card-header">
              <g:message code="editProfile.changePassword" /><%---aaaaaddddd--%>
             </div>
             <div class="card-body">
               <Div class="container">
               <g:form name="changeDetailForm" controller="user" action="updateUserPassword">
                           <Div class="row" >                              <%-- add in message--%>
                              <Div class="col-sm-6">
                               <g:message code="auth.register.password" />
                              </Div>
                              <Div class="col-sm-6">
                              <g:field type="Password" class="form-control" name="changePassword" value="" required="true" minlength="8" maxlength="12"/>
                              </Div>
                           </Div>

                            <div class="row">&nbsp;</div>

                           <Div class="row">
                                   <Div class="col-sm-6">
                                       <g:message code="auth.register.confirmpassword" />
                                   </Div>
                                   <Div class="col-sm-6">
                                       <g:field type="Password" class="form-control" name="changeConfirmPassword" value="" required="true"  minlength="8" maxlength="12" /></Div>
                                    </Div>
                           </Div>
                           <div class="row">&nbsp;</div>

                           <Div class="row">
                                <Div class="col-sm-6">

                                 </Div>
                                 <Div class="col-sm-1">

                                 </Div>
                                  <Div class="col-sm-5">
                                    <g:submitButton name="updatePassword" value="submit" class="form-control"/></span></Div>
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
           <%----------------------------------%>
             <table id="topicTableId">
                  <thead ><tr><th class="card-header" style="text-align:center;size:4;"> Topics</th></tr></thead>
                     <tbody>

                     <g:each in="${userSubbedTopics}" var="u" status="i">
                       <tr><td>
                        <div class="row">
                            <div class="col-4">

                                <g:if test="${u?.topics?.user?.photo!=null}">

                                    <img height="90" style="margin-top: 10px;margin-left: 0px,margin-bottom: 10px;margin-right: 10px "  width="90"
                                    src="${createLink(controller: 'user', action: 'fetchPersonImage', params: ['userId':u?.topics.user.id])}"/>
                                 </g:if>
                                 <g:else>
                                     <g:img dir="images" file="defaultpic.png" width="100" height="100"/>
                                 </g:else>

                            </div>
                            <div class="col-8"><%---right of pic---%>

                               <div class="row">
                                   <input type="text" style="width:60%;"id="${u?.topics.id}" name="NewTopicName" value="${u?.topics.name}" class="form-control">
                                   <input id="editProfileTopicChange" style="background-color:#D3D3D3;width:30%"type="submit" value="Save" class="form-control saveTopicChangesButton" >
                                </div><hr>
                                <div class="row"><div class="col-7">@${u?.topics?.user?.username}</div>

                                <div class="col-5">

                                <font size="2" color="gray">Subs: ${u?.topics?.subscription?.size()}</font>
                                <font size="2" color="gray">Posts:${u?.topics?.resource?.size()}</font>


                               </div></div>


                                <div class="row">&nbsp;</div>
                                <div class="row"><div class="col-10">
                                        <div class="row">
                                            <div class="col-6">
                                            <g:select id="${u.id}" name="seriousnessChange" from="${['Serious','Casual','very_serious']}" value="${u?.seriousness}"
                                                                                                     class="form-control changeSeriousness" />

                                            </div>
                                            <div class="col-6">
                                            <g:select id="${u.topics.id}" name="visibilityChange" from="${['Public','Private']}" value="${u?.topics?.visibility}"
                                                                                                                 class="form-control visibilityChange"/>
                                            <Input type="hidden" name="subsIdentify" id="subId" value="${u?.id}"  />
                                            </div>
                                         </div>
                                </div>

                                <div class="col-2">

                                <g:img id="${u?.topics.id}" class="deleteTopicClass" dir="images" file="deleteIcon.png" title="delete topic" width="20" height="20"/>
                                </div> </div>
                            </div>  <%---right of pic end---%>
                        </div>
                        <div class="row"><font size="1" style="visibility:hidden;">${u?.topics.name}</font></div>
                        <hr>
                       </td> </tr>
                     </g:each>
                     </tbody>
                 </table>
               <%---------------------------------%>
        </div>
    </div>
      <div class="col-sm-6">                 <%-- container 4--%>

        <div class="card shadow p-0 bg-white rounded">
                     <div class="card-header">
                      Profile                                            <%--add in message--%>
                     </div>
                     <div class="card-body">
                       <Div class="container">
                       <g:uploadForm name="myDetailsForm" controller="user" action="updateUserProfile" method="post" class="form-group">
                                   <Div class="row">                              <%-- add in message--%>
                                      <Div class="col-sm-6">
                                       <g:message code="auth.register.firstname" />
                                      </Div>

                                      <Div class="col-sm-6">
                                      <g:field type="text" name="changeFirstname"  class="form-control"/>
                                      </Div>
                                   </Div>

                                   <div class="row">&nbsp;</div>


                                      <Div class="row">                              <%-- add in message--%>
                                            <Div class="col-sm-6">
                                                   <g:message code="auth.register.lastname" />
                                             </Div>
                                            <Div class="col-sm-6">
                                                    <g:field type="text" name="changeLastname" class="form-control"/>
                                              </Div>
                                       </Div>

                                       <div class="row">&nbsp;</div>


                                       <Div class="row">                              <%-- add in message--%>
                                             <Div class="col-sm-6">
                                                          <g:message code="auth.register.username" />
                                             </Div>
                                             <Div class="col-sm-6">
                                                          <g:field type="text" name="changeUsername" class="form-control" />
                                              </Div>
                                       </Div>

                                       <div class="row">&nbsp;</div>

                                         <Div class="row">                              <%-- add in message--%>
                                              <Div class="col-sm-6">
                                                         <g:message code="auth.register.photo" />
                                               </Div>
                                               <Div class="col-sm-6">
                                                         <input type="file" name="changePhoto" accept="image/x-png,image/gif,image/jpeg" class="form-control"/>
                                                </Div>
                                               </Div>

                                    <div class="row">&nbsp;</div>
                                   <Div class="row">
                                        <Div class="col-sm-6">
                                                               <%--empty--%>
                                         </Div>
                                         <Div class="col-sm-1">
                                                                <%--empty--%>
                                         </Div>
                                          <Div class="col-sm-5">
                                            <g:submitButton name="changePersonDetail" value="submit" class="form-control"/></span></Div>
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

<asset:javascript src="dataTable.js"/>
</body>

</html>