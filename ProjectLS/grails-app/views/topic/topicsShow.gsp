<html>
<head>
<title>Topics Show</title>

</head>
<body>
<g:render template="/demo/dashboardTop" />

<div class="container">
<div class="row">

    <div class="col-6">   <%--start of left side of container--%>

       <div class="row">  <%--e--%>

            <div class="container">  <%--e--%>
                 <div class="row"> &nbsp;</div>

                    <div class="row">
                        <div class="card" style="width:90%;">

                            <div class="card-header">Topic: ${chosenTopic.name}</div>

                              <div class="card-body">
                                    <div class="row">
                                        <div class="col-4">
                                                <g:if test="${chosenTopic.user.photo!=null}">

                                                    <img height="90" style="margin-top: 10px;margin-left: 0px,margin-bottom: 10px;margin-right: 10px "  width="90"
                                                    src="${createLink(controller: 'user', action: 'fetchPersonImage', params: ['userId':chosenTopic.user.id])}"/>
                                                 </g:if>
                                                 <g:else>
                                                     <g:img dir="images" file="defaultpic.png" width="100" height="100"/>
                                                 </g:else>

                                        </div>
                                        <div class="col-8">
                                            <div class="row">
                                                    <div class="col-12">

                                                    ${chosenTopic.name}
                                                    <font size="2" color="gray">(${chosenTopic.visibility})</font>

                                                    </div>
                                            </div>
                                            <div class="row">
                                                    <div class="col-6">@${chosenTopic.user.username}</div>
                                                    <div class="col-6"><font size="2" color="gray">subs: ${chosenTopic.subscription.size()}
                                                     Post:${chosenTopic.resource.size()}</font></div>

                                            </div>
                                            <div class="row">
                                                <g:if test="${!subbedTopics.contains(chosenTopic)}">
                                                        <g:if test="${chosenTopic.visibility==Visibility.valueOf('Private')}"><font color="gray">Private</font></g:if>
                                                        <g:else>
                                                        <g:link controller="Subscription" action="subscribeTopic" params="[topicsId:chosenTopic.id]">Subscribe</g:link>
                                                        </g:else>

                                                </g:if>
                                                <g:else>
                                                    <g:link controller="topic" action="unsubscribeTopic" params="[topicinfo:chosenTopic.id]">UnSubscribe</g:link>
                                                </g:else>
                                            </div>
                                            <div class="row">
                                                <div class="col-6"></div>
                                                <div class="col-6">
                                                <g:if test="${subbedTopics.contains(chosenTopic)}">
                                                    <g:select id="selectSeriousnessId" name="selectSeriousness" from="${['Casual','Serious','Very_Serious']}" value="${activeUserSubs[subbedTopics.indexOf(chosenTopic)].seriousness}"
                                                   class="form-control changeSeriousclass"/>
                                                   <input type="hidden" name="hiddenVal" class="hiddenSubId" value="${activeUserSubs[subbedTopics.indexOf(chosenTopic)].id}">
                                                </g:if>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                              </div>
                        </div>
                    </div><%--end of first row --%>
                    <div class="row"> &nbsp;</div>
                            <div class="row">
                                <div class="card" style="width:90%;">

                                     <table id="usersSubbedId">
                                     <thead><tr><th>
                                     Users: ${chosenTopic.name}
                                     </th></tr></thead>
                                     <tbody>
                                        <g:each in="${allSubsOfTopic}" var="u" status="i">
                                            <tr><td>
                                                <%--------------row start here-------------%>
                                                <div class="row">
                                                     <div class="col-4">
                                                         <g:if test="${u.user.photo!=null}">
                                                             <img height="90" style="margin-top: 10px;margin-left: 0px,margin-bottom: 10px;margin-right: 10px "  width="90"
                                                              src="${createLink(controller: 'user', action: 'fetchPersonImage', params: ['userId':u.user.id])}"/>
                                                          </g:if>
                                                          <g:else>
                                                              <g:img dir="images" file="defaultpic.png" width="100" height="100"/>
                                                          </g:else>

                                                     </div>
                                                     <div class="col-8">
                                                        <div class="row">&nbsp;</div>
                                                         <div class="row">
                                                                 <div class="col-12">${u?.user.firstName}&nbsp;&nbsp;${u?.user.lastName}
                                                                 </div>

                                                         </div>

                                                         <div class="row">
                                                                 <div class="col-6">@${u?.user.username}</div>
                                                                 <div class="col-6"><font size="2" color="gray">subscriptions: ${u?.user.subscription.size()}
                                                                  </font></div>

                                                         </div>
                                                         <div class="row">
                                                                <div class="col-6"></div>
                                                                <div class="col-6"><font size="2" color="gray">Posts:${u?.user.resource.size()}</font></div>
                                                         </div>
                                                     </div>

                                                    </div>
                                                    <hr>
                                                <%--------------row end here  -------------%>
                                            </td></tr>
                                        </g:each>
                                     </tbody>
                                     </table>
                                </div>
                             </div><%--end of 2 row --%>

                   </div>      <%--e--%>

       </div>      <%--e--%>

    </div>  <%--end of left side of container--%>

    <div class="col-6">            <%--start of right side of container--%>

        <div class="row"> &nbsp;
        </div>
                   <div class="col">
                        <div class="card" style="width:100%;">
                              <div class="card-body">
                                  <table id="PostsDataTableId">
                                     <thead><tr><th class="card-header">
                                       Posts: ${chosenTopic.name}
                                     </th></tr></thead>
                                         <%----display resource start---%>
                                           <tbody>
                                             <g:each in="${allResourceOfTopic}" var="u" status="i">
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

                                                                  <font size="2" style="margin-left:10px;">
                                                                    <g:link controller="resource" action="viewPost" params="[topicId:u?.topics?.id,userId:u?.user?.id]"> [Full Post]</g:link>

                                                                   </font>

                                                        </div> </div>

                                                    </div>  <%---right of pic end---%>
                                                </div>
                                                <hr>
                                              </td></tr>
                                             </g:each>

                                                  <%----display resource end---%>
                                         </div>
                                     </tbody>
                                  </div>
                            </div>
                        </div><%--end of 2 row --%>
                                 <div class="row">
                                 </div><%--end of 3 row --%>
                                    <%---------------------------%>
                           </div>
                        </div>
                      </table>
                    </div>         <%--end of 1 row --%>
    </div>    <%--end of right side of container--%>

</div>

</div>
<script>

$("#PostsDataTableId").DataTable({
"scrollY": "500px",

});
$("#usersSubbedId").DataTable({
"scrollY": "315px",

});
</script>


</body>
</html>