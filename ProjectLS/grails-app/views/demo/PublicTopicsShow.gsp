<html>
<head>
<title>Public Topics</title>
</head>

<body>
<g:render template="top" />


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

                        <g:img dir="images" file="defaultpic.png" width="120" height="120"/>

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

                                   <g:if test="${u?.URl}">
                                       Resource: <a href="${u.URl}">${u.URl}</a>
                                   </g:if>
                                   <g:else>
                                        Resource: download
                                   </g:else>

                            </div> </div>



                        </div>  <%---right of pic end---%>
                    </div>
                    <hr>

                 </g:each>

               </div>    <%----div flow end------%>





            </div>


            <a href="#">link</a>
                </div>
      </div>

    </div>



</body>

</html>