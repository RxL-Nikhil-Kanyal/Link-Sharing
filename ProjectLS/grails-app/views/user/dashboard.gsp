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
                        <div class="card shadow p-0 bg-white rounded" style="border:2px solid;">
                             <div class="card-body">
                                    <div class="row" style="border:2px solid;border-radius: 15px;box-shadow: 5px 10px #888888;">
                                        <div class="col-5">
                                            <g:link controller="user" action="userProfile" id="nameLink"  params="[otherUserId:activeUser.id]">
                                                 <g:if test="${activeUser.photo!=null}">

                                                    <img height="90" style="margin-top: 10px;margin-left: 0px,margin-bottom: 10px;margin-right: 10px "  width="90" src="${createLink(controller: 'user', action: 'fetchPersonImage', params: ['userId':activeUser.id])}"/>
                                                 </g:if>
                                                 <g:else>
                                                     <g:img dir="images" file="defaultpic.png" width="100" height="100"/>
                                                 </g:else>
                                             </g:link>
                                        </div>
                                        <div class="col-7">

                                                        <div class="row">&nbsp;</div>
                                                  <g:link controller="user" action="userProfile" id="nameLink" params="[otherUserId:activeUser.id]">
                                                         <div class="row">  &nbsp;&nbsp;&nbsp;&nbsp;${activeUser.firstName} ${activeUser.lastName}</div>
                                                  </g:link>
                                                 <g:link controller="user" action="userProfile" id="nameLink" params="[otherUserId:activeUser.id]">
                                                         <div class="row">
                                                                    <div class="col"><font size="2" color="gray">Subscriptions:</font></div>
                                                                    <div class="row"><font size="2" color="gray">${subbedTopics.size()}</font></div>
                                                                       <div class="col"><font size="2" color="gray">Topics:</font></div>
                                                                     <div class="row"><font size="2" color="gray">${usersTopics.size()}</font></div>
                                                         </div>
                                                 </g:link>
                                        </div>
                                    </div>
                              </div>
                        </div>
                    </div><%--end of first row --%>

                    <div class="row"> &nbsp;</div>

                            <div class="row">
                                <div class="card shadow p-0 bg-white rounded " style="width: 80%;">
                                     <div class="card-header">
                                                  Subscriptions
                                      </div>
                                      <div class="card-body" id="flow1">

                                          <div class="container" id="subscriptionContainerId"><%---corrections from here---%>

                                                   <g:if test="${listOfSubs.size()==0}">
                                                            <div class="row"><div class="col-12"><font color="gray">No Subscriptions yet . Subscribe to new Posts.</font></div></div>

                                                    </g:if>
                                                    <g:else>
                                                        <div class="row"><div class="col-12">
                                                           <g:each in="${listOfSubs}" var="u" status="i">
                                                                <div class="row">
                                                                        <div class="col-3">
                                                                        <g:if test="${u?.topics?.user.photo!=null}">

                                                                            <img height="90" style="margin-top: 10px;margin-left: 0px,margin-bottom: 10px;margin-right: 10px "  width="90" src="${createLink(controller: 'user', action: 'fetchPersonImage',
                                                                             params: ['userId':u?.topics.user.id])}"/>
                                                                         </g:if>
                                                                         <g:else>
                                                                             <g:img dir="images" file="defaultpic.png" width="100" height="100"/>
                                                                         </g:else>
                                                                        </div>
                                                                        <div class="col-1"></div>
                                                                        <div class="col-8">
                                                                            <div class="row">
                                                                               <div id="nameOfTopic" class="col-7">
                                                                               <g:link controller="topic" action="topicsShow" params="[topicId:u?.topics.id]">
                                                                               ${u?.topics?.name}</g:link></div>
                                                                               <div class="col-5">

                                                                                <g:link controller="user" action="userProfile" id="nameLink"  params="[otherUserId:u?.topics?.user?.id]">@${u?.topics?.user?.username}
                                                                                </g:link>

                                                                               </div><%--c--%>
                                                                            </div><hr>

                                                                             <div class="row">
                                                                                <div class="col-8">

                                                                                    <g:if test="${u?.topics.user.username!=session.user}">
                                                                                     <a href="" id="${u?.topics.id}" class="topicUnsubscribeClass">UnSubscribe</a>
                                                                                     <a href="" style="display:none;" id="${u?.topics.id}" class="topicSubscribeClass" >Subscribe</a>

                                                                                    </g:if>

                                                                                </div>
                                                                                <div class="col-4">
                                                                                   <font size="2" color="gray">  Subs: ${u?.topics?.subscription?.size()}</font>
                                                                                   <font size="2" color="gray"> Posts: ${u?.topics.resource.size()}</font>
                                                                                 </div>
                                                                             </div>
                                                                             <div class="row">
                                                                                   <div class="col-6">
                                                                                          <g:select id="${u.id}" name="selectSeriousness" from="${['Casual','Serious','Very_Serious']}" value="${u?.seriousness}"
                                                                                           class="form-control changeSeriousness"/>

                                                                                   </div>
                                                                                   <div class="col-6">
                                                                                        <form >
                                                                                        <g:select id="${u?.topics?.id}" name="selectVisib" from="${['Public','Private']}" value="${u?.topics?.visibility}"
                                                                                        class="form-control visibilityChange"/>

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
                             <div class="card shadow p-0 bg-white rounded " style="width: 80%;">
                                  <div class="card-header">
                                               Trending Topics
                                   </div>
                                   <div id="flow1" class="card-body">
                                         <%-----------------------------------------------%>
                                       <g:if test="${trendingTopicsAndCount.size()==0}">
                                             <div class="row"><div class="col-12"><font color="gray">No Topics . Create new Topics.</font></div></div>

                                       </g:if>
                                          <g:else>

                                              <div class="row"><div class="col-12">

                                                 <g:each in="${trendingTopicsAndCount}" var="topicAndCountRow" status="i">

                                                      <div class="row">

                                                              <div class="col-3">

                                                              <g:if test="${topicAndCountRow[1]?.user.photo!=null}">

                                                                  <img height="90" style="margin-top: 20px;margin-left: 15px "  width="90"
                                                                  src="${createLink(controller: 'user', action: 'fetchPersonImage', params: ['userId':topicAndCountRow[1].user.id])}"/>
                                                               </g:if>
                                                               <g:else>
                                                                   <g:img dir="images" file="defaultpic.png" width="100" height="100"/>
                                                               </g:else>

                                                              </div>
                                                              <div class="col-1"></div>
                                                              <div class="col-8">
                                                                  <div class="row">
                                                                     <div style=" " id="nameOfTopic" class="col-7 ${topicAndCountRow[1].name} ">
                                                                      <g:link controller="topic" action="topicsShow" params="[topicId:topicAndCountRow[1].id]">
                                                                     ${topicAndCountRow[1]?.name}</g:link>

                                                                     </div>

                                                                     <div class="col-5">

                                                                      <g:link controller="user" action="userProfile" id="nameLink"  params="[otherUserId:topicAndCountRow[1]?.user?.id]">@${topicAndCountRow[1]?.user?.username}
                                                                      </g:link>


                                                                     </div><%--c--%>
                                                                  </div><hr>
                                                                  <div class="row">
                                                                   <input style="display:none;width:70%;" type="text" class="form-control ${topicAndCountRow[1].name}" id="${topicAndCountRow[1]?.id}" value="${topicAndCountRow[1]?.name}" />

                                                                  <input  style="display:none;width:30%;" type="button" class="form-control ${topicAndCountRow[1].name} saveTopicChangesButton" value="save"/>
                                                                    </div>
                                                                   <div class="row">
                                                                      <div class="col-8">
                                                                            <g:if test="${topicAndCountRow[1]?.user.username==session.user}">
                                                                                    <g:img id="${topicAndCountRow[1].name}" class="editNameButtonClass" dir="images" file="edit.png" width="20" height="20"/>
                                                                                    <g:img id="${topicAndCountRow[1]?.id}"class="deleteTopicClass" dir="images" file="deleteIcon.png" title="delete topic" width="20" height="20"/>

                                                                                   <%------------ edit/delete here----------------%>
                                                                            </g:if>
                                                                            <g:else>
                                                                                <g:if test="${activeUser.admin}">
                                                                                        <g:if test="${subbedTopics.name.contains(topicAndCountRow[1].name)}">
                                                                                            <a href="" id="${topicAndCountRow[1]?.id}" class="topicUnsubscribeClass">UnSubscribe</a>
                                                                                              <a href="" style="display:none;" id="${topicAndCountRow[1]?.id}" class="topicSubscribeClass" >Subscribe</a>
                                                                                             <%------------- Unsubscribe addquery---------------%>

                                                                                        </g:if>
                                                                                        <g:else>
                                                                                             <a href="" style="display:none;" id="${topicAndCountRow[1]?.id}" class="topicUnsubscribeClass">UnSubscribe</a>
                                                                                               <a href="" id="${topicAndCountRow[1]?.id}" class="topicSubscribeClass" >Subscribe</a>
                                                                                           <%----------------  subscibe addquery---------------%>
                                                                                        </g:else>

                                                                                         <g:img id="${topicAndCountRow[1].name}" class="editNameButtonClass" dir="images" file="edit.png" width="20" height="20"/>
                                                                                         <g:img id="${topicAndCountRow[1].id}" class="deleteTopicClass" dir="images" file="deleteIcon.png" title="delete topic" width="20" height="20"/>


                                                                                   <%---------- admin loggedin edit/delte subOrNO-----------%>

                                                                                </g:if>
                                                                                <g:else>

                                                                                    <g:if test="${subbedTopics.name.contains(topicAndCountRow[1].name)}">

                                                                                         <a href="" id="${topicAndCountRow[1]?.id}" class="topicUnsubscribeClass">UnSubscribe</a>
                                                                                         <a href=""  style="display:none;" id="${topicAndCountRow[1]?.id}" class="topicSubscribeClass" >Subscribe</a>
                                                                                         <%---------------unsubscribe Noormal user-addquery---------------%>
                                                                                    </g:if>
                                                                                    <g:else>
                                                                                        <g:if test="${topicAndCountRow[1].visibility.value}">
                                                                                           <font color="gray"> private</font>
                                                                                        </g:if>
                                                                                        <g:else>
                                                                                           <a href="" style="display:none;" id="${topicAndCountRow[1]?.id}" class="topicUnsubscribeClass">UnSubscribe</a>
                                                                                          <a href="" id="${topicAndCountRow[1]?.id}" class="topicSubscribeClass" >Subscribe</a>

                                                                                        <%---------------Sub-addquery---------------%>
                                                                                        </g:else>
                                                                                    </g:else>

                                                                                </g:else>

                                                                            </g:else>
                                                                      </div>

                                                                      <div class="col-4">
                                                                          <font size="2" color="gray"> Subs: ${topicAndCountRow[1]?.subscription?.size()}</font>
                                                                         <font size="2" color="gray"> Posts: ${topicAndCountRow[1]?.resource.size()}</font>


                                                                       </div>
                                                                   </div>
                                                                   <div class="row">

                                                                         <div class="col-6">

                                                                            <g:if test="${subbedTopics.name.contains(topicAndCountRow[1].name)}">

                                                                               <g:select display="" id="${listOfSubs[listOfSubs.topics.name.indexOf(topicAndCountRow[1].name)].id}" name="selectSeriousness" from="${['Casual','Serious','Very_Serious']}" value="${listOfSubs[listOfSubs.topics.name.indexOf(topicAndCountRow[1].name)].seriousness}"
                                                                                   class="form-control changeSeriousness"/>


                                                                            </g:if>

                                                                         </div>

                                                                         <div class="col-6">
                                                                                <g:if test="${topicAndCountRow[1].user==activeUser || activeUser.admin}">
                                                                                     <g:select id="${topicAndCountRow[1]?.id}" name="selectVisib" from="${['Public','Private']}" value="${topicAndCountRow[1]?.visibility}"
                                                                                        class="form-control visibilityChange"/>


                                                                                </g:if>
                                                                         </div>
                                                                   </div>
                                                              </div>
                                                      </div><hr>
                                                 </g:each>
                                              </div></div>
                                           </g:else>
                                                     <%-----------------------------------------------%>
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
                                        <div class="card shadow p-0 bg-white rounded" style="width:100%;">
                                             <div class="card-header">
                                                          Inbox
                                              </div>
                                              <div class="card-body">
                                                    <g:if test="${userUnReadResource?.size==0}">
                                                           <font size="4" color="gray">NO NEW POSTS TO SHOW !</font>
                                                    </g:if>
                                                    <g:else>
                                                          <%------------------------%>
                                                      <div class="container" id="flow3">
                                                            <g:each in="${userUnReadResource}" var="res" status="i">
                                                                <div class="row " style="border:2px solid;border-radius: 10px;">

                                                                    <div class="col-3">
                                                                     <g:if test="${res?.user.photo!=null}">
                                                                         <img height="90" style="margin-top: 10px;margin-left: 0px,margin-bottom: 10px;margin-right: 10px"
                                                                          width="90" src="${createLink(controller: 'user', action: 'fetchPersonImage', params: ['userId':res?.user.id])}"/>
                                                                      </g:if>
                                                                      <g:else>
                                                                          <g:img dir="images" file="defaultpic.png" width="100" height="100" />
                                                                      </g:else>
                                                                    </div>
                                                                    <div class="col-9">
                                                                        <div class="row">
                                                                            <div class="col-6"><font size="3">${res?.user?.firstName} ${res?.user?.lastName}</font></div>
                                                                            <div class="col-6"><font size="3">${res?.topics?.name}</font></div>
                                                                        </div>
                                                                        <div class="row">
                                                                            <div class="col-6"><font size="2" color="gray">@${res?.user?.username} ${new Date()-res?.lastUpdated} days ago</font></div>
                                                                            <div class="col-6"></div>
                                                                        </div>
                                                                        <hr>
                                                                        <div class="row">
                                                                            <div class="col-12" id="ellps" >${res?.name}</div>
                                                                        </div><hr>
                                                                        <div class="row">
                                                                              <div class="col-3">   </div>
                                                                              <div class="col-9">
                                                                                   <g:if test="${res?.class==LinkResources}">
                                                                                           <a href="${res?.URl}"><font size="2">Go To Link</font></a>
                                                                                   </g:if>
                                                                                   <g:else>
                                                                                            <g:link controller="Demo" action="downloadFile" params="[res:res?.id]"> <font size="2">Download</font>
                                                                                                                                                           </g:link>
                                                                                    </g:else>
                                                                                     <font size="2" style="margin-left:10px;"> <g:link controller="resource" action="viewPost" params="[topicId:res?.topics?.id,userId:res?.user?.id]">
                                                                                     [Full Post] </g:link>
                                                                                     <a href="" id="${res?.id}" class="changeReadStatus" >
                                                                                          <font size="2"> &nbsp;&nbsp; Mark as read</font>
                                                                                     </a>
                                                                               </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                             </g:each>
                                                      </div>
                                                       <%-------------------------%>
                                                     </g:else>
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