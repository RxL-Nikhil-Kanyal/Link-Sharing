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
                      <table class="table table-bordered table-success table-hover">
                      <tr>
                      <thead class="thead-dark">
                      <th><h4> <B>S.no</h4></th>
                      <th><h4><B>ID</h4></th>
                      <th><h4> <B>FIRST NAME</h4> </th>
                      <th> <h4> <B>LAST NAME</h4> </th>
                      <th><h4><B>USERNAME</h4></th>
                      <th> <h4> <B>EMAIL</h4> </th>
                      </thead>
                      </tr>
                             <g:each in="${usr}" var="u" status="i">
                                    <tr>
                                    <td> <h5>${i+1}.</h5></td>
                                    <td> <h5>${u.id}</h5></td>
                                    <td> <h5>${u.firstName}</h5></td>
                                    <td> <h5>${u.firstName}</h5></td>
                                    <td> <h5>${u.username}.</h5></td>
                                    <td> <h5>${u.email}</h5></td>
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