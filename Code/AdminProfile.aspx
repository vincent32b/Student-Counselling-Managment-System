<%@ Page Title="" Language="C#" MasterPageFile="~/Code/Admin.Master" AutoEventWireup="true" CodeBehind="AdminProfile.aspx.cs" Inherits="FYPSystem.Code.AdminProfile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
                *{
  margin: 0;

  box-sizing: border-box;
  list-style: none;
  text-decoration: none;
  font-family: 'Josefin Sans', sans-serif;
      box-sizing:border-box;
}
     .background{
         background-color:darkslateblue;
     height:750px;
    }
    .con{   
        padding-top:50px;
        margin-left:150px;
        text-align:center;
       
    }
    .concolor{
        height:300px;
        width:1300px;
        background-color:white;
        border-radius: 20px;


    }
    .profileCon{
            float: left;
          width: 30%;
          padding: 10px;
          height: auto;
            background-color:white;
            box-sizing: border-box;
            margin:20px;
          margin-left:180px;
            text-align:left;
    }
     input[type=date], select {
             width: 100%;
          padding: 12px 20px;
          margin: 8px 0;
          display: inline-block;
          border: 1px solid red;
          border-radius: 4px;
          box-sizing: border-box;
          border-bottom: 2px solid red;
        }
        input[type=text], select {
             width: 100%;
          padding: 12px 20px;
          margin: 8px 0;
          display: inline-block;
          border: 1px solid red;
          border-radius: 4px;
          box-sizing: border-box;
          border-bottom: 2px solid red;
        }
        .sb{
            margin-top:400px;
            margin-left:450px;
     
        }
        .sb button {
           width:30%;
          background-color:red;
          color: white;
          padding: 14px 20px;
          margin: 50px 0;
          border: none;
          border-radius: 10px;
          cursor: pointer;
          text-align:center;
          margin-bottom:5px;
        }

        .sb button:hover {
          background-color: red;
          color:white;
        }
        input[type=submit] {
          width:30%;
          background-color:red;
          color: white;
          padding: 14px 20px;
          margin: 20px 0;
          border: none;
          border-radius: 10px;
          cursor: pointer;
          text-align:center;
          margin-bottom:5px;

        }

        input[type=submit]:hover {
          background-color: lawngreen;
        }
        h1{
            color:white;
        }
        .hp{
            color:white;
            padding-left:900px;
        }
             .in1 {
             width: 100%;
          padding: 12px 20px;
          margin: 8px 0;
          display: inline-block;
          border: 1px solid red;
          border-radius: 4px;
          box-sizing: border-box;
          border-bottom: 2px solid red;
        }
    </style>
      <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [StudentProfile]"></asp:SqlDataSource>
  
    <div class="background">
        <asp:HyperLink ID="HyperLink1" href="Login.aspx" runat="server">Logout</asp:HyperLink>


<div class="con">
        <h1>PROFILE</h1>
    
        <div class="concolor">
    <div class="profileCon">
        Student ID<br />
        <asp:TextBox id="txtstudentID" runat="server"/><br />
        Name<br />
        <asp:TextBox id="txtstudentName" runat="server"/><br />
        
        DOB<br />
        <asp:Label ID="txtstudentDOB" runat="server" CssClass="in1" />
        <%--<asp:TextBox  id="txtstudentDOB" runat="server" type="date" />--%><br />
      
        
    </div>
    <div class="profileCon">
        Gender<br />
         <asp:TextBox id="txtstudentGender" runat="server" /><br />
        Phone<br />
        <asp:TextBox id="txtstudentPhone" runat="server" /><br />
        Email<br />
         <asp:TextBox id="txtstudentEmail" runat="server" /><br />
        
    </div>
            </div>

         <br /> <asp:Button  runat="server" ID="btnAdd" OnClick="btnAdd_Click" name="Submit" Text="Edit Profile" placeholder="Submit"/><br />
        <asp:Label ID="lblStatus" runat="server"></asp:Label>
        </div>
  </div>
</asp:Content>
