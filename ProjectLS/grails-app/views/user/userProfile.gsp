<html>
<head>
<title>dashboard</title>
</head>
<body>
<g:render template="/user/dashboardTop" />
<asset:javascript src="userProfile.js"/>
<div class="container">
<div class="row">
    <div class="col-6">   <%--start of left side of container--%>
       <div class="row">
            <div class="container">
                 <div class="row"> &nbsp;</div>
                    <div class="row">
                        <div class="card shadow p-0 bg-white rounded ">
                              <div class="card-body">
                                  <span class="col-4">
                                  <div class="row">

                                        <div class="col-5">
                                            <g:if test="${ou.photo!=null}">

                                                <img height="90" style="margin-top: 10px;margin-left: 0px,margin-bottom: 10px;margin-right: 10px "
                                                  width="90" src="${createLink(controller: 'user', action: 'fetchPersonImage', params: ['userId':ou.id])}"/>
                                             </g:if>
                                             <g:else>
                                                 <g:img dir="images" file="defaultpic.png" width="100" height="100"/>
                                             </g:else>
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
                                <div class="card shadow p-0 bg-white rounded" style="width:90%;">
                                      <div class="card-body">
                                        <table id="topicTableId"><thead><tr><th class="card-header">Topic</th></tr></thead>
                                          <div class="container">
                                            <tbody>
                                              <g:each in="${subsOfTopicByOUser}" var="u" status="i">
                                                <tr><td>
                                                 <div class="row">

                                                         <div class="col-4">

                                                         <g:if test="${u.topics.user.photo!=null}">

                                                            <img height="90" style="margin-top: 10px;margin-left: 0px,margin-bottom: 10px;margin-right: 10px "
                                                              width="90" src="${createLink(controller: 'user', action: 'fetchPersonImage', params: ['userId':u?.topics?.user.id])}"/>
                                                         </g:if>
                                                         <g:else>
                                                             <g:img dir="images" file="defaultpic.png" width="100" height="100"/>
                                                         </g:else>

                                                         </div>
                                                         <div class="col-8">
                                                             <div class="row">
                                                                <div id="nameOfTopic" class="col-7">${u?.topics?.name}</div>
                                                                <div class="col-5">

                                                                 <g:link controller="user" action="userProfile" id="nameLink"  params="[otherUserId:u?.user?.id]">@${u?.topics?.user?.username}
                                                                 </g:link>

                                                                </div><%--c--%>
                                                             </div><hr>

                                                              <div class="row">
                                                                 <div class="col-8">

                                                                     <g:if test="${!(u?.user?.username.contains(session.user)) }">
                                                                          <g:link controller="Subscription" action="subscribeTopic" params="[topicId:u?.topics?.id]">Subscribe</g:link>
                                                                     </g:if>
                                                                     <g:else>
                                                                             <div class="row">
                                                                                     <div class="col-8">
                                                                                      <g:select id="${u.id}" name="selectSeriousness" from="${['Casual','Serious','Very_Serious']}" value="${u?.seriousness}"
                                                                                        class="form-control changeSeriousness"/>

                                                                                     </div>
                                                                                     <div class="col-4"><g:link params=" "><%-----empty-----%></g:link></div>
                                                                             </div>

                                                                     </g:else>
                                                                 </div>
                                                                 <div class="col-3">
                                                                         <div class="row"><font size="2" color="gray">Subs:${u?.topics?.subscription?.size()}</font></div>
                                                                         <div class="row"><font size="2" color="gray">Post:${u?.topics?.resource?.size()}</font></div>
                                                                  </div>
                                                              </div>
                                                              <div class="row">
                                                                    <div class="col-6">
                                                                    </div>
                                                                    <div class="col-6">
                                                                    </div>
                                                              </div>
                                                         </div>
                                                 </div>
                                                 <hr>
                                                </td></tr>

                                              </g:each>

                                            </tbody>

                                          </div></table>
                                      </div>
                                </div>
                            </div><%--end of 2 row --%>


                     <div class="row"> &nbsp;</div>

                         <div class="row">
                             <div class="card shadow p-0 bg-white rounded" style="width:90%;">

                                   <div class="card-body">
                                      <div class="container"><%---corrections from here---%>
                                            <table id="subscriptionTableUSerProfileId">
                                                <thead><tr><th class="card-header">Subscriptions</th></tr></thead>
                                                <tbody>

                                                     <g:each in="${ouSubs}" var="u" status="i">
                                                        <tr><td>

                                                        <div class="row" id="${u.id}">

                                                                <div class="col-3">

                                                                 <g:if test="${u?.topics?.user.photo!=null}">

                                                                    <img height="90" style="margin-top: 10px;margin-left: 0px,margin-bottom: 10px;margin-right: 10px "
                                                                      width="90" src="${createLink(controller: 'user', action: 'fetchPersonImage', params: ['userId':u?.topics?.user.id])}"/>
                                                                 </g:if>
                                                                 <g:else>
                                                                     <g:img dir="images" file="defaultpic.png" width="100" height="100"/>
                                                                 </g:else>

                                                                </div>
                                                                <div class="col-9">
                                                                    <div class="row">
                                                                       <div id="nameOfTopic" class="col-7">${u?.topics?.name}</div>
                                                                       <div class="col-5">

                                                                        <g:link controller="user" action="userProfile" id="nameLink"  params="[otherUserId:u?.topics?.user?.id]">@${u?.topics?.user?.username}
                                                                        </g:link>

                                                                       </div>
                                                                    </div><hr>

                                                                     <div class="row">
                                                                        <div class="col-8">

                                                                            <g:if test="${!u?.topics?.subscription.user.username.contains(session.user) }">
                                                                                 <g:link controller="subscription" action="subscribeAction" params="[inviteTopicId:u?.topics?.id]">Subscribe</g:link>
                                                                            </g:if>
                                                                            <g:else>
                                                                                <g:if test="${u?.topics.user.username!=session.user}">
                                                                                    <a href="" id="${u?.topics.id}" class="topicUnsubscribeClassUserProfile" >Unsubscribe</a>
                                                                                </g:if>

                                                                                   <g:img dir="images" file="msg.jpg" style="background-color: white;border-radius: 5px;"  width="20" height="20" data-toggle="modal" data-target="#myModalinvite" />
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
                                                        </td></tr>
                                                      </g:each>
                                                </tbody>
                                            </table>

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
            <div class="card" style="width:100%; border-radius: 10px;border: 3px solid outset;">
            <table id="postsDataTable" class="table  table-bordered table-hover "  style="width:100% ;border-radius: 20px;">
                <div class="card" >
                         <thead>
                            <tr><th style="text-align:center;" class="card-header"><font size="5">Posts</font></th></tr>
                        </thead>
                    <tbody >
                             <%----display resource start---%>
                                         <g:each in="${DisplayRes}" var="u" status="i">
                                            <tr><td>
                                            <div class="row">
                                                <div class="col-4">
                                                     <g:if test="${u?.user.photo!=null}">
                                                        <img height="90" style="margin-top: 10px;margin-left: 0px,margin-bottom: 10px;margin-right: 10px "  width="90"
                                                         src="${createLink(controller: 'user', action: 'fetchPersonImage', params: ['userId':u?.user.id])}"/>
                                                     </g:if>
                                                     <g:else>
                                                         <g:img dir="images" file="defaultpic.png" width="100" height="100"/>
                                                     </g:else>
                                                </div>
                                                <div class="col-8"><%---right of pic---%>

                                                   <div class="row">
                                                       <div class="col-7">Topic:
                                                        <g:link controller="topic" action="topicsShow" params="[topicId:u?.topics.id]">
                                                        ${u?.topics.name}</g:link></div>
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

                                                             <font size="2" style="margin-left:10px;"> <g:link controller="resource" action="viewPost" params="[topicId:u?.topics?.id,userId:u?.user?.id]"> [Full Post]</g:link>

                                                               </font>

                                                    </div> </div>

                                                </div>  <%---right of pic end---%>
                                            </div>
                                            <hr>
                                            </td></tr>
                                         </g:each>
                                         <%----div flow end------%>
                              <%----display resource end---%>
                    </tbody>
                 </div>

            </table>
            </div>
        </div><%--end of 2 row --%>

         <div class="row">
         </div><%--end of 3 row --%>

    </div>    <%--end of right side of container--%>

</div>

</div>

<asset:javascript src="dataTable.js"/>

</body>
</html>