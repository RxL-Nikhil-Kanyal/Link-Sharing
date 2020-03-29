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

 <g:message code="default.link.skip.label" default="" />



     <div class="bodyContent" id="bodyContent">

   <g:if test="${flash.message}">
          <div id ="animateDiv" class="message" role="status" style="font-size: medium;color: white;background-color: green;font-weight: bold;">${flash.message}</div>
      </g:if>
      <g:if test="${flash.warning}">
          <div id ="animateDiv"  class="message_error" style="font-size: medium;color: white;background-color: red;font-weight: bold;">${flash.warning}</div>
      </g:if>

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

                        <g:img dir="images" file="defaultpic.png" width="100" height="100"/>

                        </div>
                        <div class="col-8"><%---right of pic---%>

                           <div class="row">
                               <div class="col-7">${u?.user.username}</div>
                               <div class="col-5">${u?.topics.name}</div>
                            </div><hr>
                            <div class="row"><div id="ellps" class="col-9">${u?.name}</div>

                            <div class="col-3">

                           <g:link controller="authentication" action="PublicTopicsShow" params="[topicRelated:u.id]">
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
                                        Resource:   <g:link controller="Demo" action="downloadFile" params="[res:u?.id]"> Download
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
                              required="true"  class="form-control"/>
                              </Div>
                           </Div>

                            <Div class="row form-group">
                            </Div>

                           <Div class="row">
                                   <Div class="col-sm-6">
                                       <g:message code="auth.login.password" />
                                   </Div>
                                   <Div class="col-sm-6">
                                       <g:field type="Password" name="passwd" value=""
                                       required="true" class="form-control"/></Div>
                                    </Div>
                           </Div>

                           <Div class="row">
                                <Div class="col-sm-5">
                                           <a href="" >forgot Password</a>
                                 </Div>
                                 <Div class="col-sm-2">

                                 </Div>
                                  <Div class="col-sm-4">
                                    <g:submitButton name="update" value="submit" class="form-control"/></span></Div>
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
                  <h5 class="card-title">Special title treatment</h5>
                  <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
                  <a href="#">link</a>
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
                       <g:form name="myForm" controller="Authentication" action="RegisterAction"
                       method="post" >
                                   <Div class="row form-group">                              <%-- add in message--%>
                                      <Div class="col-sm-6">
                                       <g:message code="auth.register.firstname" />
                                      </Div>
                                      <Div class="col-sm-6">
                                      <g:field type="text" name="regfirstname"  required="true" class="form-control" />
                                      </Div>
                                   </Div>


                                      <Div class="row form-group">                              <%-- add in message--%>
                                            <Div class="col-sm-6">
                                                   <g:message code="auth.register.lastname" />
                                             </Div>
                                            <Div class="col-sm-6">
                                                    <g:field type="text" name="reglastname"  required="true" class="form-control"/>
                                              </Div>
                                       </Div>


                                          <Div class="row form-group">                              <%-- add in message--%>
                                                  <Div class="col-sm-6">
                                                          <g:message code="auth.register.email" />
                                                   </Div>
                                                   <Div class="col-sm-6">
                                                          <g:field type="email" name="regemail"  required="true" class="form-control"/>
                                                   </Div>
                                           </Div>


                                       <Div class="row form-group">                              <%-- add in message--%>
                                             <Div class="col-sm-6">
                                                          <g:message code="auth.register.username" />
                                             </Div>
                                             <Div class="col-sm-6 ">
                                                          <g:field type="text" name="regusername"  required="true" class="form-control"/>
                                              </Div>
                                       </Div>

                                        <Div class="row form-group">                              <%-- add in message--%>
                                             <Div class="col-sm-6">
                                                       <g:message code="auth.register.password" />
                                             </Div>
                                             <Div class="col-sm-6">
                                                        <g:field type="Password" name="regpassword" id="rp" required="true" autocomplete="new-password" class="form-control" minlength="8" maxlength="15"/>
                                             </Div>
                                        </Div>



                                        <Div class="row form-group">                              <%-- add in message--%>
                                             <Div class="col-sm-6">
                                                       <g:message code="auth.register.confirmpassword" />
                                             </Div>
                                             <Div class="col-sm-6">
                                                        <g:field type="Password" name="regconfirmpassword" id="crp" required="true" class="form-control" minlength="8" maxlength="15"/>
                                             </Div>
                                        </Div>

                                         <Div class="row form-group">                              <%-- add in message--%>
                                              <Div class="col-sm-6">
                                                         <g:message code="auth.register.photo" />
                                               </Div>
                                               <Div class="col-sm-6">
                                                         <input type="file" name="regphoto" accept="image/x-png,image/gif,image/jpeg" class="form-control"/>
                                                </Div>
                                               </Div>

                                    <div class="row">&nbsp;</div>
                                   <Div class="row form-group">
                                        <Div class="col-sm-6">
                                                               <%--empty--%>
                                         </Div>
                                         <Div class="col-sm-1">
                                                                <%--empty--%>
                                         </Div>
                                          <Div class="col-sm-5">
                                            <g:submitButton name="update" value="submit" class="form-control"/></span></Div>
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