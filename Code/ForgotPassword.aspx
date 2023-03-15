<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="FYPSystem.Code.ForgotPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<title>Forgot Password</title>
    <style>
    body{
        box-sizing:border-box;
        background-image:url('/image/inti%20back.jpg');
        background-repeat: no-repeat;
        background-attachment: fixed;
        background-size: cover;
   
     }


  .container {

      margin-top:0px;
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
        <div class="containerTop">Recover Password
        </div>
        <div class="container">

            <table class="auto-style1">
                
                <tr>
                    <td>Email</td>
                    <td><asp:TextBox ID="txtemail" runat="server" /></td>
                </tr>
            
             
            </table>
            
        <asp:Button runat="server" ID="btnRegister" CssClass="btn" Text="Submit" OnClick="btnRegister_Click" />
               <asp:Label ID="lblStatus" runat="server" />
                 
                        <asp:RegularExpressionValidator ID="string" runat="server" ErrorMessage="Enter valid Email" ForeColor="Red"
                   ValidationExpression="^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$"  ControlToValidate="txtemail">
                   
                </asp:RegularExpressionValidator><br />



        </div>
        
    </form>
</body>
</html>

