<%@page import="db.DbConfig"%>
<%@page import="java.util.Map"%>
<jsp:include flush="true" page="header.jsp" />
<div class="card shadow" style="min-height: 88vh;">
	<div class="card-body">
		<h5 class="p-2" style="border-bottom: 2px solid green;">Material
			Available</h5>
		<div class="container-fluid">
			<table class="table table-bordered table-striped table-sm ">
				<thead class="table-dark">
					<tr>
						<th>Material ID</th>
						<th>Subject</th>
						<th>Category</th>
						<th>Lecturer</th>
						<th>File Name</th>
						<th>Operation</th>
					</tr>
				</thead>
				<tbody>
					<% for (Map<String,String> map : DbConfig.studentmat(session.getAttribute("id").toString())) { %>
					<tr>
						<td><%= map.get("matid") %></td>
						<td><%= DbConfig.findSingle("subjects", "subid="+map.get("subid")).get("subname") %>
						</td>
						<td><%= DbConfig.findSingle("matcat", "catid="+map.get("catid")).get("catname") %>
						</td>
						<td><%= DbConfig.findSingle("lecturer", "lid="+map.get("lid")).get("lname") %>
						</td>
						<td><%= map.get("filename") %></td>
						<td><a href="../content/<%= map.get("filename") %>" download
							class="btn btn-success btn-sm"><i
								class="fas fa-file-download"></i> Download</a> <a
							href="../content/<%= map.get("filename") %>" target="blank"
							class="btn btn-primary btn-sm"><i class="fas fa-eye"></i>
								View</a></td>
					</tr>
					<% } %>
				</tbody>
			</table>
		</div>
	</div>
</div>
<jsp:include flush="true" page="footer.jsp" />

