<html>
<head>


<asset:stylesheet src="bootstrap.min.css"/>
<asset:javascript src="popper.min.js"/>
<asset:javascript src="jquery-3.3.1.min.js"/>
<asset:javascript src="bootstrap.min.js"/>

<asset:stylesheet src="navbarCommonStyling"/>
<asset:javascript src="navbarCommonScripts.js"/>

<asset:javascript src="AuthenticationTop.js"/>

</head>
<body id="grad" >


<nav class="navbar navbar-expand-lg navbar-dark bg-dark " style="height: 100px;">

<div class="container">
    <div class="col-7">

  <a class="navbar-brand" href="/authentication/auth"><h4>LINK SHARING</h4></a>


    </div>

     <div class="col-5">

    <g:form controller="authentication" action="PublicTopicsShow" class="form-inline my-2 my-lg-0">

      <input id="inputSearchAuth" name="searchAtAuth" class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search"/>

      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
    </g:form>
     </div>

   </div>

  </div>
</nav>



</body>
</html>