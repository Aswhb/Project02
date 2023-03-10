<%@page import="java.util.Map"%>
<jsp:include flush="true" page="header.jsp" />
<%@page import="db.DbConfig,java.sql.*"%>
<div class="card shadow" style="min-height: 88vh;">
	<div class="card-body">
		<button data-target="#ladd" data-toggle="modal"
			class="btn btn-primary btn-sm float-right">
			<i class="fa fa-plus"></i> Add Student
		</button>
		<h5 class="p-2" style="border-bottom: 2px solid green;">Students</h5>
		<div class="container-fluid">
			<table class="table table-bordered table-sm table-striped">
				<thead>
					<tr>
						<th style="width: 100px;">Roll no</th>
						<th style="width: 200px">Student Name</th>
						<th>City</th>
						<th>Gender</th>
						<th>Class</th>
						<th style="width: 200px">Operation</th>
					</tr>
				</thead>
				<tbody>
					<%
                Connection con = DbConfig.connect();
                ResultSet rs = con.createStatement().executeQuery("SELECT * FROM student");
                while (rs.next()) {
            %>
					<tr>
						<td><%= rs.getString("rollno")%></td>
						<td><%= rs.getString("name")%></td>
						<td><%= rs.getString("city")%></td>
						<td><%= rs.getString("gender")%></td>
						<td>
							<%
                        Map<String, String> cls = DbConfig.findSingle("class", "cid='" + rs.getString("class") + "'");
                    %><%= cls.get("cname") %></td>
						<td style="width: 150px">
							<button type="button"
								data-target="#mdel<%= rs.getString("rollno")%>"
								data-toggle="modal" class="btn btn-danger btn-sm">
								<i class="fa fa-trash"></i> Remove
							</button>
							<button type="button"
								data-target="#medit<%= rs.getString("rollno")%>"
								data-toggle="modal" class="btn btn-primary btn-sm">
								<i class="fa fa-edit"></i> Edit
							</button>
						</td>
					</tr>
					<div class="modal" id="medit<%= rs.getString("rollno")%>">
						<div class="modal-dialog">
							<div class="modal-content">
								<form method="post" action="../SUpdate">
									<div class="modal-header">
										<h5>Update Student Information</h5>
										<button type="button" class="close" data-dismiss="modal">&times;</button>
									</div>
									<div class="modal-body">
										<div class="form-group">
											<label>Roll no</label> <input type="text" readonly
												value="<%= rs.getString("rollno")%>" name="rollno"
												class="form-control">
										</div>
										<div class="form-group">
											<label>Student Name</label> <input type="text"
												value="<%= rs.getString("name")%>" name="name"
												class="form-control">
										</div>
										<div class="form-group">
											<label>City</label> <input type="text"
												value="<%= rs.getString("city")%>" name="city"
												class="form-control">
										</div>
										<div class="form-group">
											<label>Gender</label> <select name="gender"
												class="form-control">
												<option
													<%= rs.getString("gender").equals("Male") ? "selected" : ""%>>Male</option>
												<option
													<%= rs.getString("gender").equals("Female") ? "selected" : ""%>>Female</option>
											</select>
										</div>
										<div class="form-group">
											<label>Email ID</label> <input type="email"
												value="<%= rs.getString("email")%>" name="email"
												class="form-control">
										</div>
										<div class="form-group">
											<label>Class</label> <select name="cid" class="form-control">
												<% for (Map<String, String> map : DbConfig.allRecords("class")) {%>
												<option value="<%= map.get("cid")%>"
													<%= map.get("cid").equals(rs.getString("class")) ? "selected" : ""%>>
													<%= map.get("cname")%></option>
												<% }%>
											</select>
										</div>
									</div>
									<div class="modal-footer">
										<button class="btn btn-primary">Update Student</button>
									</div>
								</form>
							</div>
						</div>
					</div>
					<div class="modal fade" id="mdel<%= rs.getString("rollno")%>">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h5>Remove Confirmation</h5>
									<button class="close" data-dismiss="modal">&times;</button>
								</div>
								<div class="modal-body">
									<h6>
										Are you sure to Remove Student <br>with Roll No <b><%= rs.getString("rollno")%></b>
										and name <b><%= rs.getString("name")%></b> ?
									</h6>
								</div>
								<div class="modal-footer">
									<form method="post" action="../SDel">
										<input type="hidden" name="rollno"
											value="<%= rs.getString("rollno")%>">
										<button class="btn btn-danger">Remove Student</button>
									</form>
								</div>
							</div>
						</div>
					</div>
					<% } %>
				</tbody>
			</table>
		</div>
	</div>
</div>
<div class="modal" id="ladd">
	<div class="modal-dialog">
		<div class="modal-content">
			<form action="../SAdd" method="post">
				<div class="modal-header">
					<h5>Add New Student</h5>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<label>Student Name</label> <input type="text" required
							name="name" class="form-control">
					</div>
					<div class="form-group">
						<label>City</label> <input type="text" required name="city"
							class="form-control">
					</div>
					<div class="form-group">
						<label>Gender</label> <select name="gender" class="form-control">
							<option>Male</option>
							<option>Female</option>
						</select>
					</div>
					<div class="form-group">
						<label>Email ID</label> <input type="email" required name="email"
							class="form-control">
					</div>
					<div class="form-group">
						<label>Class</label> <select required name="cid"
							class="form-control">
							<% for (Map<String, String> map : DbConfig.allRecords("class")) {%>
							<option value="<%= map.get("cid")%>">
								<%= map.get("cname")%></option>
							<% }%>
						</select>
					</div>
				</div>
				<div class="modal-footer">
					<button class="btn btn-primary">Add Student</button>
				</div>
			</form>
		</div>
	</div>
</div>
<jsp:include flush="true" page="footer.jsp" />