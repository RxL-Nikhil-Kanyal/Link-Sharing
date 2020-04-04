<html>
<head>
<asset:stylesheet src="DataTable.css"/>
<script type="text/javascript" src="https://cdn.datatables.net/v/dt/dt-1.10.20/datatables.min.js"></script>
</head>

<body>

<div class="container mb-3 mt-3">

    <table class="table  table-bordered table-hover "  style="width:100% ;border-radius: 20px;  " id="mydatatable">

        <thead>
            <tr>

           <th><B>S.no</th>
              <th><B>ID</th>
             <th> <B>FIRST NAME</th>
             <th> <B>LAST NAME</th>
             <th><B>USERNAME</th>
             <th><B>EMAIL</th>
             <th><B>ACTIVE STATUS</th>
             <th><B>ACTIVATE/DEACTIVATE</th>



                </tr>

        </thead>

        <tbody>
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

        </tbody>
    </table>


</div>



<script>

$("#mydatatable").DataTable( );

</script>

</body>


</html>