<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add New Supplier</title>
</head>
<body>
	<jsp:include page="header.jsp" />
	<div class="container form-control">
		<div class="container-header">
		<% if(request.getAttribute("message")!=null && !request.getAttribute("message").equals("")){ %>
		<h2><%=request.getAttribute("message") %></h2>
		<%} %>
			<h3 align="center">Add New Supplier</h3><br><br>
		</div>
		<div class="container">
			<form:form id="add_SUPPLIER" action="add_SUPPLIER" method="post"
				class="form-inline">
				<div class="form-group">
					<label for="supplier_name" class="pr-1  form-control-label"><b>Supplier
						Name</b></label><input type="text" id="supplier_name" name="supplier_name"
						placeholder="SUPPLIER NAME" required=""
						class="form-control required">
				</div>
				<div class="form-group">
					<label for="supplier_address" class="px-1  form-control-label"><b>Supplier
						Address</b></label><input type="text" id="supplier_address" name="supplier_address"
						placeholder="Supplier Address" required=""
						class="form-control required">
				</div>&nbsp;&nbsp;&nbsp;
				<button type="submit" class="btn btn-primary btn-sm">
					<i class="fa fa-dot-circle-o"></i> Submit
				</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<button type="reset" class="btn btn-danger btn-sm">
					<i class="fa fa-ban"></i> Reset
				</button>
			</form:form>
	</div><jsp:include page="footer.jsp" />
</body>
</html>