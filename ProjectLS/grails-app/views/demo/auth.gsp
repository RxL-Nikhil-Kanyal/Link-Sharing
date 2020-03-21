<html>
<head>
<title>homePage</title>

</head>
<body>
<g:render template="top" />

   <g:message code="default.link.skip.label" default=""/></a>


<g:hasErrors bean="${myUser}" field="name">
    <g:message error="${myUser.errors.getFieldErrors("name")}" />
</g:hasErrors>


     <div class="bodyContent" id="bodyContent">

       <g:if test="${flash.message}">
         <div class="message">${flash.message}
   </div>
       </g:if>
     </div>

<div class="container">
  <div class="row">    <%-- row 1 --%>
    <div class="col-sm-6">                <%-- container 1--%>

      <div class="card">
        <div class="card-header">
          Recent Shares
        </div>
        <div class="card-body">
          <h5 class="card-title">Special title treatment</h5>
          <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
          <a href="#">link</a>
        </div>
      </div>

    </div>



    <div class="col-sm-6">                 <%-- container 2--%>

      <div class="card">
             <div class="card-header">
              Login
             </div>
             <div class="card-body">
               <Div class="container">
               <g:form name="myForm" controller="Demo" action="myAction">
                           <Div class="row" >                              <%-- add in message--%>
                              <Div class="col-sm-6">
                               <g:message code="auth.login.username" />
                              </Div>
                              <Div class="col-sm-4">
                              <g:field type="text" name="username" value="" required="true" />
                              </Div>
                           </Div>

                            <Div class="row">
                            </Div>

                           <Div class="row">
                                   <Div class="col-sm-6">
                                       <g:message code="auth.login.password" />
                                   </Div>
                                   <Div class="col-sm-4">
                                       <g:field type="Password" name="passwd" value="" required="true" /></Div>
                                    </Div>
                           </Div>

                           <Div class="row">
                                <Div class="col-sm-6">
                                           <a href="" >forgot Password</a>
                                 </Div>
                                 <Div class="col-sm-1">

                                 </Div>
                                  <Div class="col-sm-5">
                                    <g:submitButton name="update" value="submit"/></span></Div>
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

        <div class="card">
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

        <div class="card">
                     <div class="card-header">
                      Register                                              <%--add in message--%>
                     </div>
                     <div class="card-body">
                       <Div class="container">
                       <g:form name="myForm" controller="demo" action="RegisterAction" method="post">
                                   <Div class="row">                              <%-- add in message--%>
                                      <Div class="col-sm-6">
                                       <g:message code="auth.register.firstname" />
                                      </Div>
                                      <Div class="col-sm-4">
                                      <g:field type="text" name="regfirstname"  required="true" />
                                      </Div>
                                   </Div>


                                      <Div class="row">                              <%-- add in message--%>
                                            <Div class="col-sm-6">
                                                   <g:message code="auth.register.lastname" />
                                             </Div>
                                            <Div class="col-sm-4">
                                                    <g:field type="text" name="reglastname"  required="true" />
                                              </Div>
                                       </Div>


                                          <Div class="row">                              <%-- add in message--%>
                                                  <Div class="col-sm-6">
                                                          <g:message code="auth.register.email" />
                                                   </Div>
                                                   <Div class="col-sm-4">
                                                          <g:field type="text" name="regemail"  required="true" />
                                                   </Div>
                                           </Div>


                                       <Div class="row">                              <%-- add in message--%>
                                             <Div class="col-sm-6">
                                                          <g:message code="auth.register.username" />
                                             </Div>
                                             <Div class="col-sm-4">
                                                          <g:field type="text" name="regusername"  required="true" />
                                              </Div>
                                       </Div>

                                        <Div class="row">                              <%-- add in message--%>
                                             <Div class="col-sm-6">
                                                       <g:message code="auth.register.password" />
                                             </Div>
                                             <Div class="col-sm-4">
                                                        <g:field type="Password" name="regpassword"  required="true" />
                                             </Div>
                                        </Div>



                                        <Div class="row">                              <%-- add in message--%>
                                             <Div class="col-sm-6">
                                                       <g:message code="auth.register.confirmpassword" />
                                             </Div>
                                             <Div class="col-sm-4">
                                                        <g:field type="Password" name="regconfirmpassword"  required="true" />
                                             </Div>
                                        </Div>

                                         <Div class="row">                              <%-- add in message--%>
                                              <Div class="col-sm-6">
                                                         <g:message code="auth.register.photo" />
                                               </Div>
                                               <Div class="col-sm-4">
                                                         <input type="file" name="regphoto" accept="image/x-png,image/gif,image/jpeg" />
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
                                            <g:submitButton name="update" value="submit"/></span></Div>
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