<%@ Page Title="" Language="C#" MasterPageFile="~/Code/Admin.Master" AutoEventWireup="true" CodeBehind="AdminFAQM.aspx.cs" Inherits="FYPSystem.Code.AdminFAQM" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<style>
body {

	color: #566787;
	background: #f5f5f5;
	font-family: 'Varela Round', sans-serif;
	font-size: 13px;
}
.table-responsive {
    margin: 30px 0;
}
.table-wrapper {
	background: #fff;
	padding: 20px 25px;
	border-radius: 3px;
	min-width: 1000px;
	box-shadow: 0 1px 1px rgba(0,0,0,.05);
}
.table-title {        
	padding-bottom: 15px;
	background: #435d7d;
	color: #fff;
	padding: 16px 30px;
	min-width: 100%;
	margin: -20px -25px 10px;
	border-radius: 3px 3px 0 0;
}
.table-title h2 {
	margin: 5px 0 0;
	font-size: 24px;
}
.table-title .btn-group {
	float: right;
}
.table-title .btn {
	color: #fff;
	float: right;
	font-size: 13px;
	border: none;
	min-width: 50px;
	border-radius: 2px;
	border: none;
	outline: none !important;
	margin-left: 10px;
}
.table-title .btn i {
	float: left;
	font-size: 21px;
	margin-right: 5px;
}
.table-title .btn span {
	float: left;
	margin-top: 2px;
        height: 19px;
    }
table.table tr th, table.table tr td {
	border-color: #e9e9e9;
	padding: 12px 15px;
	padding-left:30px;
	vertical-align: middle;
}
table.table tr th:first-child {
	width: 60px;
}
table.table tr th:last-child {
	width: 100px;
}
table.table-striped tbody tr:nth-of-type(odd) {
	background-color: #fcfcfc;
}
table.table-striped.table-hover tbody tr:hover {
	background: #f5f5f5;
}
table.table th i {
	font-size: 13px;
	margin: 0 5px;
	cursor: pointer;
}	
table.table td:last-child i {
	opacity: 0.9;
	font-size: 22px;
	margin: 0 5px;
}
table.table td a {
	font-weight: bold;
	color: #566787;
	display: inline-block;
	text-decoration: none;
	outline: none !important;
}
table.table td a:hover {
	color: #2196F3;
}
table.table td a.edit {
	color: #FFC107;
}
table.table td a.delete {
	color: #F44336;
}
table.table td i {
	font-size: 19px;

}
table.table .avatar {
	border-radius: 50%;
	vertical-align: middle;
	margin-right: 10px;
}
.modify{
	padding-left:200px;
	width:50%;
}
    .auto-style1 {
        height: 49px;
    }

.overlay {
  position: fixed;
  top: 0;
  bottom: 0;
  left: 0;
  right: 0;
  background: rgba(0, 0, 0, 0.7);
  transition: opacity 500ms;
  visibility: hidden;
  opacity: 0;
}
.overlay:target {
  visibility: visible;
  opacity: 1;
}

.popup {
  margin: 70px auto;
  padding: 5px;
  background: #fff;
  border-radius: 5px;
  width: 65%;
  position:relative;
  transition: all 5s ease-in-out;
}

.popup h2 {
  margin-top: 0;
  color: #333;
  font-family: Tahoma, Arial, sans-serif;
}
.popup .close {
  position: absolute;
  top: 20px;
  right: 30px;
  transition: all 200ms;
  font-size: 30px;
  font-weight: bold;
  text-decoration: none;
  color: #333;
}
.popup .close:hover {
  color: #06D85F;
}
.popup .content {
  height:auto;
  overflow: auto;
}

@media screen and (max-width: 700px){
  .box{
    width: 70%;
  }
  .popup{
    width: 70%;
  }
}
	.button {
		margin-top:1230px;
		margin-left:1230px;
		padding-left: 410px;
		font-size: 1em;
		padding: 10px;
		color: #fff;
		background-color:green;
		border: 2px solid
	}
		.editbutton {
		
		font-size: 1em;
		padding: 10px;
		color: #fff;
		background-color:green;
		border: 2px solid;
		border-radius:3px;
	}
		.deletebutton {
		
		font-size: 1em;
		padding: 10px;
		color: #fff;
		background-color:red;
		border: 2px solid;
		border-radius:3px;
	}
		.pp1{
			padding-left:100px;
		}
