<html>
<head>
<title>dashboard</title>

<g:javascript>
  function callMyAjax(){
  alert("Topic added")
    $.ajax({
      url:'${g.createLink( controller:'Demo', action:'formtest')}',
      data:{
           param1:newTopicname,
           param2:Topic.visibility
      }
    });


  }
 </g:javascript>

</head>
<body>
<g:render template="dashboardTop" />



<div class="container">
<div class="row">

    <div class="col-6">   <%--start of left side of container--%>

       <div class="row">  <%--e--%>

            <div class="card">  <%--e--%>
                 <div class="row"> &nbsp;</div>

                    <div class="row">
                        <div class="card shadow p-0 bg-white rounded">

                              <div class="card-body">
                                   <span>
                                   for pic
                                   </span>
                                   <span>
                                         <h5 class="card-title">pic + uday pratap singh</h5>
                                         <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
                                         <a href="#">link</a>
                                    </span>
                              </div>
                        </div>
                    </div><%--end of first row --%>

                    <div class="row"> &nbsp;</div>

                            <div class="row">
                                <div class="card shadow p-0 bg-white rounded">
                                     <div class="card-header">
                                                  Subscriptions
                                      </div>
                                      <div class="card-body">
                                            <h5 class="card-title">Special title treatment</h5>
                                            <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
                                             <a href="#">link</a>
                                      </div>
                                </div>
                            </div><%--end of 2 row --%>
                                     <div class="row">
                                         <div class="card shadow p-0 bg-white rounded">
                                               <div class="card-body">
                                                     <h5 class="card-title">Special title treatment</h5>
                                                     <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
                                                      <a href="#">link</a>
                                               </div>
                                         </div>
                                     </div><%--end of 3 row --%>

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

                                                           add here

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
                                                                      share link(pop up)
                                                          </div>
                                                          <div class="card-body" style="display: none;">

                                                             add here

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

                                                                          <g:form name="shareDocForm" action="dashboard" id="2">
                                                                                <table class="table">

                                                                                  <tr>
                                                                                      <td>Name</td>
                                                                                         <td><g:textField name="descTopic" value="${dtopic}" required="true"/></td>
                                                                                  </tr>

                                                                                  <tr>
                                                                                  <td>Description</td>
                                                                                  <td><g:textArea name="myField" value="myValue" rows="3" cols="10"/> </td>

                                                                                  </tr>

                                                                                  <tr>
                                                                                    <td>Topic</td>
                                                                                    <td>   <%---add list of topic here---%>
                                                                                      <g:select name="topic.visibility" from="${ }" value="${vis}" noSelection="['':'-Choose Topic-']" required="true"/>

                                                                                    </td>
                                                                                  </tr>

                                                                                   <tr>

                                                                                     <td ><g:submitButton name="update" value="share" onclick="callMyAjax()"/></td>

                                                                                       <td> <input type="reset" value="Cancel"></td>
                                                                                   </tr>


                                                                                </table>




                                                                          </g:form>

                                                                         <%------------end here form-------------%>

                                                                      </div>
                                                                </div>
                                                            </div><%--end of 3 row --%>
                         <div class="row"> &nbsp;</div>

                                                            <div class="row">
                                                                <div class="card shadow p-0 bg-white rounded" id="createtopic">
                                                                     <div class="card-header" style="display: none;" >
                                                                                 create topic(pop up)
                                                                      </div>
                                                                      <div class="card-body" style="display: none;" >

                                                                                <g:form name="createTopicForm" action="dashboard" id="1">
                                                                                <table class="table">

                                                                                <tr>
                                                                                <td>Name</td>
                                                                                <td><g:textField name="newTopicname" value="${mytopic}" required="true"/></td>
                                                                                </tr>

                                                                                <tr>
                                                                                <td>Visibility</td>
                                                                                <td>
                                                                                <g:select name="topic.visibility" from="${['Public','Private']}" value="${vis}"
                                                                                          noSelection="['':'-Choose Visibility-']" required="true"/>

                                                                                </td>
                                                                                </tr>

                                                                                <tr>

                                                                                <td ><g:submitButton name="update" value="Create" onclick="callMyAjax()"/></td>

                                                                                <td> <input type="reset" value="Cancel"></td>
                                                                                </tr>


                                                                                </table>




                                                                                </g:form>




                                                                      </div>
                                                                </div>
                                                            </div><%--end of 4 row --%>


    </div>    <%--end of right side of container--%>

</div>

</div>


</body>
</html>