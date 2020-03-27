<html>
<head>
<title>dashboard</title>



</head>
<body>
<g:render template="dashboardTop" />

<g:message code="default.link.skip.label" default=""/></a>


   <g:if test="${flash.message}">
      <div class="message">${flash.message}
</div>
    </g:if>

<div class="container">
<div class="row">

    <div class="col-6">   <%--start of left side of container--%>

       <div class="row">  <%--e--%>

            <div class="container">  <%--e--%>
                 <div class="row"> &nbsp;</div>

                    <div class="row">
                        <div class="card shadow p-0 bg-white rounded">

                              <div class="card-body">
                                  <span class="col-4">


                             <div class="row">

                                        <div class="col-5">
                                            <g:link action="userProfile" id="nameLink">
                                                 <g:if test="${session.getAttribute("userPhoto")}">

                                                    <img style="width: inherit"
                                                      src="data:image/jpg;base64,${session.getAttribute("userPhoto")}"/>
                                                 </g:if>
                                                 <g:else>
                                                     <g:img dir="images" file="defaultpic.png" width="100" height="100"/>
                                                 </g:else>
                                             </g:link>
                                        </div>
                                        <div class="col-7">

                                                 <g:link action="userProfile" id="nameLink">
                                                        <div class="row">&nbsp;</div>
                                                         <div class="row">  &nbsp;&nbsp;&nbsp;&nbsp;${activeUser.firstName} ${activeUser.lastName}</div>
                                                         <div class="row">


                                                                    <div class="col">Subscriptions:</div>
                                                                    <div class="row">${subbedTopics.size()}</div>
                                                                       <div class="col">Topics:</div>
                                                                     <div class="row">${usersTopics.size()}</div>


                                                         </div>



                                                 </g:link>

                                        </div>
			</div>





                              </div>
                        </div>
                    </div><%--end of first row --%>

                    <div class="row"> &nbsp;</div>

                            <div class="row">
                                <div class="card shadow p-0 bg-white rounded">
                                     <div class="card-header">
                                                 Topics
                                      </div>
                                      <div class="card-body">
                                            <h5 class="card-title">Special title treatment</h5>
                                            <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
                                             <a href="#">link</a>
                                      </div>
                                </div>
                            </div><%--end of 2 row --%>
                                     <div class="row">
                                         <div class="card shadow p-0 bg-white rounded">
                                               <div class="card-body">
                                                     <h5 class="card-title">Special title treatment</h5>
                                                     <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
                                                      <a href="#">link</a>
                                               </div>
                                         </div>
                                     </div><%--end of 3 row --%>

                     <div class="row"> &nbsp;</div>

                                     <div class="row">
                                         <div class="card shadow p-0 bg-white rounded">
                                              <div class="card-header">
                                                           Subscriptions
                                               </div>
                                               <div class="card-body">
                                                     <h5 class="card-title">Special title treatment</h5>
                                                     <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
                                                      <a href="#">link</a>
                                               </div>
                                         </div>
                                     </div><%--end of 4 row --%>

                                      <div class="row"> &nbsp;</div>


                   </div>      <%--e--%>

       </div>      <%--e--%>

    </div>  <%--end of left side of container--%>

    <div class="col-6">            <%--start of right side of container--%>

                        <div class="row"> &nbsp;
                        </div>

   <div class="row">
                <div class="card shadow p-0 bg-white rounded">
                     <div class="card-header">
                                Posts
                      </div>
                      <div class="card-body">
                            <h5 class="card-title">Special title treatment</h5>
                            <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
                             <a href="#">link</a>
                      </div>
                </div>
            </div><%--end of 2 row --%>
                     <div class="row">
                         <div class="card shadow p-0 bg-white rounded">
                               <div class="card-body">
                                     <h5 class="card-title">Special title treatment</h5>
                                     <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
                                      <a href="#">link</a>
                               </div>
                         </div>
                     </div><%--end of 3 row --%>

    </div>    <%--end of right side of container--%>

</div>

</div>


</body>
</html>