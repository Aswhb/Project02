<%@page import="db.OLSHelper"%>
<%@page import="db.DbConfig"%>
<%@page import="java.util.Map"%>
<jsp:include flush="true" page="header.jsp" />
<style>
input[type="radio"]{
display:none;
}
input[type="radio"]:checked + label {
    font-weight: bold;
    color:white;
    background-color:green;
}
.list-group-item{
	padding:0;
}
label{
display:block;
padding:0.75rem;
}
</style>
<%
String tid=request.getParameter("id");
int counter=1;
String tname=OLSHelper.getTestName(tid);
%>
<div class="card shadow" style="min-height: 88vh;">
<div class="card-body">
	<h5 class="p-2" style="border-bottom: 2px solid green;">Questions for Test :<%= tname %></h5>
	<form method="post" action="../SubmitExam">
	<input type="hidden" value="${param.id }" name="tid">
			<% for(Map<String,String> map : DbConfig.findall("questions", "tid="+tid)) { %>
			<div class="card shadow mb-2">
			<div class="card-body">
				
				<ul class="list-group mt-2">
					<li class="list-group-item active p-3">
					<%= counter++ %>.)
					<b><%= map.get("descr") %></b>
					</li>
					<li class="list-group-item">
					<input id="q1<%= map.get("id") %>" type="radio" value="A" name="q<%= map.get("id") %>">
					<label for="q1<%= map.get("id") %>">A. <%= map.get("ch1") %></label>
					</li>
					<li class="list-group-item">
					<input id="q2<%= map.get("id") %>" type="radio" value="B" name="q<%= map.get("id") %>">
					<label for="q2<%= map.get("id") %>">B. <%= map.get("ch2") %></label>
					</li>
					<li class="list-group-item">
					<input id="q3<%= map.get("id") %>" type="radio" value="C" name="q<%= map.get("id") %>">
					<label for="q3<%= map.get("id") %>">C. <%= map.get("ch3") %></label>
					</li>
					<li class="list-group-item">
					<input id="q4<%= map.get("id") %>" type="radio" value="D" name="q<%= map.get("id") %>">
					<label for="q4<%= map.get("id") %>">D. <%= map.get("ch4") %></label>
					</li>
				</ul>
				</div>
				</div>
			<% } %>
			<button class="btn btn-primary float-right my-2">Submit Exam</button>
			</form>
	</div>
</div>
<jsp:include flush="true" page="footer.jsp" />