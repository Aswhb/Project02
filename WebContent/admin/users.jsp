<%@page import="db.DbConfig"%>
<%@page import="java.util.Map"%>
<jsp:include flush="true" page="header.jsp" />
<div class="card shadow" style="min-height: 88vh;">
	<div class="card-body">
		<h5 class="p-2" style="border-bottom: 2px solid green;">All Users</h5>
		<div class="container-fluid">
<table class="table table-bordered table-sm table-striped">
    <thead class="table-dark">
        <tr>
            <th>User ID</th>
            <th>User Name</th>
            <th>Role</th>
            <th>Password</th>
            <th>ID</th>
            <th>Status</th>
        </tr>
    </thead>
    <tbody>
        <% for(Map<String,String> map : DbConfig.allRecords("users")) { %>
        <tr>
            <td><%= map.get("userid") %></td>
            <td><%= map.get("uname") %></td>
            <td><%= map.get("role") %></td>
            <td><%= map.get("pwd") %></td>
            <td><%= map.get("id") %></td>
            <td><%= map.get("status") %></td>
        </tr>
        <% } %>
    </tbody>
</table>
</div>
</div>
</div>
<jsp:include flush="true" page="footer.jsp" />



