<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Server Login</title>
<link type="text/css" rel="stylesheet" href="css/style.css" />

	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.4.4/jquery.min.js"></script>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.6/jquery-ui.min.js"></script>
    <script type="text/javascript" src="js/jquery.inputfocus-0.9.min.js"></script>
    <script type="text/javascript" src="js/jquery.main.js"></script>

</head>
<script type="text/javascript">  
	function myFunction()
		{				
		var a=document.forms["userform"]["username"].value;
		if (a==null || a=="")
		{
		alert("Username should not be empty");
		return false;
		}
		var b=document.forms["userform"]["password"].value;
		if (b==null || b=="")
		{
		alert("Password should not be empty");
		return false;
		}
		else{
			  return true;
		} 
  
	}  		
		  	
    </script>
<body>
<form name="userform" action="createuser" method="post" >
<div align="center">


<!--  Content - Start -->

<div id="content">


<div id="Login-Container">
 
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
    <td align="left" valign="top"><table width="100%" height="36" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td width="130" align="right" style="padding-right:20px;">First Name</td>
        <td><input name="fname" id="userid" type="text" /></td>
      </tr>
    </table></td>
  </tr>
  <tr>
  <tr>
    <td align="left" valign="top"><table width="100%" height="36" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td width="130" align="right" style="padding-right:20px;">Last Name</td>
        <td><input name="lname" id="userid" type="text" /></td>
      </tr>
    </table></td>
  </tr>
  <tr>
  <tr>
    <td align="left" valign="top"><table width="100%" height="36" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td width="130" align="right" style="padding-right:20px;">Username</td>
        <td><input name="username" id="userid" type="text" /></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td align="left" valign="top"><table width="100%" height="42" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td width="130" align="right" style="padding-right:20px;">Password</td>
        <td><input type="password" name="password"  id="password" /></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td align="left" valign="top"><table width="100%" height="32" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td width="130" align="right" style="padding-right:20px;">&nbsp;</td>
       <td><input type="submit" onclick="return myFunction()" class="LoginButton" value="Submit" />&nbsp;&nbsp;<input type="reset" class="ResetButton" value="Reset" /></td>
      </tr>
    </table></td>
  </tr>
</table>
 </div>
</div>
<!--  Content - End -->

</form>

</body>
</html>