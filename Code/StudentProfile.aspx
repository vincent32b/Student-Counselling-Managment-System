<%@ Page Title="" Language="C#" MasterPageFile="~/Code/MasterPage.Master" AutoEventWireup="true" CodeBehind="StudentProfile.aspx.cs" Inherits="FYPSystem.Code.StudentProfile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<style>
     .background{
         background-color:floralwhite;
     height:720px;
    }
    .con{   
        padding-top:100px;
        text-align:center;
       
    }
    .concolor{
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
          padding-left:100px;

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

          margin-left:-200px;

          border: none;
          border-radius: 10px;
          cursor: pointer;
          text-align:center;
          margin-bottom:5px;

        }

        input[type=submit]:hover {
          background-color: lawngreen;
        }
    </style>
      <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [StudentProfile]"></asp:SqlDataSource>
  
    <div class="background">
    <div class="con">
        <h1>PROFILE</h1>
    </div>
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
</asp:Content>
