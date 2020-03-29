<html>
<head>


<asset:javascript src="popper.min.js"/>
<asset:javascript src="bootstrap.min.js"/>
<asset:javascript src="jquery-3.3.1.min.js"/>
<asset:stylesheet src="bootstrap.min.css"/>


<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.10.20/datatables.min.css"/>
<script type="text/javascript" src="https://cdn.datatables.net/v/dt/dt-1.10.20/datatables.min.js"></script>




</head>

<body>

<g:render template="dashboardTop" />


<div class="container">

<g:render template="dataTableShow" />

</div>
</body>


</html>