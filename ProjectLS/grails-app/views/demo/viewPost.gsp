<html>
<head>
<title>View Post</title>


</head>
<body>
<g:render template="dashboardTop" />
<asset:javascript src="jquery.star-rating-svg.js"/>
<asset:stylesheet src="star-rating-svg.css"/>

<div class="container">
<div class="row">
    <div class="col-7">   <%--start of left side of container--%>
       <div class="row">  <%--e--%>
            <div class="container">  <%--e--%>
                    <div class="row"> &nbsp;</div>
                       <div class="row">
                            <div class="card shadow p-0 bg-white rounded" style="width:100%;">
                                 <div class="card-header">
                                   <g:if test="${!selectedResoftopic}">
                                               <font size="3" color="red">Resource Does not Exist! Try Other Resources</font>
                                   </g:if>
                                   <g:else>
                                    <div class="row">
                                        <div class="col-2">
                                             <g:if test="${selectedResoftopic?.user.photo!=null}">

                                                 <img height="90" style="margin-top: 10px;margin-left: 0px,margin-bottom: 10px;margin-right: 10px "  width="90"
                                                 src="${createLink(controller: 'demo', action: 'fetchPersonImage', params: ['userId':selectedResoftopic?.user?.id])}"/>
                                              </g:if>
                                              <g:else>
                                                  <g:img dir="images" file="defaultpic.png" width="100" height="100"/>
                                              </g:else>
                                        </div>
                                        <div class="col-10">
                                            <div class="row">&nbsp;</div>
                                            <div class="row">
                                                <div class="col-7">

                                                      <g:link action="userProfile" id="nameLink" params="[otherUserId:selectedResoftopic?.user?.id]">
                                                      <font size="3" color="black">${selectedResoftopic?.user?.firstName} ${selectedResoftopic?.user?.lastName}</font>
                                                      </g:link>

                                                </div>
                                                <div class="col-5">

                                                        <g:link controller="Topic" action="search" id="" params="[search:selectedResoftopic?.topics?.name]">
                                                        <font size="3" color="black" align="right">${selectedResoftopic?.topics?.name}</font>
                                                        </g:link>


                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-7">
                                                   <g:link action="userProfile" id="nameLink" params="[otherUserId:selectedResoftopic?.user?.id]">
                                                      <font size="3" color="gray">&nbsp;&nbsp;@${selectedResoftopic?.user?.username}</font>
                                                   </g:link>

                                                 </div>
                                                <div class="col-5">
                                                    <font size="3" color="gray">
                                                        <g:formatDate date="${selectedResoftopic?.dateCreated}" type="datetime" style="LONG" timeStyle="SHORT"/>

                                                     </font>
                                                </div>
                                            </div>
                                            <div class="row">
                                            <div class="col-7"></div>
                                            <div class="col-5"><div class="my-rating"></div> <input id="hiddenResourceId" value="${selectedResoftopic?.id}" type="hidden"/>
                                            <g:if test="${scoreAndCount}">


                                            <font size="2" color="gray">(${scoreAndCount[0][1]})</font>
                                            <font size="2" color="gray">${Math.round((scoreAndCount[0][0]/scoreAndCount[0][1]) * 100) / 100}</font>
                                            </g:if>
                                            <input id="rate" type="hidden" value="${userPastRating[0]}"/>

                                            </div>

                                             <%-----------rating-------------%>


                                            </div>
                                        </div>
                                     </div>
                                    </g:else>
                                  </div>

                                  <div class="card-body">

                                       <g:if test="${!selectedResoftopic}">
                                         <font size="3" color="red">Resource Does not Exist! Try Other Resources</font>
                                       </g:if>
                                    <g:else>
                                     <%-----------------------%>

                                         <div class="row">
                                            <div class="col-12">
                                              <font style="padding:10px;" >
                                                    ${selectedResoftopic?.name}
                                              </font>
                                            </div>

                                         </div>
                                        <div class="row">&nbsp;</div>
                                         <div class="row">
                                                <div class="col-5">

                                                 <g:img dir="images" file="mailIcon.jpg" width="20" height="20" title="${selectedResoftopic?.user?.email}"/>

                                                </div>
                                                <div class="col-7">
                                                     <div class="row">
                                                        <g:if test="${(selectedResoftopic?.user?.username == session.user) || activeUser.admin}">
                                                             <div class="col">
                                                                   <font size="3">
                                                                   <a href class="deleteOwnResource" id="${selectedResoftopic?.id}">Delete</a></font>

                                                             </div>

                                                            <div class="col">
                                                              <font size="3">

                                                                  <a href class=" " data-toggle="modal" data-target="#EditResourceModal">
                                                                    Edit
                                                                  </a>
                                                              </font>
                                                                  <%----------------modal------------%>


                                                                    <!-- Modal -->
                                                                    <div class="modal fade" id="EditResourceModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                                                                      <div class="modal-dialog modal-dialog-centered" role="document">
                                                                        <div class="modal-content">
                                                                          <div class="modal-header">
                                                                            <h5 class="modal-title" id="exampleModalLongTitle">Edit Post</h5>
                                                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                              <span aria-hidden="true">&times;</span>
                                                                            </button>
                                                                          </div>
                                                                            <form class="form-group" id="editResourceFormId">

                                                                              <div class="modal-body" style="border:1px outset;">

                                                                                <div class="row">
                                                                                    <input type="text" id="topicNameEdit" value="${selectedResoftopic?.topics?.name}" name="topicName" disabled class="form-control">

                                                                                </div>
                                                                                <div class="row">&nbsp;</div>

                                                                                <div class="row">


                                                                                        <label id class="form-control">Description</label>


                                                                                          <input id="hiddenResourceId" value="${selectedResoftopic?.id}" type="hidden"/>
                                                                                         <textarea maxlength="4000" id="editResDesc" rows="5" cols="50" class="form-control" required="true"></textarea>
                                                                                 </div>
                                                                              </div>
                                                                                  <div class="modal-footer">
                                                                                    <button type="button" class="btn btn-secondary " data-dismiss="modal">Close</button>
                                                                                    <Input type="submit" value="Save changes" id="editSaveButtonId" class="btn btn-primary "/>
                                                                                  </div>
                                                                            </form>

                                                                                </div>
                                                                              </div>
                                                                            </div>

                                                                  <%---------------modal--------------%>


                                                             </div>
                                                         </g:if>


                                                        <div class="col">
                                                            <g:if test="${selectedResoftopic?.class==LinkResources}">
                                                                  <font size="3">
                                                                    <a href="${selectedResoftopic?.URl}">Go to Link</a>
                                                                  </font>
                                                            </g:if>
                                                            <g:else>
                                                                   <font size="3">
                                                                      <g:link controller="resource" action="downloadFile" params="[res:selectedResoftopic?.id]"> Download
                                                                                                                         </g:link>
                                                                   </font>
                                                             </g:else>

                                                        </div>

                                                      </div>

                                                </div>

                                         </div>

                                        <%-----------------------%>
                                      </g:else>
                                  </div>
                            </div>
                        </div><%--end of 2 row --%>


                     <div class="row"> &nbsp;</div>
                        <%-----------------new container here---------------%>
                   </div>      <%--e--%>

       </div>      <%--e--%>

    </div>  <%--end of left side of container--%>

    <div class="col-5">            <%--start of right side of container--%>

                        <div class="row"> &nbsp;
                        </div>

   <div class="row">
                <div class="card shadow p-0 bg-white rounded" style="width:100%;margin-left: 50px;">
                     <div class="card-header">
                                Trending Topics
                      </div>
                      <div class="card-body" id="flow1">
                         <%-----------------------------------------------%>

                           <g:if test="${trendingTopicsAndCount.size()==0}">
                                 <div class="row"><div class="col-12">No Topics . Create new Topics.</div></div>

                           </g:if>
                              <g:else>

                                  <div class="row"><div class="col-12">

                                     <g:each in="${trendingTopicsAndCount}" var="topicAndCountRow" status="i">

                                          <div class="row">

                                                  <div class="col-3">

                                                     <g:if test="${topicAndCountRow[1]?.user.photo!=null}">

                                                         <img height="90" style="margin-top: 10px;margin-left: 0px,margin-bottom: 10px;margin-right: 10px "  width="90"
                                                         src="${createLink(controller: 'demo', action: 'fetchPersonImage', params: ['userId':topicAndCountRow[1]?.user?.id])}"/>
                                                      </g:if>
                                                      <g:else>
                                                          <g:img dir="images" file="defaultpic.png" width="100" height="100"/>
                                                      </g:else>

                                                  </div>
                                                  <div class="col-9">
                                                      <div class="row">
                                                         <div id="nameOfTopic" class="col-7">${topicAndCountRow[1]?.name}</div>
                                                         <div class="col-5">

                                                          <g:link action="userProfile" id="nameLink"  params="[otherUserId:topicAndCountRow[1]?.user?.id]">@${topicAndCountRow[1]?.user?.username}
                                                          </g:link>

                                                         </div><%--c--%>
                                                      </div><hr>

                                                       <div class="row">
                                                          <div class="col-8">
                                                               <g:if test="${topicAndCountRow[1].visibility.value}">
                                                                      <g:if test="${subbedTopics.name.contains(topicAndCountRow[1].name)}">
                                                                         <g:link action="unsubscribeAction" params="[topicinfo:topicAndCountRow[1]?.id]">UnSubscribe</g:link>
                                                                       </g:if>
                                                                         <g:else>
                                                                          <font color="gray">Private</font>
                                                                         </g:else>
                                                               </g:if>
                                                              <g:else>
                                                                 <g:if test="${subbedTopics.name.contains(topicAndCountRow[1].name)}">
                                                                       <g:link action="unsubscribeAction" params="[topicinfo:topicAndCountRow[1]?.id]">UnSubscribe</g:link>
                                                                  </g:if>
                                                                  <g:else>
                                                                        <g:link controller="Subscription" action="subscribeTopic" params="[topicId:topicAndCountRow[1]?.id]">Subscribe</g:link>
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
            </div><%--end of 2 row --%>
                     <div class="row">

                     </div><%--end of 3 row --%>

    </div>    <%--end of right side of container--%>


</div>

</div>
<asset:javascript src="myStarRatingQuery.js"/>

</body>
</html>