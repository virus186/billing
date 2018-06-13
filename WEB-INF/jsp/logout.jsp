<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Logout</title>

<SCRIPT type="text/javascript">
    window.history.forward();
    function noBack() { window.history.forward(); }
</SCRIPT>

</head>
<body onload="noBack();" onpageshow="if (event.persisted) noBack();" onunload="">
<form action="logout">
<h2 align="center">${message}</h2>


<h3 ALIGN="center">Click Here To <a href="login">Login</a> Or Return To <a href="home">Home</a></h3>
</form>
</body>
</html>