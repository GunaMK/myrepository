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
		var a=document.forms["myForm"]["username"].value;
		if (a==null || a=="")
		{
		alert("Username should not be empty");
		return false;
		}
		var b=document.forms["myForm"]["password"].value;
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
<form name="form" action="createuser" method="get">
<div align="center">
<!--  Header - Start -->
<div id="header">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td style="padding:10px 0px 0px 10px;"><img src="images/corent-logo.png" alt="Corent Technology" hspace="10" vspace="0" align="texttop"></td>
    <td width="7%" style="padding:10px 40px 0px 0px;"><input type="submit" class="LoginButton" value="Create user" /></td>
  </tr>
</table>
</form>
<div >		</div>

</div>
<!--  Header - End -->


<!--  Content - Start -->
<form action="login" name="myForm" method="POST">
<div id="content">


<div id="Login-Container">
 
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
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
       <td><input type="submit" onclick="return myFunction()" class="LoginButton" value="Login" />&nbsp;&nbsp;<input type="reset" class="ResetButton" value="Reset" /></td>
      </tr>
    </table></td>
  </tr>
</table>
 </div>



</div>
<!--  Content - End -->



<!--  footer - Start -->
<div id="footer">
&copy; 2013 Corent Technology Inc. All rights reserved
</div>
<!--  footer - End -->



</div>


<script type="text/javascript">
$("#add_err").html(" ");
$(document).ready(function(){
	
   $("#form_login").submit(function(){
    
        username=$("#username").val();
        password=$("#password").val();
       //alert(username+password);
         $.ajax({
            type: "POST",
            url: "login.php",
            data: "name="+username+"&pwd="+password,
            success: function(html){
              if(html=='true')
              {
                $("#container").fadeOut("normal");
                   window.location="home.php";						
              }
              else
              {
                    $("#add_err").html("<span style='color:red;font-size:15px'>Wrong username or password</span>");
              }
            },
            beforeSend:function()
			{
                 $("#add_err").html("<span style='font-size:15px'>Loading...</span>")
            }
        });
         return false;
    });
});
</script>
</form>

</body>
</html>