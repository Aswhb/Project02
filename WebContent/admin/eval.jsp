<%@page import="db.DbConfig"%>
<%@page import="java.util.Map"%>
<jsp:include flush="true" page="header.jsp" />
<div class="card shadow" style="min-height: 88vh;">
	<div class="card-body">
		<h5 class="p-2" style="border-bottom: 2px solid blue;">Lecturer
			Evaluation</h5>
		<div class="container-fluid">
		<div class="row">
			<div class="col-sm-8">
			<table class="table table-bordered table-sm">
				<thead class="table-white">
					<tr>
						<th>Rollno</th>
						<th>Teacher ID</th>
						<th>Teacher Name</th>
						<th>Evaluation</th>
					</tr>
				</thead>
				<tbody>
					<%
						for (Map<String, String> map : DbConfig.allRecords("evaluation order by lid")) {
					%>
					<tr>
						<td><%=map.get("rollno")%></td>
						<td><%=map.get("lid")%></td>
						<td>
							<%
								Map<String, String> cls = DbConfig.findSingle("lecturer", "lid='" + map.get("lid") + "'");
							%><%=cls.get("lname")%>
						</td>
						<td>
							<%
						for(int i=1;i<=5;i++) { 
						if(i<=Integer.parseInt(map.get("eval"))){
						%> <span class="fa fa-star text-warning"></span> 
						<% } else { %> 
						<span
							class="fa fa-star"></span> <% }
						}%>
						</td>
					</tr>
					<%
						}
					%>
				</tbody>
			</table>
			</div>
		</div>
			
		</div>
	</div>
</div>
<jsp:include flush="true" page="footer.jsp" />

