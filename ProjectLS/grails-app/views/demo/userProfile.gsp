<html>
<head>
<title>dashboard</title>



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
                                  <img src="${createLink(controller: 'Demo', action: 'fetchProductImage', params: ['productName': 'Some_product_name'])}"/>
                                  </span>
                                  <span class="col-8" id="displayName"> ${activeUser.firstName} ${activeUser.lastName}</span>
                              </div>
                        </div>
                    </div><%--end of first row --%>

                    <div class="row"> &nbsp;</div>

                            <div class="row">
                                <div class="card shadow p-0 bg-white rounded">
                                     <div class="card-header">
                                                 Topics
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
                                                           Subscriptions
                                               </div>
                                               <div class="card-body">
                                                     <h5 class="card-title">Special title treatment</h5>
                                                     <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
                                                      <a href="#">link</a>
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
                <div class="card shadow p-0 bg-white rounded">
                     <div class="card-header">
                                Posts
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

    </div>    <%--end of right side of container--%>

</div>

</div>


</body>
</html>