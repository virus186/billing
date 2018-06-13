<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update Supplier</title>
</head>
<body><jsp:include page="header.jsp" />
	<%
	
	List<Map<String,Object>> lst = (List<Map<String,Object>>) request.getAttribute("lstResult");
	Map<String, Object> columnHeadlst = null;
	if (lst.size() > 0) {
		columnHeadlst = lst.get(0);
	}
	%>
	<%
						Set<String> key = new HashSet<String>();
						key = columnHeadlst.keySet();
						List<String> keyLst = new ArrayList<String>();
						//populate set
						for (String s : key) {
							keyLst.add(s);
						}
					%>
	<div class="container form-control">
		<div class="container-header">
		<% if(request.getAttribute("message")!=null && !request.getAttribute("message").equals("")){ %>
		<h2><%=request.getAttribute("message") %></h2>
		<%} %>
			<h3 align="center">Update Supplier</h3><br><br>
		</div>
		<div class="container">
			<form:form id="update_SUPPLIER" action="update_SUPPLIER" method="post"
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
				<input path="supplier_id" name="supplier_id" id="supplier_id" type="hidden" value=""/>
				<button type="submit" class="btn btn-primary btn-sm">
					<i class="fa fa-dot-circle-o"></i> Submit
				</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<button type="reset" class="btn btn-danger btn-sm">
					<i class="fa fa-ban"></i> Reset
				</button>
			</form:form>
	</div><jsp:include page="footer.jsp" />
</body>
<script type="text/javascript">
<%-- $( document ).ready(function() {
    <%for(int i = 0;i<lst.size();i++){
    	Map<String, Object> rowHeadlst = lst.get(i);
    	for(int j = 0 ; j<keyLst.size();j++){
    		System.out.println("key "+keyLst.get(j).toLowerCase()+"    value"+rowHeadlst.get(keyLst.get(j)));
    %>
    $('#<%=keyLst.get(j).toLowerCase()%>').val('<%=rowHeadlst.get(keyLst.get(j))%>');
    <%}
    	}%>
    	alert('hi');
}); --%>

window.onload = function() { 
// 	alert('hi');
	 <%for(int i = 0;i<lst.size();i++){
	    	Map<String, Object> rowHeadlst = lst.get(i);
	    	for(int j = 0 ; j<keyLst.size();j++){
	    		System.out.println("key "+keyLst.get(j).toLowerCase()+"    value"+rowHeadlst.get(keyLst.get(j)));
	    %>
<%-- 	    alert('<%=rowHeadlst.get(keyLst.get(j))%>'); --%>
	    document.getElementById('<%=keyLst.get(j).toLowerCase()%>').value ='<%=rowHeadlst.get(keyLst.get(j))%>';
	    <%}
	    	}%>
} 

</script>
</html>