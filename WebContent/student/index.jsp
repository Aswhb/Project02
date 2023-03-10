<%@page import="db.DbConfig"%>
<%@page import="java.util.Map"%>
<jsp:include flush="true" page="header.jsp" />
<style>
ol li {
	border: 1px solid black;
	padding: 10px;
}
</style>
<div class="card shadow" style="min-height: 88vh;">
	<div class="card-body">
		<h5 class="p-2" style="border-bottom: 2px solid blue;">
			Dashboard</h5>
		<div class="container-fluid">
			<div class="row">
				<div class="col-sm-6 ">
					<h5 class="p-2" style="border-bottom: 2px solid blue;">Profile</h5>
					<%
                Map<String,String> map=DbConfig.findSingle("student", "rollno="+session.getAttribute("id"));
            %>
					<table class="table table-bordered ">
						<tr>
							<th>Roll no</th>
							<th><%= map.get("rollno") %></th>
						</tr>
						<tr>
							<th>Student Name</th>
							<th><%= map.get("name") %></th>
						</tr>
						<tr>
							<th>Gender</th>
							<th><%= map.get("gender") %></th>
						</tr>
						<tr>
							<th>City</th>
							<th><%= map.get("city") %></th>
						</tr>
						<tr>
							<th>Email ID</th>
							<th><%= map.get("email") %></th>
						</tr>
					</table>
				</div>
				<div class="col-sm-6 card bg-transparent " style="height: 400px;">
					<h5 class="p-2" style="border-bottom: 2px solid blue;">Notifications</h5>
					<marquee onmouseover="stop()" onmouseout="start()" direction="up"
						style="height: 100%">
						<ol>
							<% for(Map<String,String> row : DbConfig.allmsgs(session.getAttribute("id").toString())) { 
                        String lname=DbConfig.findSingle("lecturer", "lid="+row.get("lid")).get("lname");
                    %>
							<li class="p-2 border-top border-bottom">Message from <b><%= lname %></b>
							<span class="float-right"><%= row.get("mdate") %></span>
							<br> <%= row.get("msg") %></li>
							<% } %>
						</ol>
					</marquee>
				</div>
			</div>
		</div>
	</div>
</div>
<jsp:include flush="true" page="footer.jsp" />

