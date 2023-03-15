<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="FYPSystem.Code.SignUp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
 <title>Sign Up</title>
    <style>
    body{
        box-sizing:border-box;
        background-image:url('/image/inti%20back.jpg');
        background-repeat: no-repeat;
        background-attachment: fixed;
        background-size: cover;
   
     }


  .container {

      margin-top:100px;
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
        
    
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="containerTop">Register
        </div>
        <div class="container">

            <table class="auto-style1">
                <tr>
                    <td>Username</td>
                    <td><asp:textbox ID="txtusername" runat="server" ></asp:textbox></td>
                </tr>
                <tr>
                    <td>Role</td>
                     <td>
                        <asp:DropDownList ID="ddlrole" runat="server">
                            <asp:ListItem>Admin</asp:ListItem>
                            <asp:ListItem>User</asp:ListItem>

                        </asp:DropDownList>

                    </td>
                    
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
                    <td><asp:TextBox runat="server" ID="txtDOB" CssClass="txt" TextMode="Date"></asp:TextBox></td>
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
                <tr>
                    <td>Password</td>
                    <td><asp:TextBox ID="txtpass" runat="server" TextMode="Password"/></td>
                </tr>
                 <tr>
                    <td>Confirm Password</td>
                    <td><asp:TextBox ID="txtconpass" runat="server" TextMode="Password"/></td>
                </tr>
            
             
            </table>
            
            <asp:Button runat="server" ID="btnRegister" CssClass="btn" Text="Register" OnClick="btnRegister_Click" />
                        <asp:RegularExpressionValidator ID="string" runat="server" ErrorMessage="Enter valid Email" ForeColor="Red"
                   ValidationExpression="^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$"  ControlToValidate="txtemail">
                   
                </asp:RegularExpressionValidator><br />
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ForeColor="Red" runat="server" ErrorMessage="8 character, 1 alphabet, 1 number"
                   ValidationExpression="^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$"  ControlToValidate="txtpass">
                   
                </asp:RegularExpressionValidator><br />
            <asp:RequiredFieldValidator ID="rfvcandidate" AAA
                       runat="server" ControlToValidate ="txtpass"
                       ErrorMessage="Please enter password" ForeColor="Red"
                        >
   
                    </asp:RequiredFieldValidator><br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ForeColor="Red"
                   runat="server" ControlToValidate ="txtDOB"
                   ErrorMessage="Please enter DOB" 
                        >
   
                </asp:RequiredFieldValidator><br />
            <asp:CompareValidator ID="pass_repass_compare" runat="server"
						ControlToCompare="txtpass"
						ControlToValidate="txtconpass"
						Type="String"
						ForeColor="Red"
						ErrorMessage="Passwords do not match!">
				</asp:CompareValidator>


        </div>
        
    </form>
</body>
</html>
