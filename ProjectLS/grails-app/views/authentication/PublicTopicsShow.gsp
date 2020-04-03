<html>
<head>
<title>Public Topics</title>
</head>

<body>
<g:render template="/authentication/top" />


      <div class="card shadow p-0 bg-white rounded">
        <div class="card-header">
          Recent Shares
        </div>
        <div class="card-body">
            <div class="container">

              <div id="flow">

                 <g:each in="${recentUpdatedTopics}" var="u" status="i">

                    <div class="row">
                        <div class="col-4">

                        <g:if test="${u?.user?.photo!=null}">

                             <img height="90" style="margin-top: 10px;margin-left: 0px,margin-bottom: 10px;margin-right: 10px"  width="90" src="${createLink(controller: 'authentication', action: 'userImage', params: ['userId':u?.user?.id])}"/>
                         </g:if>
                         <g:else>
                              <g:img dir="images" file="defaultpic.png" width="100" height="100" />
                         </g:else>

                        </div>
                        <div class="col-8"><%---right of pic---%>

                           <div class="row">
                               <div class="col-7">${u?.user.username}</div>
                               <div class="col-5">${u?.topics.name}</div>
                            </div><hr>
                            <div class="row"><div id="ellps" class="col-9">${u?.name}</div>

                            <div class="col-3">

                           <g:link action="publicPostsDisplayAction" params="[topicRelated:u]">
                                 <%--empty--%>
                           </g:link>

                           </div></div>


                            <div class="row">&nbsp;</div>
                            <div class="row"><div class="col-8">${u?.user.email}</div>
                            <div class="col-4">


                                    <g:if test="${u?.class==LinkResources}">
                                       Resource: <a href="${u?.URl}">Go To Link</a>
                                   </g:if>
                                   <g:else>
                                        Resource:   <g:link controller="Demo" action="downloadFile" params="[res:u?.id]"> Download
                                                     </g:link>
                                   </g:else>

                            </div> </div>



                        </div>  <%---right of pic end---%>
                    </div>
                    <hr>

                 </g:each>

               </div>    <%----div flow end------%>





            </div>



      </div>

    </div>



</body>

</html>