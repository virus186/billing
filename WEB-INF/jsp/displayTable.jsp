<%@page import="org.springframework.jdbc.core.JdbcTemplate"%>
<%@page import="java.util.*;"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<script type="text/javascript">
	
<%-- <%JdbcTemplate jdbcTemplate;

			String query = request.getParameter("query");
			System.out.println("query ----------- > " + query);

			List<Map<String, Object>> lst = jdbcTemplate.queryForList(query);

			Map<String, Object> columnHeadlst = lst.get(0);%>
	 --%>
</script>
<div>
This is display Table.  I received: <%-- ${param.query} : --%>
		<%-- <table class="table table-striped table-bordered table-hover"
			id="diplayTable">
			<thead>
				<tr>
					<%
						for (int i = 0; i < columnHeadlst.size(); i++) {
					%><th><%=columnHeadlst.keySet().toString().replaceAll("_", " ")%></th>
					<%
						System.out.println("columnHeadlst.keySet().toString() ----------- > " + columnHeadlst.keySet().toString());
						}
					%>
				</tr>
			</thead>
			<tbody>
				<%
					for (int i = 1; i < lst.size(); i++) {
				%>
				<tr>
					<%
						for (int j = 0; j < i; j++) {
					%><th><%=lst.get(i).keySet().toString()%></th>
					<%System.out.println("lst.get(i).keySet().toString() ----------- > " + lst.get(i).keySet().toString());
						}
					%>
				</tr>
				<%
					}
				%>

			</tbody>
		</table> --%>
</div>