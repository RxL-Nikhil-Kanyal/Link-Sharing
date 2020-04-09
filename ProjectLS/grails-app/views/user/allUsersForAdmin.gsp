<html>
<head>
<asset:javascript src="popper.min.js"/>
<asset:javascript src="bootstrap.min.js"/>
<asset:javascript src="jquery-3.3.1.min.js"/>
<asset:stylesheet src="bootstrap.min.css"/>

</head>
<body>


<g:render template="/user/dashboardTop" />
<asset:javascript src="allUsersForAdmin.js"/>
<div class="container">

<g:render template="dataTableShow" />

</div>
</body>


</html>