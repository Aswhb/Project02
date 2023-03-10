<%@page import="db.DbConfig"%>
<%@page import="java.util.Map"%>
<jsp:include flush="true" page="header.jsp" />
<div class="card shadow" style="min-height: 88vh;">
	<div class="card-body">
		<h5 class="p-2" style="border-bottom: 2px solid blue;">Subjects</h5>
		<div class="container-fluid">
    <div class="row">
        <div class="col-sm-8">
            <table class="table table-bordered table-sm table-striped">
                <thead class="table-white">
                    <tr>
                        <th>Subject ID</th>
                        <th>Subject Name</th>
                        <th>Class Name</th>
                        <th>Operations</th>
                    </tr>
                </thead>
                <tbody>
                    <%                        
                        for(Map<String,String> map: DbConfig.allRecords("subjects")) 
                        { %>
                    <tr>
                        <td><%= map.get("subid") %></td>
                        <td><%= map.get("subname") %></td>
                        <td><%
                        Map<String, String> cls = DbConfig.findSingle("class", "cid='" + map.get("cid") + "'");
                    %><%= cls.get("cname") %></td>
                        <td style="width:170px;">
                            <a onclick="return  confirm('Are you sure to delete this subject ?')" 
                               href="../DelSub?subid=<%= map.get("subid") %>" class="btn btn-sm btn-danger">
                                 <i class="fa fa-trash"></i> Remove</a>
                        <a  href="subjects.jsp?subid=<%= map.get("subid") %>" class="btn btn-sm btn-primary px-3">
                            <i class="fa fa-edit"></i> Edit</a></td>
                    </tr>
                        <% } %>
                </tbody>
            </table>
        </div>
        <div class="col-sm-4 p-0">
            <form method="post" action="../SOperate">                      
                <div class="form-group">
                    <label>Select Class</label>
                    <select name="cid" class="form-control">
                        <%                             
                            for(Map<String,String> map: DbConfig.allRecords("class")) {
                            %>
                        <option value="<%= map.get("cid") %>"> 
                            <%= map.get("cname") %>
                        </option>
                        <% } %>
                    </select>
                </div>                
                <div class="form-group">
                    <label>Subject Name</label>
                    <% String subname="";
                        if(request.getParameter("subid")!=null){ 
                        subname=DbConfig.findSingle("subjects", "subid="+request.getParameter("subid")).get("subname");
                    }%>
                    <input type="text" name="sub" value="<%= subname %>" class="form-control">
                </div>                                
                    <input type="hidden" name="subid" value="${param.subid}">
                    <% if(request.getParameter("subid")!=null){ %>
                    <button class="btn btn-primary btn-block" name="update"><i class="fa fa-save"></i> Save Subject
                    </button>
                 <% }else{ %>
                    <button class="btn btn-primary btn-block" name="add"><i class="fa fa-plus"></i> Add Subject</button>
                <% } %>
            </form>
        </div>
    </div>
</div>
</div>
</div>

<jsp:include flush="true" page="footer.jsp" />
