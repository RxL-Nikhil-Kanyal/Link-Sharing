<html>
<head></head>
<body>


<g:render template="top"/>

<div class="row">

<div class="col-4"></div>
<div class="col-4">

<div class="container">
    <div class="row" align="center">
        <h3>Change Password!</h3>

			<g:form class="form-horizontal"  method="POST">
			    <div class="row">
			    <b>Password:<b>

			    </div>
			    <div class="row">
			    <input type="password" id="changePasswordId" name="changePassword" required="true" autocomplete="new-password" class="form-control" minlength="8" maxlength="12"/></div>
			    <div class="row">
                    &nbsp;
			    </div>
			    <div class="row">Confirm Password:<b></div>
			    <div class="row">
			    <input type="hidden"  id="hiddenUser" name="hiddenUserId" value="${userId}"/>

			     <input type="password" id="confirmPasswordId" name="confirmChangePassword" required="true" autocomplete="new-password" class="form-control" minlength="8" maxlength="12"/>


			    </div>
			    <div class="row">&nbsp;</div>
			    <div class="row"><Button id="changePasswordButtonId" name="changePasswordButton" class="form-control">Change</button>

			</g:form>
		</div>
	</div>
</div>
</div>
</div>

</body>
</html>