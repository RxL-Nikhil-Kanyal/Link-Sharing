<html>
<head>
<title>dashboard</title>


<g:javascript>




 </g:javascript>

</head>
<body>
<g:render template="dashboardTop" />


 <g:if test="${flash.message}">
        <div id="animateDiv" class="message" role="status" style="font-size: medium;color: white;background-color: green;font-weight: bold;">${flash.message}</div>
    </g:if>
    <g:if test="${flash.warning}">
        <div id="animateDiv" class="message_error" style="font-size: medium;color: white;background-color: red;font-weight: bold;">${flash.warning}</div>
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
                                  <g:link action="userProfile" id="nameLink">
                                  <span class="col-4">

                                        <g:if test="${session.getAttribute("userPhoto")}">

                                         <img style="width: inherit" src="data:image/jpg;base64,${session.getAttribute("userPhoto")}"/>
                                        </g:if>
                                        <g:else>
                                             <g:img dir="images" file="defaultpic.png" width="120" height="120"/>
                                        </g:else>







                                  </span></g:link>
                                   <g:link action="userProfile" id="nameLink">

                                  <span class="col-8" id="displayName">
                                    ${activeUser.firstName} ${activeUser.lastName}

                                  </span></g:link>

                              </div>

                        </div>
                    </div><%--end of first row --%>

                    <div class="row"> &nbsp;</div>

                            <div class="row">
                                <div class="card shadow p-0 bg-white rounded">
                                     <div class="card-header">
                                                  Subscriptions
                                      </div>
                                      <div class="card-body" id="flow1">

                                          <div class="container"><%---corrections from here---%>

                                                   <g:if test="${listOfSubs.size()==0}">
                                                            <div class="row"><div class="col-12">No Subscriptions yet . Subscribe to new Posts.</div></div>

                                                    </g:if>
                                                    <g:else>

                                                        <div class="row"><div class="col-12">

                                                           <g:each in="${listOfSubs}" var="u" status="i">

                                                                <div class="row">

                                                                        <div class="col-3">

                                                                        <g:img dir="images" file="defaultpic.png" width="80" height="80"/>

                                                                        </div>
                                                                        <div class="col-9">
                                                                            <div class="row">
                                                                               <div class="col-7">${u?.topics.name}</div>
                                                                               <div class="col-5">@${u?.topics?.user?.username}</div><%--c--%>
                                                                            </div><hr>

                                                                             <div class="row">
                                                                                <div class="col-8">
                                                                                    <g:link action="unsubscribeAction" params="[topicinfo:u?.topics?.id]">UnSubscribe</g:link>

                                                                                </div>


                                                                                <div class="col-4">
                                                                                     Subs: ${listOfSubs?.user?.size()}
                                                                                    Posts: ${listOfSubs?.topics?.user?.size()}



                                                                                 </div>
                                                                             </div>




                                                                        </div>

                                                                </div><hr>

                                                           </g:each>


                                                        </div></div>




                                                     </g:else>



                                          </div><%------corrections to here-----%>


                                      </div>
                                </div>
                            </div><%--end of 2 row --%>


                     <div class="row"> &nbsp;</div>

                                     <div class="row">
                                         <div class="card shadow p-0 bg-white rounded">
                                              <div class="card-header">
                                                           Trending Topics
                                               </div>
                                               <div class="card-body">
                                                     <h5 class="card-title">Special title treatment</h5>
                                                     <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
                                                      <a href="#">link</a>
                                               </div>
                                         </div>
                                     </div><%--end of 4 row --%>

                                      <div class="row"> &nbsp;</div>

                                              <div class="row">
                                                  <div class="card shadow p-0 bg-white rounded" id="sendinvites">
                                                       <div class="card-header" style="display: none;">
                                                                    send invites(pop up)
                                                        </div>
                                                        <div class="card-body" style="display: none;">





                                                        </div>
                                                  </div>
                                              </div><%--end of 5 row --%>


                   </div>      <%--e--%>

       </div>      <%--e--%>

    </div>  <%--end of left side of container--%>

    <div class="col-6">            <%--start of right side of container--%>

                        <div class="row"> &nbsp;
                        </div>

                                   <div class="row">
                                        <div class="card shadow p-0 bg-white rounded">
                                             <div class="card-header">
                                                          Inbox
                                              </div>
                                              <div class="card-body">
                                                    <h5 class="card-title">Special title treatment</h5>
                                                    <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
                                                     <a href="#">link</a>
                                              </div>
                                        </div>
                                    </div>         <%--end of 1 row --%>

              <div class="row"> &nbsp;</div>

                                                <div class="row">
                                                    <div class="card shadow p-0 bg-white rounded" id="shareLink">
                                                         <div class="card-header" style="display: none;">
                                                                      Share Link
                                                          </div>
                                                          <div class="card-body" style="display: none;">

                                                          </div>
                                                    </div>
                                                </div><%--end of 2 row --%>
                          <div class="row"> &nbsp;</div>

                                                            <div class="row">
                                                                <div class="card shadow p-0 bg-white rounded" id="sharetopic">
                                                                     <div class="card-header" style="display: none;">
                                                                                  Share Document
                                                                      </div>
                                                                      <div class="card-body" style="display: none;">

                                                                         <%-----------start here form-----------%>

                                                                      </div>
                                                                </div>
                                                            </div><%--end of 3 row --%>
                         <div class="row"> &nbsp;</div>

                                                            <div class="row">

                                                            </div><%--end of 4 row --%>


    </div>    <%--end of right side of container--%>

</div>

</div>


</body>
</html>