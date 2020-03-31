<html>
<head>
<title>dashboard</title>



</head>
<body>
<g:render template="dashboardTop" />



<div class="container">
<div class="row">

    <div class="col-6">   <%--start of left side of container--%>

       <div class="row">  <%--e--%>

            <div class="container">  <%--e--%>
                 <div class="row"> &nbsp;</div>

                    <div class="row">
                        <div class="card shadow p-0 bg-white rounded ">

                              <div class="card-body">
                                  <span class="col-4">


                             <div class="row">

                                        <div class="col-5">


                                                     <g:img dir="images" file="defaultpic.png" width="100" height="100"/>


                                        </div>
                                        <div class="col-7">


                                                        <div class="row">&nbsp;</div>
                                                         <div class="row">  &nbsp;&nbsp;&nbsp;&nbsp;${ou.firstName} ${ou.lastName}</div>
                                                         <div class="row">


                                                                    <div class="col"><font size="2" color="gray">Subscriptions:</font></div>
                                                                    <div class="row"><font size="2" color="gray">${ouSubs?.size()}</font></div>
                                                                       <div class="col"><font size="2" color="gray">Topics:</font></div>
                                                                     <div class="row"><font size="2" color="gray">${ouTopic.size()}</font></div>


                                                         </div>




                                        </div>
			</div>





                              </div>
                        </div>
                    </div><%--end of first row --%>

                    <div class="row"> &nbsp;</div>

                            <div class="row">
                                <div class="card shadow p-0 bg-white rounded w-75">
                                     <div class="card-header">
                                                 Topics
                                      </div>
                                      <div class="card-body">


                                          <div class="container" id="flow1"><%---corrections from here---%>

                                                   <g:if test="${ouTopic?.size()==0}">
                                                            <div class="row"><div class="col-12">No Topics To Show. Create New Topics.</div></div>

                                                    </g:if>
                                                    <g:else>

                                                        <div class="row"><div class="col-12">

                                                           <g:each in="${ouTopic}" var="u" status="i">

                                                                <div class="row">

                                                                        <div class="col-3">

                                                                        <g:img dir="images" file="defaultpic.png" width="80" height="80"/>

                                                                        </div>
                                                                        <div class="col-9">
                                                                            <div class="row">
                                                                               <div id="nameOfTopic" class="col-7">${u?.name}</div>
                                                                               <div class="col-5">

                                                                                <g:link action="userProfile" id="nameLink"  params="[otherUserId:u?.user?.id]">@${u?.user?.username}
                                                                                </g:link>

                                                                               </div><%--c--%>
                                                                            </div><hr>

                                                                             <div class="row">
                                                                                <div class="col-8">

                                                                                    <g:if test="${u?.user.username !=session.user }">
                                                                                         <g:link controller="subscription" action="subscribeAction" params="[inviteTopicId:u?.id]">Subscribe</g:link>
                                                                                    </g:if>
                                                                                    <g:else>
                                                                                          <g:link params="[inviteTopicId:u?.id]">Invite</g:link>
                                                                                    </g:else>
                                                                                </div>


                                                                                <div class="col-4">
                                                                                     Subs:${u?.subscription?.size()}


                                                                                 </div>
                                                                             </div>
                                                                             <div class="row">

                                                                                   <div class="col-6">



                                                                                   </div>

                                                                                   <div class="col-6">

                                                                                   </div>
                                                                             </div>

                                                                        </div>

                                                                </div><hr>

                                                           </g:each>


                                                        </div></div>

                                                     </g:else>
                                                  </div>



                                      </div>
                                </div>
                            </div><%--end of 2 row --%>


                     <div class="row"> &nbsp;</div>

                                     <div class="row">
                                         <div class="card shadow p-0 bg-white rounded w-75">
                                              <div class="card-header">
                                                           Subscriptions
                                               </div>
                                               <div class="card-body">



                                          <div class="container" id="flow1"><%---corrections from here---%>

                                                   <g:if test="${ouSubs?.size()==0}">
                                                            <div class="row"><div class="col-12">No Subscriptions yet . Subscribe to new Posts.</div></div>

                                                    </g:if>
                                                    <g:else>

                                                        <div class="row"><div class="col-12">

                                                           <g:each in="${ouSubs}" var="u" status="i">

                                                                <div class="row">

                                                                        <div class="col-3">

                                                                        <g:img dir="images" file="defaultpic.png" width="80" height="80"/>

                                                                        </div>
                                                                        <div class="col-9">
                                                                            <div class="row">
                                                                               <div id="nameOfTopic" class="col-7">${u?.topics?.name}</div>
                                                                               <div class="col-5">

                                                                                <g:link action="userProfile" id="nameLink"  params="[otherUserId:u?.topics?.user?.id]">@${u?.topics?.user?.username}
                                                                                </g:link>

                                                                               </div><%--c--%>
                                                                            </div><hr>

                                                                             <div class="row">
                                                                                <div class="col-8">

                                                                                    <g:if test="${u?.topics?.user.username !=session.user }">
                                                                                         <g:link controller="subscription" action="subscribeAction" params="[inviteTopicId:u?.topics?.id]">Subscribe</g:link>
                                                                                    </g:if>
                                                                                    <g:else>
                                                                                          <g:link params="[inviteTopicId:u?.topics?.id]">Invite</g:link>
                                                                                    </g:else>
                                                                                </div>


                                                                                <div class="col-4">
                                                                                     Subs:${u?.topics?.subscription?.size()}


                                                                                 </div>
                                                                             </div>
                                                                             <div class="row">

                                                                                   <div class="col-6">



                                                                                   </div>

                                                                                   <div class="col-6">

                                                                                   </div>
                                                                             </div>

                                                                        </div>

                                                                </div><hr>

                                                           </g:each>


                                                        </div></div>

                                                     </g:else>
                                                  </div>



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
                <div class="card shadow p-0 bg-white rounded w-100">
                     <div class="card-header">
                                Posts
                      </div>
                      <div class="card-body">
                            <%-----------------%>

                        <div class="container">

                        <g:if test="${!DisplayRes.isEmpty()}">

                             <%----display resource start---%>


                                      <div id="flow2">

                                         <g:each in="${DisplayRes}" var="u" status="i">

                                            <div class="row">
                                                <div class="col-4">

                                                <g:img dir="images" file="defaultpic.png" width="100" height="100"/>

                                                </div>
                                                <div class="col-8"><%---right of pic---%>

                                                   <div class="row">
                                                       <div class="col-7">Topic: ${u?.topics.name}</div>
                                                       <div class="col-5">By: ${u?.user.username}</div>
                                                    </div><hr>
                                                    <div class="row"><div class="col-12">${u?.name}</div>

                                                   </div>


                                                    <div class="row">&nbsp;</div>
                                                    <div class="row"><div class="col-4"><g:img dir="images" file="mailIcon.jpg" width="20" height="20" title="${u?.user.email}"/></div>

                                                    <div class="col-8">

                                                            <g:if test="${u?.class==LinkResources}">
                                                              <font size="2">
                                                               Resource: <a href="${u?.URl}">Link</a>
                                                              </font>
                                                           </g:if>
                                                           <g:else>
                                                               <font size="2">
                                                                  <g:link controller="Demo" action="downloadFile" params="[res:u?.id]"> Download
                                                                                                                     </g:link>
                                                               </font>
                                                           </g:else>

                                                           <g:if test="${!subbedTopics.contains(u?.topics)}"><font size="2">

                                                           <g:link controller="Subscription" action="subscribeTopic" params="[topicId:u?.topics.id]">
                                                                Subscribe
                                                           </g:link>


                                                           </font></g:if>

                                                    </div> </div>

                                                </div>  <%---right of pic end---%>
                                            </div>
                                            <hr>

                                         </g:each>

                                       </div>    <%----div flow end------%>


                              <%----display resource end---%>


                        </g:if>
                        <g:else>
                             No Posts yet. Users Can Create a New Topic or Subscribe to One.
                        </g:else>


                        </div>

                            <%------------------%>
                      </div>
                </div>
            </div><%--end of 2 row --%>
                     <div class="row">

                     </div><%--end of 3 row --%>

    </div>    <%--end of right side of container--%>

</div>

</div>


</body>
</html>