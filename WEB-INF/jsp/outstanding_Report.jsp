<%@page import="java.util.*"%>
<%@page import="org.springframework.jdbc.core.JdbcTemplate"%>
<%@page import="com.billing.service.Beans"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Outstanding Report</title>
</head>
<script type="text/javascript">
	
<% 
			List<Map<String, Object>> lst = (List<Map<String, Object>>) request.getAttribute("lst");
			String count =  request.getAttribute("count").toString();
			Map<String, Object> columnHeadlst = null;
			if(Integer.parseInt(count)>0){
			columnHeadlst = lst.get(0);
			}
			System.out.println(lst);
			%>
	
</script>
<body><jsp:include page="header.jsp" />
	<div class="panel-body">
	<br><h3 align="center">Outstanding Report</h3><br>
	<%if(Integer.parseInt(count)>0){%>
		<table class="table table-striped table-bordered table-hover"
			id="diplayTable"" >
			<thead>
				<tr>
					<%
						Set<String> set = new HashSet<String>();
						set = columnHeadlst.keySet();
						List<String> str = new ArrayList<String>();
						//populate set
						for (String s : set) {
							str.add(s);
					%><th><%=s.replaceAll("_", " ")%></th>
					<%
						}
					%>
				</tr>
			</thead>
			<tbody>
				<%
					for (int i = 0; i < lst.size(); i++) {
						Map<String, Object> rowHeadlst = lst.get(i);
						List<String> orw = new ArrayList<String>();
						rowHeadlst.get(str.get(0));
				%>
				<tr>
					<%
							for (Object o : rowHeadlst.values()) {
					%><th><%=o.toString().replaceAll("_", " ")%></th>
					<%
							}
					%>
				</tr>
				<%
					}
				%>

			</tbody>
		</table><%} %>
	</div><jsp:include page="footer.jsp" />
</body>
</html>