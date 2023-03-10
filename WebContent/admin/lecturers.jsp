<jsp:include flush="true" page="header.jsp" />
<%@page import="db.DbConfig,java.sql.*"%>
<div class="card shadow" style="min-height: 88vh;">
	<div class="card-body">
		<button data-target="#ladd" data-toggle="modal"
			class="btn btn-primary btn-sm float-right">
			<i class="fa fa-plus"></i> Add Teacher
		</button>
		<h5 class="p-2" style="border-bottom: 2px solid green;">Teachers</h5>
		<div class="container-fluid">
			<table class="table table-bordered table-sm table-striped">
				<thead>
					<tr>
						<th>Teacher ID</th>
						<th>Teacher Name</th>
						<th>City</th>
						<th>Gender</th>
						<th>Email</th>
						<th style="width: 200px;">Operation</th>
					</tr>
				</thead>
				<tbody>
					<%
						Connection con = DbConfig.connect();
					ResultSet rs = con.createStatement().executeQuery("SELECT * FROM lecturer");
					while (rs.next()) {
					%>
					<tr>
						<td><%=rs.getString("lid")%></td>
						<td><%=rs.getString("lname")%></td>
						<td><%=rs.getString("city")%></td>
						<td><%=rs.getString("gender")%></td>
						<td><%=rs.getString("email")%></td>
						<td style="width: 150px"><button type="button"
								data-target="#mdel<%=rs.getString("lid")%>"
								data-toggle="modal" class="btn btn-danger btn-sm">
								<i class="fa fa-trash"></i> Remove
							</button>
							<button type="button"
								data-target="#medit<%=rs.getString("lid")%>"
								data-toggle="modal" class="btn btn-primary btn-sm">
								<i class="fa fa-edit"></i> Edit
							</button> <!-- edit dialog -->
							<div class="modal fade" id="medit<%=rs.getString("lid")%>">
								<div class="modal-dialog">
									<div class="modal-content">
										<form method="post" action="../LUpdate">
											<div class="modal-header">
												<h5>Edit Teacher Details</h5>
												<button class="close" data-dismiss="modal">&times;</button>
											</div>
											<div class="modal-body">
												<div class="form-group">
													<label>Teacher Name</label> <input type="text"
														value="<%=rs.getString("lname")%>" name="lname"
														class="form-control">
												</div>
												<div class="form-group">
													<label>City</label> <input type="text"
														value="<%=rs.getString("city")%>" name="city"
														class="form-control">
												</div>
												<div class="form-group">
													<label>Gender</label> <select name="gender"
														class="form-control">
														<option
															<%=rs.getString("gender").equals("Male") ? "selected" : ""%>>Male</option>
														<option
															<%=rs.getString("gender").equals("Female") ? "selected" : ""%>>Female</option>
													</select>
												</div>
												<div class="form-group">
													<label>Email ID</label> <input type="email"
														value="<%=rs.getString("email")%>" name="email"
														class="form-control">
												</div>
												<div class="form-group">
													<label>Qualification</label> <input type="text"
														value="<%=rs.getString("qual")%>" name="qual"
														class="form-control">
												</div>
											</div>
											<div class="modal-footer">
												<input type="hidden" name="lid"
													value="<%=rs.getString("lid")%>">
												<button class="btn btn-danger">Save Details</button>
											</div>
										</form>
									</div>
								</div>
							</div> <!-- Delete dialog -->
							<div class="modal fade" id="mdel<%=rs.getString("lid")%>">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<h5>Remove Confirmation</h5>
											<button class="close" data-dismiss="modal">&times;</button>
										</div>
										<div class="modal-body">
											<h6>
												Are you sure to delete  <b><%=rs.getString("lname")%></b>
												?
											</h6>
										</div>
										<div class="modal-footer">
											<form method="post" action="../LDel">
												<input type="hidden" name="lid"
													value="<%=rs.getString("lid")%>">
												<button class="btn btn-danger">Delete Teacher</button>
											</form>
										</div>
									</div>
								</div>
							</div></td>
					</tr>
					<%
						}
					%>

				</tbody>
			</table>
		</div>
		<div class="modal" id="ladd">
			<div class="modal-dialog">
				<div class="modal-content">
					<form action="../LAdd" method="post">
						<div class="modal-header">
							<h5>Add New Teacher</h5>
							<button type="button" class="close" data-dismiss="modal">&times;</button>
						</div>
						<div class="modal-body">
							<div class="form-group">
								<label>Teacher Name</label> <input type="text" required
									name="lname" class="form-control">
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
								<label>Email ID</label> <input type="email" required
									name="email" class="form-control">
							</div>
							<div class="form-group">
								<label>Qualification</label> <input type="text" required
									name="qual" class="form-control">
							</div>
						</div>
						<div class="modal-footer">
							<button class="btn btn-primary">Add Teacher</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
<jsp:include flush="true" page="footer.jsp" />