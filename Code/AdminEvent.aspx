<%@ Page Title="" Language="C#" MasterPageFile="~/Code/Admin.Master" AutoEventWireup="true" CodeBehind="AdminEvent.aspx.cs" Inherits="FYPSystem.Code.AdminEvent" %>
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
		.pp2{
			padding-left:80px;
		}
		.pp1{
			padding-left:100px;
		}
</style>
	<asp:SqlDataSource ID="SqlDbEvent" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Event]"></asp:SqlDataSource>
   
    <!-- Add Modal HTML -->
						
	<div class="modify">
						<h2><asp:label id="lblti" runat="server">Modify Event</asp:label></h2>
						<asp:label ID="lblid" runat="server">ID</asp:label><br />
						  <asp:TextBox id="txtEventId"  class="form-control" runat="server"/><br />

		
		<asp:Label ID="lblimglink" runat="server" />

						<asp:label ID="lbltt" runat="server">Title</asp:label><br />
						 <asp:TextBox id="txtEventName"  class="form-control" runat="server"/><br />
				
						<asp:label ID="lblimage" runat="server">Event Image</asp:label>
                                    <div class = "form-group">
                                        <asp:FileUpload ID ="flImage" runat = "server"/><br />

                                        <asp:Label ID ="lblMsg" runat ="server" />
                                        <asp:Label ID ="lblTest" runat="server" Font-Bold="true" ForeColor="Red"></asp:Label>
                                    </div>
						<asp:label runat="server" ID="lbltime">Time</asp:label><br />
						<asp:TextBox id="txtTime"  class="form-control" runat="server" textmode="Time"/><br />
					
						<asp:label ID="lbldate" runat="server">Date</asp:label><br />
						<asp:TextBox id="txtDate"  class="form-control" runat="server" textmode="Date"/><br />
						<asp:label ID="lblv" runat="server">Venue</asp:label><br />	
						<asp:TextBox id="txtVenue"  class="form-control" runat="server" /><br />
				
						<asp:label runat="server" ID="lblshort">Short Description</asp:label><br />
						 <asp:TextBox id="txtShort"  class="form-control" runat="server"/><br />
				
						<asp:label runat="server" ID="lbllong">Long Description</asp:label><br />
						 <asp:TextBox id="txtLong"  class="form-control" runat="server"/><br />
				
			 <asp:Label ID="lblStatus" runat="server"></asp:Label>
				

		<asp:Button  runat="server" ID="btnEdit"   name="Edit" Text="Submit Edit"  class="btn btn-success" OnClick="btnEdit_Click" />
		
	</div>

	    <!-- popup Modal HTML -->
	<div id="popup1" class="overlay">
	<div class="popup">
		<h2></h2>
		<a class="close" href="#">&times;</a>
		<div class="content">
			<div class="modify">					

						
					
		
		<asp:Label ID="Label3" runat="server" />

						<asp:label ID="Label4" runat="server">Title</asp:label><br />
						 <asp:TextBox id="TextBox2"  class="form-control" runat="server"/><br />
				
						<asp:label ID="Label5" runat="server">Event Image</asp:label>
                                    <div class = "form-group">
                                        <asp:FileUpload ID ="FileUpload1" runat = "server"/><br />

                                        <asp:Label ID ="Label6" runat ="server" />
                                        <asp:Label ID ="Label7" runat="server" Font-Bold="true" ForeColor="Red"></asp:Label>
                                    </div>
						<asp:label runat="server" ID="Label8">Time</asp:label><br />
						<asp:TextBox id="TextBox3"  class="form-control" runat="server" textmode="Time"/><br />
					
						<asp:label ID="Label9" runat="server">Date</asp:label><br />
						<asp:TextBox id="TextBox4"  class="form-control" runat="server" textmode="Date"/><br />
						<asp:label ID="Label10" runat="server">Venue</asp:label><br />
						<asp:TextBox id="TextBox5"  class="form-control" runat="server" /><br />
				
						<asp:label runat="server" ID="Label11">Short Description</asp:label><br />
						 <asp:TextBox id="TextBox6"  class="form-control" runat="server"/><br />
				
						<asp:label runat="server" ID="Label12">Long Description</asp:label><br />
						 <asp:TextBox id="TextBox7"  class="form-control" runat="server"/><br />
				
			 <asp:Label ID="Label13" runat="server"></asp:Label>
				

				
					<asp:Button  runat="server" ID="btnAdd" OnClick="btnAdd_Click"  name="Submit" Text="Submit Add"  class="btn btn-success" />
	</div>
					</div>
		</div>
	</div>
	<asp:HyperLink ID="HyperLink1" class="button"   href="#popup1" runat="server">Add Event</asp:HyperLink>

	<div class="container-xl">
			<div class="table-responsive">
		<div class="table-wrapper">
			<div class="table-title">
				<div class="row">
					<div class="col-sm-6">
						<h2>Manage <b>Event</b></h2>
					</div>
					<div class="col-sm-6">


						<%--<a href="#deleteEmployeeModal" class="btn btn-danger" data-toggle="modal"><i class="material-icons">&#xE15C;</i> <span>Delete</span></a>						
	--%>				</div>
				</div>
			</div>
			<table class="table table-striped table-hover">
				<thead>
					<tr>

						<th></th>
						<th>Title</th>
						<th>Date</th>
						<th>Venue</th>
						<th>Description</th>
						<th>Action</th>
					</tr>
				</thead>

				 <asp:DataList ID="Dl2" runat="server"  OnItemCommand="Dl2_ItemCommand" DataKeyNames="EventId" >
        <ItemTemplate>
				<tbody>
					<tr>
	
						<td class="pp1"><%# Eval("EventName") %></td>
						<td class="pp2"><%# Eval("EventDate") %></td>
						<td class="pp2"><%# Eval("EventVenue") %></td>
							<td class="pp2"><%# Eval("EventDesc") %></td>
						<td>
							
							<asp:Button ID="btnRemove" class="deletebutton" runat="server" Text="Remove" CommandName="Remove" ToolTip="Delete a record" OnClientClick="javascript:return confirm('Are you sure to delete record?')" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"EventId") %>'/>
							<asp:Button ID="btnEdit" class="editbutton"  runat="server" Text="Edit" CommandName="Edit" ToolTip="Edit a record"  CommandArgument='<%# DataBinder.Eval(Container.DataItem,"EventId") %>'/>
								
						
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
