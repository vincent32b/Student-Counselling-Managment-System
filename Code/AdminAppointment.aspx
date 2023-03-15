<%@ Page Title="" Language="C#" MasterPageFile="~/Code/Admin.Master" AutoEventWireup="true" CodeBehind="AdminAppointment.aspx.cs" Inherits="FYPSystem.Code.AdminAppointment" %>
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
	.conbody{
		padding-top:50px;
	}
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
	width: 1200px;
	box-shadow: 0 1px 1px rgba(0,0,0,.05);
}
.table-title {        
	padding-bottom: 15px;
	background-color:darkblue;
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
	width: 600px;
}
table.table tr th:last-child {
	width: 1000px;
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
		.linkbutton {
		
		font-size: 1em;
		padding: 10px;
		color: #fff;
		background-color:darkblue;
		border: 2px solid;
		border-radius:3px;
	}
				.Joinbutton {
		
		font-size: 1em;
		padding: 10px;
		color: #fff;
		background-color:yellow;
		border: 2px solid;
		border-radius:3px;
	}
		.pp{
			padding-left:40px;
		}
		.pp1{
			padding-left:75px;
		}
				.pp2{
			padding-left:100px;
		}
				.conbody1{
					width:100%;
					padding-left:200px;
				}
</style>
	
	<asp:SqlDataSource ID="SqlDbEvent" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Appointment]"></asp:SqlDataSource>
   <div class="conbody">
	<div class="conbody1">
	<div class="table-responsive">
		<div class="table-wrapper">
			<div class="table-title">
				<div class="row">
					<div class="col-sm-6">
						<h2>Appiontment</h2>
					</div>
					<div class="col-sm-6">

					</div>
				</div>
			</div>
			<table class="table table-striped table-hover" style="vertical-align: text-top; text-align: center; display: inherit; clip: rect(auto, auto, auto, inherit); table-layout: auto; left: inherit;">
				<thead>
					<tr>
								<th >Username</th>
						<th width="10%">Preferred Date</th>
						<th width="15%">Preferred Time</th>
						<th width="15%">Issue</th>
						<th width="10%">Method</th>

						<th width="5%">Status</th>
			
						<th >Action</th>
					</tr>
				</thead>

				 <asp:DataList ID="Dl2" runat="server"  OnItemCommand="Dl2_ItemCommand" DataKeyNames="EventId"  >
        <ItemTemplate>
				<tbody>
					<tr>
						<td class="pp">
							<%# Eval("username") %></td>
						<td class="pp1"><%# Eval("Date") %></td>
						<td class="pp1" ><%# Eval("Slot") %></td>
						<td class="pp1"><%# Eval("Issue") %></td>
						<td class="pp1" ><%# Eval("Method") %></td>

						
						<td class="pp" ><%# Eval("AAStatus") %></td>
						<td class="pp2" >
							
							<asp:Button ID="btnApprove" class="editbutton"  Visible='<%# Eval("AAStatus").ToString() == "Pending" ? true : false %>'  runat="server" Text="Approve" CommandName="Approve" ToolTip="Approve" OnClientClick="javascript:return confirm('Are you sure to Approve record?')" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"Id") %>'/>
							<asp:Button ID="btnReject"   class="deletebutton"  Visible='<%# Eval("AAStatus").ToString() == "Pending" ? true : false %>'  runat="server" Text="Reject" CommandName="Reject" ToolTip="Reject"  CommandArgument='<%# DataBinder.Eval(Container.DataItem,"Id") %>'/>
							<asp:Button ID="btnLink"  type="string"  Visible='<%# Eval("AAStatus").ToString() == "Approved" ? true : false %>'    class="linkbutton"  runat="server" Text="Send Link" CommandName="Link" ToolTip="Link"  CommandArgument='<%# DataBinder.Eval(Container.DataItem,"Id") %>'/>
									<asp:Button ID="Button1"  type="string"  Visible='<%# Eval("Link").ToString() == "" ? false : true %>'    class="Joinbutton"  runat="server" Text="Join" CommandName="Join" ToolTip="Join"  CommandArgument='<%# DataBinder.Eval(Container.DataItem,"Id") %>'/>
							
						
						</td>
					</tr>					
				</tbody>
				</ItemTemplate>
					 </asp:DataList>
				

			</table>
			
		</div> 
	</div>        
</div>		</div>

</asp:Content>


