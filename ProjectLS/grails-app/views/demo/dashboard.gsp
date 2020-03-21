<html>
<head>
<title>dashboard</title>

<g:javascript>

  function callMyAjax(){
  alert("Topic added")
  }





 </g:javascript>

</head>
<body>
<g:render template="dashboardTop" />

<g:message code="default.link.skip.label" default=""/></a>


   <g:if test="${flash.message}">
      <div class="message">${flash.message}
</div>
    </g:if>

<div class="container">
<div class="row">

    <div class="col-6">   <%--start of left side of container--%>

       <div class="row">  <%--e--%>

            <div class="card">  <%--e--%>
                 <div class="row"> &nbsp;</div>

                    <div class="row">
                        <div class="card shadow p-0 bg-white rounded">

                              <div class="card-body">
                                  <span class="col-4">
                                  <g:img dir="images" file="defaultpic.png" width="120" height="120"/>
                                  </span>
                                  <span class="col-8">uday pratap singh</span>
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



               <%-----------invite start here form-----------%>

                                        <g:form name="sendInviteForm" action="dashboard" id="4">
                                          <table class="table">

                                            <tr>
                                            <td>Email</td>
                                               <td><g:textField name="friendEmail" value="${sendtopic}" required="true"/></td>
                                             </tr>
                                               <tr>
                                                  <td>Topic</td>
                                                  <td>   <%---add list of topic here---%>
                                                    <g:select name="topic.visibility" from="${ }" value="${vis}" noSelection="['':'-Choose Topic-']" required="true"/>

                                                  </td>
                                                </tr>

                                                 <tr>

                                                   <td ><g:submitButton name="sendInviteButton" value="send"/></td>

                                                     <td> <input type="reset" value="Cancel"></td>
                                                 </tr>


                                              </table>




                                        </g:form>

                                       <%------------invites end here form-------------%>



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

               <%-----------start here form-----------%>

                                                                    <g:form name="shareLinkForm" action="dashboard" id="3">
                                                                      <table class="table">

                                                                        <tr>
                                                                        <td>Link</td>
                                                                           <td><g:textField name="LinkTopicName" value="${Ltopic}" required="true"/></td>
                                                                         </tr>

                                                                            <tr>
                                                                            <td>Description</td>
                                                                            <td><g:textArea name="myLinkField" value="Topic related Url" rows="3" cols="10"/> </td>

                                                                            </tr>

                                                                            <tr>
                                                                              <td>Topic</td>
                                                                              <td>   <%---add list of topic here---%>
                                                                                <g:select name="topic.visibility" from="${ }" value="${vis}" noSelection="['':'-Choose Topic-']" required="true"/>

                                                                              </td>
                                                                            </tr>

                                                                             <tr>

                                                                               <td ><g:submitButton name="shareLinkButton" value="share"/></td>

                                                                                 <td> <input type="reset" value="Cancel"></td>
                                                                             </tr>


                                                                          </table>




                                                                    </g:form>

                                                                   <%------------end here form-------------%>


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
                                                                                      <td>Document</td>
                                                                                         <td><input type="file" name="docfile" /></td>
                                                                                  </tr>

                                                                                  <tr>
                                                                                  <td>Description</td>
                                                                                  <td><g:textArea name="myField" value="myValue" rows="3" cols="10"/> </td>

                                                                                  </tr>

                                                                                  <tr>
                                                                                    <td>Topic</td>
                                                                                    <td>   <%---add list of topic here---%>
                                                                                      <g:select name="chosentopic" from="${ }" value="${vis}" noSelection="['':'-Choose Topic-']" required="true"/>

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
                                                                                 create topic
                                                                      </div>
                                                                      <div class="card-body" style="display: none;" >

                                                                                <g:form name="createTopicForm" action="createTopicFormAction" id="1">
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

                                                                                <td ><g:submitButton name="CreateTopicButton" value="Create" onclick="callMyAjax()"/></td>

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