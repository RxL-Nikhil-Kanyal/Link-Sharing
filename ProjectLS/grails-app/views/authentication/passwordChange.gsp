<html>
<head></head>
<body>

<g:render template="top"/>
   <g:if test="${flash.message}">
          <div id ="animateDiv" class="message" role="status" style="font-size: medium;color: white;background-color: green;font-weight: bold;">${flash.message}</div>
      </g:if>
      <g:if test="${flash.warning}">
          <div id ="animateDiv"  class="message_error" style="font-size: medium;color: white;background-color: red;font-weight: bold;">${flash.warning}</div>
      </g:if>


<div class="row">

<div class="col-4"></div>
<div class="col-4">

<div class="container">
    <div class="row" align="center">
        <h3>Change Password!</h3>

			<form class="form-horizontal" action='' method="POST">
			    <div class="row">
			    <b>Password:<b>

			    </div>
			    <div class="row">
			    <input type="password" id="changePasswordId" name="changePassword" required="true" autocomplete="new-password" class="form-control" minlength="8" maxlength="15"/></div>
			    <div class="row">
                    &nbsp;
			    </div>
			    <div class="row">Confirm Password:<b></div>
			    <div class="row">
			    <input type="hidden"  id="hiddenUserId" value="${userId}"/>

			     <input type="password" id="confirmPasswordId" name="confirmChangePassword" required="true" autocomplete="new-password" class="form-control" minlength="8" maxlength="15"/>


			    </div>
			    <div class="row">&nbsp;</div>
			    <div class="row"><Button id="changePasswordButtonId" name="changePasswordButton" class="form-control">Change</button>

			</form>
		</div>
	</div>
</div>
</div>
</div>

</body>
</html>