<html>
<head>
<title>My Posts</title>

</head>

<body>
<g:render template="dashboardTop" />
edit profile
   <g:message code="default.link.skip.label" default=""/></a>

     <div class="bodyContent" id="bodyContent">

       <g:if test="${flash.message}">
         <div class="message">${flash.message}
   </div>
       </g:if>
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
                                   </div>
                             </div>
                         </div><%--end of first row --%>

       </div>


    </div>
    <div class="col-sm-6">                 <%-- container 2--%>

      <div class="card shadow p-0 bg-white rounded">
             <div class="card-header">
              <g:message code="editProfile.Profile" />
             </div>
             <div class="card-body">
               <Div class="container">
               <g:form name="changeDetailForm" controller="Demo" action="changeUserPassword">
                           <Div class="row" >                              <%-- add in message--%>
                              <Div class="col-sm-6">
                               <g:message code="auth.register.password" />
                              </Div>
                              <Div class="col-sm-4">
                              <g:field type="Password" name="changePassword" value="" required="true" />
                              </Div>
                           </Div>

                            <Div class="row">
                            </Div>

                           <Div class="row">
                                   <Div class="col-sm-6">
                                       <g:message code="auth.register.confirmpassword" />
                                   </Div>
                                   <Div class="col-sm-4">
                                       <g:field type="Password" name="changeConfirmPassword" value="" required="true" /></Div>
                                    </Div>
                           </Div>

                           <Div class="row">
                                <Div class="col-sm-6">

                                 </Div>
                                 <Div class="col-sm-1">

                                 </Div>
                                  <Div class="col-sm-5">
                                    <g:submitButton name="updatePassword" value="submit"/></span></Div>
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
                      Profile                                            <%--add in message--%>
                     </div>
                     <div class="card-body">
                       <Div class="container">
                       <g:form name="myDetailsForm" controller="demo" action="changeUserDeatails" method="post">
                                   <Div class="row">                              <%-- add in message--%>
                                      <Div class="col-sm-6">
                                       <g:message code="auth.register.firstname" />
                                      </Div>
                                      <Div class="col-sm-4">
                                      <g:field type="text" name="changeFirstname"  />
                                      </Div>
                                   </Div>


                                      <Div class="row">                              <%-- add in message--%>
                                            <Div class="col-sm-6">
                                                   <g:message code="auth.register.lastname" />
                                             </Div>
                                            <Div class="col-sm-4">
                                                    <g:field type="text" name="changeLastname"  />
                                              </Div>
                                       </Div>




                                       <Div class="row">                              <%-- add in message--%>
                                             <Div class="col-sm-6">
                                                          <g:message code="auth.register.username" />
                                             </Div>
                                             <Div class="col-sm-4">
                                                          <g:field type="text" name="changeUsername"  />
                                              </Div>
                                       </Div>



                                         <Div class="row">                              <%-- add in message--%>
                                              <Div class="col-sm-6">
                                                         <g:message code="auth.register.photo" />
                                               </Div>
                                               <Div class="col-sm-4">
                                                         <input type="file" name="changePhoto" accept="image/x-png,image/gif,image/jpeg" />
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
                                            <g:submitButton name="changePersonDetail" value="submit"/></span></Div>
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