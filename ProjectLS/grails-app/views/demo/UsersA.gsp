<html>
<head>
<title>dashboard</title>
<style>

<asset:stylesheet href="application.css"/>
<asset:stylesheet href="bootstrap.css"/>

</style>


</head>
<body>
<g:render template="dashboardTop" />


 <g:if test="${flash.message}">
        <div id="animateDiv" class="message" role="status" style="font-size: medium;color: white;background-color: green;font-weight: bold;">${flash.message}</div>
    </g:if>
    <g:if test="${flash.warning}">
        <div id="animateDiv" class="message_error" style="font-size: medium;color: white;background-color: red;font-weight: bold;">${flash.warning}</div>
    </g:if>






<div class="container">
<div class="row">



       <div class="row">&nbsp;</div>

            <div class="card">  <%--e--%>
                 <div class="row"> &nbsp;</div>

              <div class="row">
                <div class="card" align="center">
                     <div class="card-header">
                                <B> <h4> ALL USERS</h4>

                      </div>
                      <div class="card-body">
                      <table class="table table-bordered table-success table-hover" >
                      <tr>
                      <thead class="thead-dark">
                      <th><h4> <B>S.no</h4></th>
                      <th><h4><B>ID</h4></th>
                      <th><h4> <B>FIRST NAME</h4> </th>
                      <th> <h4> <B>LAST NAME</h4> </th>
                      <th><h4><B>USERNAME</h4></th>
                      <th> <h4> <B>EMAIL</h4> </th>
                      <th> <h4> <B>ACTIVE STATUS</h4> </th>
                      <th> <h4> <B>ACTIVATE/DEACTIVATE</h4> </th>
                      </thead>
                      </tr>
                             <g:each in="${usr}" var="u" status="i">

                                    <tr>
                                    <td> <h5 id="idtable">${i+1}.</h5></td>
                                    <td> <h5 id="idtable">${u.id}</h5></td>
                                    <td> <h5 id="idtable">${u.firstName}</h5></td>
                                    <td> <h5 id="idtable">${u.firstName}</h5></td>
                                    <td> <h5 id="idtable">${u.username}.</h5></td>
                                    <td> <h5 id="idtable">${u.email}</h5></td>
                                    <td> <h5 id="idtable">${u.active}</h5></td>
                                    <td> <h5 id="idtable"><g:link action="changeUserActiveStatus" params="[val:u.id]">CLICK TO CHANGE STATUS</g:link></h5></td>
                                    </tr>



                             </g:each>

                      </div>
                </div>
               </div>







             </div>      <%--e--%>





        </div>

</div>


</body>
</html>