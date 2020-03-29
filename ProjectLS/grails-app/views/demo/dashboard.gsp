<html>
<head>
<title>dashboard</title>

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


                                    <div class="row">

                                        <div class="col-5">
                                            <g:link action="userProfile" id="nameLink"  params="[otherUserId:activeUser.id]">
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

                                                 <g:link action="userProfile" id="nameLink" params="[otherUserId:activeUser.id]">
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
                                                                               <div id="nameOfTopic" class="col-7">${u?.topics.name}</div>
                                                                               <div class="col-5">

                                                                                <g:link action="userProfile" id="nameLink"  params="[otherUserId:u?.topics?.user?.id]">@${u?.topics?.user?.username}
                                                                                </g:link>

                                                                               </div><%--c--%>
                                                                            </div><hr>

                                                                             <div class="row">
                                                                                <div class="col-8">
                                                                                    <g:link action="unsubscribeAction" params="[topicinfo:u?.topics?.id]">UnSubscribe</g:link>

                                                                                </div>


                                                                                <div class="col-4">
                                                                                     Subs: ${u?.topics?.subscription?.size()}
                                                                                    Posts: ${u?.topics.resource.size()}



                                                                                 </div>
                                                                             </div>
                                                                             <div class="row"><input type="hidden" class="hiddenSubId" value="${u.id}">

                                                                                   <div class="col-6">

                                                                                          <g:select id="selectSeriousnessId" name="selectSeriousness" from="${['Casual','Serious','Very Serious']}" value="${u?.seriousness}"
                                                                                           class="form-control changeSeriousclass"/>


                                                                                   </div>

                                                                                   <div class="col-6">

                                                                                        <form >

                                                                                        <g:select id="selectVisibId" name="selectVisib" from="${['Public','Private']}" value="${u?.topics?.visibility}"
                                                                                        class="form-control"/>

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