</style>
	<asp:SqlDataSource ID="SqlDSFAQ" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [FAQ]"></asp:SqlDataSource>
   
    <!-- Add Modal HTML -->
						
	<div class="modify">
						<h2><asp:label id="idmo" runat="server">Modify FAQ</asp:label></h2>
						<asp:label ID="lblbid" runat="server">ID</asp:label><br />
						  <asp:TextBox id="txtFAQId"  class="form-control" runat="server"/><br />
						
			
						<asp:label id="lblq" runat="server">Question</asp:label><br />
						 <asp:TextBox id="txtFAQQ"  class="form-control" runat="server"/><br />
				
						<asp:label ID="lblan" runat="server">Answer</asp:label><br />
						 <asp:TextBox id="txtFAQanswer"  class="form-control" runat="server"/>
				 <asp:Label ID="lblStatus" runat="server"></asp:Label><br />
						<asp:Button  runat="server" ID="btnEdit"   name="Edit" Text="Submit Edit"  class="btn btn-success" OnClick="btnEdit_Click" />
		
	</div>
	<!-- popup Modal HTML -->
	<div id="popup1" class="overlay">
	<div class="popup">
		<h2></h2>
		<a class="close" href="#">&times;</a>
		<div class="content">
		<div class="modify">
						<h2><asp:label id="Label1" runat="server">Modify FAQ</asp:label></h2>
						<asp:label ID="Label2" runat="server">ID</asp:label><br />
						  <asp:TextBox id="TextBox1"  class="form-control" runat="server"/><br />
						
			
						<asp:label id="Label3" runat="server">Question</asp:label><br />
						 <asp:TextBox id="TextBox2"  class="form-control" runat="server"/><br />
				
						<asp:label ID="Label4" runat="server">Answer</asp:label><br />
						 <asp:TextBox id="TextBox3"  class="form-control" runat="server"/>
				 <asp:Label ID="Label5" runat="server"></asp:Label><br />
			<asp:Button  runat="server" ID="btnAdd" OnClick="btnAdd_Click"  name="Submit" Text="Submit Add"  class="btn btn-success" />
	
		
	</div>
					</div>
		</div>
	</div>
							<asp:HyperLink ID="HyperLink1" class="button"   href="#popup1" runat="server">Add FAQ</asp:HyperLink>
						
	<div class="container-xl">
	<div class="table-responsive">
		<div class="table-wrapper">
			<div class="table-title">
				<div class="row">
					<div class="col-sm-6">
						<h2>Manage <b>FAQ</b></h2>
					</div>
					<div class="col-sm-6">

						<%--<a href="#deleteEmployeeModal" class="btn btn-danger" data-toggle="modal"><i class="material-icons">&#xE15C;</i> <span>Delete</span></a>						
	--%>				</div>
				</div>
			</div>
			<table class="table table-striped table-hover">
				<thead>
					<tr>
						<th class="auto-style1">
							
						</th>
						<th class="auto-style1">ID</th>
						<th class="auto-style1">Question</th>
						<th class="auto-style1">Answer</th>
						<th class="auto-style1">Actions</th>
					</tr>
				</thead>

				 <asp:DataList ID="Dl2" runat="server"  OnItemCommand="Dl2_ItemCommand" DataKeyNames="FAQId" >
        <ItemTemplate>
				<tbody>
					<tr>
						<td class="pp1">
							<%# Eval("FAQId") %></td>
						<td class="pp1"><%# Eval("FAQTitle") %></td>
						<td class="pp1" ><%# Eval("FAQDes") %></td>
						
						<td class="pp1">
							
							<asp:Button ID="btnRemove" runat="server" class="deletebutton"  Text="Remove" CommandName="Remove" ToolTip="Delete a record" OnClientClick="javascript:return confirm('Are you sure to delete record?')" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"FAQId") %>'/>
							<asp:Button ID="btnEdit" runat="server" class="editbutton"  Text="Edit" CommandName="Edit" ToolTip="Edit a record"  CommandArgument='<%# DataBinder.Eval(Container.DataItem,"FAQId") %>'/>
								</td>
					</tr>					
				</tbody>
				</ItemTemplate>
					 </asp:DataList>
				

			</table>
			
		</div> 
	</div>        
</div>		
</asp:Content>
