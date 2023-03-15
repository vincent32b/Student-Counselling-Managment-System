<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditProfile.aspx.cs" Inherits="FYPSystem.Code.EditProfile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<title>Edit Password</title>
    <style>
    body{
        box-sizing:border-box;
        background-image:url('/image/inti%20back.jpg');
        background-repeat: no-repeat;
        background-attachment: fixed;
        background-size: cover;
   
     }


  .container {

            margin-top:20px;
        background: white ;
        border-radius: 1em;
        padding: 1em;
        padding-left:60px;
        position: absolute;
        top: 50%;
        left: 50%;
        margin-right: -50%;
        transform: translate(-50%, -50%) }
    .containerTop{
              border-color: white;
            border-style:solid;
        background-color:red;
        color: black;
        border-radius: 1em;
        padding: 1em;
        padding-left:180px;
        padding-right:180px;
        position: absolute;
        top: 10%;
        left: 50%;
        margin-right: -50%;
  
        transform: translate(-50%, -50%)
    }
        
    
        .auto-style1 {
            width: 100%;
        }
        input[type=text], select {
             width: 75%;
          padding: 12px 20px;
          margin: 8px 0;
          display: inline-block;
          border: 1px solid red;
          border-radius: 4px;
          box-sizing: border-box;
          border-bottom: 2px solid red;
        }
        .txt{
               width: 75%;
          padding: 12px 20px;
          margin: 8px 0;
          display: inline-block;
          border: 1px solid red;
          border-radius: 4px;
          box-sizing: border-box;
          border-bottom: 2px solid red;
        }
        input[type=password], select {
          width: 75%;
          padding: 12px 20px;
          margin: 8px 0;
          display: inline-block;
          border: 1px solid red;
          border-radius: 4px;
          box-sizing: border-box;
          border-bottom: 2px solid red;
        }
        .btn {
          width: 86%;
          background-color: red;
          color: white;
  
          padding: 14px 20px;
          margin: 8px 0;
          border: none;
          border-radius: 4px;
          cursor: pointer;
          position:center;
        }

        .btn:hover {
          background-color: #45a049;
        }
                .btne {
          width: 86%;
          background-color: greenyellow;
          color: white;
  
          padding: 14px 20px;
          margin: 8px 0;
          border: none;
          border-radius: 4px;
          cursor: pointer;
          position:center;
        }

        .btne:hover {
          background-color: #45a049;
        }
    
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="containerTop">Edit Profile
        </div>
        <div class="container">

            <table class="auto-style1">
                <tr>
                    <td>Username</td>
                    <td><asp:textbox ID="txtusername" runat="server" ></asp:textbox></td>
                </tr>
                

                <tr>
                    <td>Full Name</td>
                    <td><asp:TextBox runat="server" id="txtFullname"/></td>
                </tr>
                <tr>
                    <td>DOB</td>
                    <td>Gender</td>
                </tr>
                 <tr>
                    <td><asp:Label runat="server" ID="txtDOB" CssClass="txt" ></asp:Label></td>
                    <td>
                        <asp:DropDownList ID="ddlgender" runat="server">
                            <asp:ListItem>Male</asp:ListItem>
                            <asp:ListItem>Female</asp:ListItem>

                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>Phone</td>
                    <td><asp:TextBox ID="txtphone" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td><asp:TextBox ID="txtemail" runat="server" /></td>
                </tr>
               
            
             
            </table>
            
            <asp:Button runat="server" ID="btnRegister" CssClass="btn" Text="Submit" OnClick="btnRegister_Click" />
                        <asp:Button runat="server" ID="Button1" CssClass="btne" Text="Change Password" OnClick="Button1_Click"  />
                        <asp:RegularExpressionValidator ID="string" runat="server" ErrorMessage="Enter valid Email" ForeColor="Red"
                   ValidationExpression="^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$"  ControlToValidate="txtemail">
                   
                </asp:RegularExpressionValidator><br />
          
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ForeColor="Red"
                   runat="server" ControlToValidate ="txtphone"
                   ErrorMessage="Please enter DOB" 
                        >
   
                </asp:RequiredFieldValidator><br />
           


        </div>
        
    </form>
</body>
</html>
