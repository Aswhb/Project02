<%@page import="db.DbConfig"%>
<%@page import="java.util.Map"%>
<jsp:include flush="true" page="header.jsp" />
<div class="card shadow" style="min-height:88vh;">
	<div class="card-body">
	<h5 class="p-2" style="border-bottom:2px solid green;">Classes</h5>
<div class="container-fluid">
    <div class="row">
        <div class="col-sm-8">
            <table class="table table-bordered table-sm table-striped">
                <thead class="table-white">
                    <tr>
                        <th>Class ID</th>
                        <th>Class Name</th>
                        <th>Operations</th>
                    </tr>
                </thead>
                <tbody>
                    <%                        
                        for(Map<String,String> map: DbConfig.allRecords("class")) 
                        { %>                    
                    <tr>
                        <td><%= map.get("cid") %></td>
                        <td><%= map.get("cname") %></td>
                        <td><a onclick="return  confirm('Are you sure to delete this class ?')" 
                               href="../COperate?cid=<%= map.get("cid") %>" 
                               class="btn btn-sm btn-danger"><i class="fa fa-trash"></i> Remove</a></td>
                    </tr>
                        <% } %>
                </tbody>
            </table>
        </div>
        <div class="col-sm-4">
        	
            <form method="post" action="../COperate">
                <div class="form-group">
                    <label>Class Name</label>
                    <input type="text" name="cname" class="form-control">
                </div>                
                <button class="btn btn-primary btn-block" name="add"><i class="fa fa-plus"></i> Add Class</button>
            </form>            
        </div>
    </div>
</div>
	</div>
</div>


<jsp:include flush="true" page="footer.jsp" />