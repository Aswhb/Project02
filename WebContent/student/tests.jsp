<%@page import="db.OLSHelper"%>
<%@page import="db.DbConfig"%>
<%@page import="java.util.Map"%>
<jsp:include flush="true" page="header.jsp" />
<div class="card shadow" style="min-height: 88vh;">
	<div class="card-body">
		<h5 class="p-2" style="border-bottom: 2px solid green;">Tests</h5>
		<div class="container-fluid">
			<table class="table table-bordered table-striped table-sm ">
				<thead class="table-dark">
					<tr>
						<th>Test ID</th>
						<th>Test Name</th>
						<th>Subject</th>
						<th>Lecturer</th>
						<th>Create Date</th>
						<th>Submit Date</th>
						<th>Status</th>
						<th>Operation</th>
					</tr>
				</thead>
				<tbody>
					<% for (Map<String,String> map : DbConfig.studenttests(session.getAttribute("id").toString())) { 
					String result= OLSHelper.getTestRemarks(map.get("id"),session.getAttribute("id").toString());
					
					%>
					<tr>
						<td><%= map.get("id") %></td>
						<td><%= map.get("tname") %></td>
						<td><%= OLSHelper.getSubName(map.get("subid")) %></td>
						<td><%= OLSHelper.getLecturerName(map.get("lecid")) %></td>
						<td><%= DbConfig.formatDate(map.get("createdate")) %></td>
						<td><%= DbConfig.formatDate(map.get("submitdate")) %></td>
						<td><%= result==null ? "" : result %></td>
						<td>
						<% if(result == null) {
						 %>
						<a
							href="exam.jsp?id=<%= map.get("id") %>"
							class="btn btn-primary btn-sm"><i class="fas fa-eye"></i>
								Show Questions</a> 
								<% }
							%>
								</td>
								
					</tr>
					<% } %>
				</tbody>
			</table>
		</div>
	</div>
</div>
<jsp:include flush="true" page="footer.jsp" />

