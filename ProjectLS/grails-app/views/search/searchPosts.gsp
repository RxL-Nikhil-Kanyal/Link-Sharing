<html>
<head>
<title>search</title>
<style>

</style>

</head>
<body>

<g:render template="/user/dashboardTop" />
<div class="container">
<div class="row">

    <div class="col-5">   <%--start of left side of container--%>

       <div class="row">  <%--e--%>

            <div class="container">  <%--e--%>
                 <div class="row"> &nbsp;</div>

                    <div class="row">
                        <div class="card" style="width:90%;">

                            <div class="card-header">Trending Topics </div>

                              <div id="flow1" class="card-body">
                                                           <%-----------------------------------------------%>

                                <g:if test="${trendingTopicsAndCount?.size()==0}">
                                      <div class="row"><div class="col-12">No Topics . Create new Topics.</div></div>

                                </g:if>
                                   <g:else>

                                       <div class="row"><div class="col-12">

                                          <g:each in="${trendingTopicsAndCount}" var="topicAndCountRow" status="i">

                                               <div class="row">

                                                       <div class="col-4">

                                                           <g:if test="${topicAndCountRow[1].user.photo!=null}">

                                                                 <img height="90" style="margin-top: 20px;margin-left: 15px "  width="90"
                                                                 src="${createLink(controller: 'user', action: 'fetchPersonImage', params: ['userId':topicAndCountRow[1].user.id])}"/>
                                                           </g:if>
                                                           <g:else>
                                                                  <g:img dir="images" file="defaultpic.png" width="100" height="100"/>
                                                           </g:else>

                                                       </div>
                                                       <div class="col-8">
                                                           <div class="row">
                                                              <div id="nameOfTopic" class="col-7">
                                                               <g:link controller="topic" action="topicsShow" params="[topicId:topicAndCountRow[1].id]">
                                                              ${topicAndCountRow[1]?.name}</g:link></div>
                                                              <div class="col-5">

                                                               <g:link controller="user" action="userProfile" id="nameLink"  params="[otherUserId:topicAndCountRow[1]?.user?.id]">@${topicAndCountRow[1]?.user?.username}
                                                               </g:link>

                                                              </div><%--c--%>
                                                           </div><hr>

                                                            <div class="row">
                                                               <div class="col-8">
                                                                    <g:if test="${topicAndCountRow[1].visibility.value}">
                                                                           <g:if test="${subbedTopics.name.contains(topicAndCountRow[1].name)}">
                                                                                 <g:if test="${topicAndCountRow[1].user.username!=session.user}">
                                                                                 <a href="" id="${topicAndCountRow[1]?.id}" class="topicUnsubscribeClass">UnSubscribe</a>
                                                                                   <a href=""  style="display:none;" id="${topicAndCountRow[1]?.id}" class="topicSubscribeClass" >Subscribe</a>
                                                                                 </g:if>

                                                                           </g:if>
                                                                           <g:else>
                                                                                    <g:if test="${activeUser.admin}">
                                                                                    <a href="" style="display:none;" id="${topicAndCountRow[1]?.id}" class="topicUnsubscribeClass">UnSubscribe</a>
                                                                                     <a href="" id="${topicAndCountRow[1]?.id}" class="topicSubscribeClass" >Subscribe</a>

                                                                                    </g:if>
                                                                                    <g:else>
                                                                                        <font color="gray">Private</font>

                                                                                    </g:else>

                                                                            </g:else>
                                                                    </g:if>
                                                                   <g:else>
                                                                      <g:if test="${subbedTopics.name.contains(topicAndCountRow[1].name)}">
                                                                            <g:if test="${topicAndCountRow[1].user.username!=session.user}">
                                                                             <a href="" id="${topicAndCountRow[1]?.id}" class="topicUnsubscribeClass">UnSubscribe</a>
                                                                             <a href=""  style="display:none;" id="${topicAndCountRow[1]?.id}" class="topicSubscribeClass" >Subscribe</a>
                                                                            </g:if>
                                                                       </g:if>
                                                                       <g:else>
                                                                                 <a href="" style="display:none;" id="${topicAndCountRow[1]?.id}" class="topicUnsubscribeClass">UnSubscribe</a>
                                                                                  <a href="" id="${topicAndCountRow[1]?.id}" class="topicSubscribeClass" >Subscribe</a>

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
                                                                  </div>
                                                                  <div class="col-6">
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
                    </div><%--end of first row --%>

                    <div class="row"> &nbsp;</div>

                            <div class="row">
                                <div class="card"  style="width:90%;">
                                     <div class="card-header">
                                                  Top Posts
                                      </div>
                                      <div class="card-body">

                                           <%-----------------------%>
                                              <div class="container" id="flow1">
                                                 <g:if test="${!topPostsWithRating}">
                                                     <font size="3" color="red">No Rating on Posts yet.</font>
                                                 </g:if>
                                                 <g:else>
                                                    <g:each in="${topPostsWithRating}" var="u" status="i">
                                                      <div class="row">
                                                          <div class="col-4">
                                                            <g:if test="${u[1]?.topics?.user.photo!=null}">

                                                                  <img height="90" style="margin-top: 20px;margin-left: 15px "  width="90"
                                                                  src="${createLink(controller: 'user', action: 'fetchPersonImage', params: ['userId':u[1]?.topics?.user.id])}"/>
                                                            </g:if>
                                                            <g:else>
                                                                   <g:img dir="images" file="defaultpic.png" width="100" height="100"/>
                                                            </g:else>


                                                          </div>
                                                           <div class="col-8">
                                                              <div class="row">
                                                                  <div class="col-6">${u[1]?.user?.username}</div>
                                                                  <div class="col-6">
                                                                  <g:link controller="topic" action="topicsShow" params="[topicId:u[1]?.topics?.id]">
                                                                  ${u[1]?.topics?.name}</g:link></div>


                                                              </div><hr>
                                                              <div class="row">
                                                                  <div class="col">

                                                                      <div id="ellps" class="col-9">${u[1]?.name}</div>

                                                                  </div>
                                                              </div>
                                                              <div class="row">
                                                                  <div class="col-8"></div>
                                                                  <div class="col-4">

                                                                   <g:link controller="resource" action="viewPost" params="[topicId:u[1]?.topics?.id,userId:u[1]?.user?.id]">
                                                                                               <font size="2">Full Post</font>
                                                                                             </g:link>
                                                                  </div>
                                                              </div>
                                                           </div>
                                                       </div>
                                                       <hr>
                                                     </g:each>
                                                  </g:else>
                                              </div>
                                           <%-----------------------%>

                                      </div>
                                </div>
                            </div><%--end of 2 row --%>
                   </div>      <%--e--%>

       </div>      <%--e--%>
    </div>  <%--end of left side of container--%>
    <div class="col-7">            <%--start of right side of container--%>
        <div class="row"> &nbsp;
        </div>
           <div class="col">
                <div class="card" style="Border-radius:10px;">
                   <table id="searchTableId">

                     <thead ><tr><th class="card-header" style="text-align:center;size:4;"> Search Results</th></tr></thead>

                                        <%-----------------%>

                            <tbody>
                                      <g:each in="${allResource}" var="u" status="i">
                                          <tr><td>
                                             <div class="row">
                                                 <div class="col-4">
                                                 <g:if test="${u?.topics.user.photo!=null}">

                                                       <img height="90" style="margin-top: 20px;margin-left: 15px "  width="90"
                                                       src="${createLink(controller: 'user', action: 'fetchPersonImage', params: ['userId':u?.topics.user.id])}"/>
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
                                                        <div class="col-5">By:
                                                        <g:link controller="user" action="userProfile" id="nameLink"  params="[otherUserId:u?.user.id]">
                                                        ${u?.user.username}</g:link></div>
                                                     </div><hr>
                                                     <div class="row"><div class="col-12">${u?.name}</div>

                                                    </div>


                                                     <div class="row">&nbsp;</div>
                                                     <div class="row">
                                                     <div class="col-4">

                                                             <g:img dir="images" file="mailIcon.jpg" width="20" height="20" title="${u?.user.email}"/>

                                                     </div>

                                                     <div class="col-8">

                                                             <g:if test="${u?.class==LinkResources}">
                                                             <font size="2"> <a href="${u?.URl}">Link</a></font>
                                                            </g:if>
                                                            <g:else>
                                                              <font size="2"> <g:link controller="resource" action="downloadFile" params="[res:u?.id]"> Download
                                                                                                                      </g:link></font>
                                                            </g:else>
                                                            <font size="2" style="margin-left:10px;">
                                                            <g:link controller="resource" action="viewPost" params="[topicId:u?.topics?.id,userId:u?.user?.id]"> [Full Post]</g:link>

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
                                      <%------------------%>
                    </table>
                </div>
            </div>         <%--end of 1 row --%>
    </div>    <%--end of right side of container--%>
</div>

</div>
<asset:javascript src="dataTable.js"/>
</body>
</html>