<html>
<head>
<title>Edit Profile</title>

</head>

<body>
<g:render template="dashboardTop" />
<div class="row">&nbsp;</div>

   <g:if test="${flash.message}">
          <div id ="animateDiv" class="message" role="status" style="font-size: medium;color: white;background-color: green;font-weight: bold;">${flash.message}</div>
      </g:if>
      <g:if test="${flash.warning}">
          <div id ="animateDiv"  class="message_error" style="font-size: medium;color: white;background-color: red;font-weight: bold;">${flash.warning}</div>
      </g:if>


     <div class="bodyContent" id="bodyContent">

     </div>

<div class="container">
  <div class="row">    <%-- row 1 --%>
    <div class="col-sm-6">                <%-- container 1--%>

      <div class="container">  <%--e--%>


                         <div class="row">
                             <div class="card shadow p-0 bg-white rounded ">

                                   <div class="card-body ">

                                       <span class="col-4">
                                       <g:img dir="images" file="defaultpic.png" width="120" height="120" />
                                       </span>
                                       <span class="col-8" id="displayName"> ${activeUser.firstName} ${activeUser.lastName}</span>

                                       <div class="row"><span class="col-6">Subscribed: ${subbedTopics?.size()}</span><span class="col-6">Posts:${activeUser?.topics?.size()}</span></div>
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
               <g:form name="changeDetailForm" controller="Demo" action="changeUserPassword">
                           <Div class="row" >                              <%-- add in message--%>
                              <Div class="col-sm-6">
                               <g:message code="auth.register.password" />
                              </Div>
                              <Div class="col-sm-6">
                              <g:field type="Password" class="form-control" name="changePassword" value="" required="true" minlength="8" maxlength="15"/>
                              </Div>
                           </Div>

                            <div class="row">&nbsp;</div>

                           <Div class="row">
                                   <Div class="col-sm-6">
                                       <g:message code="auth.register.confirmpassword" />
                                   </Div>
                                   <Div class="col-sm-6">
                                       <g:field type="Password" class="form-control" name="changeConfirmPassword" value="" required="true"  minlength="8" maxlength="15" /></Div>
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
                <div class="card-header">
                  Topics
                </div>
                <div class="card-body">
                    <%----starts topics-----%>

                      <div class="container">

                                  <div id="flow1">

                                     <g:each in="${userTopics}" var="u" status="i">

                                        <div class="row">
                                            <div class="col-4">

                                            <g:img dir="images" file="defaultpic.png" width="100" height="100"/>

                                            </div>
                                            <div class="col-8"><%---right of pic---%>
                                               <form>
                                               <div class="row">
                                                   <div class="col-6"><input type="text" id="changeTopicName" name="NewTopicName" value="${u?.name}" class="form-control"></div>
                                                   <div class="col-5"><input type="submit" value="Save" class="form-control"></div>
                                                </div><hr>
                                                <div class="row"><div class="col-9">@${u?.user?.username}</div>

                                                <div class="col-3">
                                                <%--empty space here---%>


                                               </div></div>


                                                <div class="row">&nbsp;</div>
                                                <div class="row"><div class="col-10">
                                                        <div class="row">
                                                            <div class="col-6">
                                                            <g:select name="user.age" from="${['Serious','Casual','very_serious']}" value="${}"
                                                                                                                     class="form-control" />

                                                            </div>
                                                            <div class="col-6">
                                                            <g:select name="user.age" from="${['Public','Private']}" value="${u?.visibility}"
                                                                                                                                 class="form-control"/>
                                                            </div>
                                                         </div>




                                                </div>

                                                <div class="col-2">

                                                <g:link controller="demo" title="Delete Topic" action="deleteTopic" params="[topicId:u?.id]" > <g:img dir="images" file="deleteIcon.png" width="25" height="25"/></g:link>




                                                </div> </div>

                                                </form>

                                            </div>  <%---right of pic end---%>
                                        </div>
                                        <hr>

                                     </g:each>

                                   </div>    <%----div flow end------%>





                                </div>


                    <%----end topics--------%>
                </div>
              </div>

      </div>
      <div class="col-sm-6">                 <%-- container 4--%>

        <div class="card shadow p-0 bg-white rounded">
                     <div class="card-header">
                      Profile                                            <%--add in message--%>
                     </div>
                     <div class="card-body">
                       <Div class="container">
                       <g:form name="myDetailsForm" controller="demo" action="changeUserDeatails" method="post" class="form-group">
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

                        </g:form>

                        <div>

                     </div>
                   </div>

            </div>



      </div> <%-- e of container----%>


  <div>
</div>
</body>

</html>