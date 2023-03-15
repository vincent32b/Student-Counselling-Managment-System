<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="FYPSystem.Code.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
 <title>Login</title>
<style>
body{
    box-sizing:border-box;
    background-image:url('/image/inti%20back.jpg');
    background-repeat: no-repeat;
    background-attachment: fixed;
    background-size: cover;
  
}
.container{
    position: absolute;
    background-color:white;
    text-align:center;
    width: 25%;  
    right:100px;
    height: auto;  
    margin-top:180px;
    border-radius: 50px;
    padding-bottom:20px;
}
.containerTop{
    position: absolute;
    background-color:red;
    color:black;
    text-align:center;
    width: 25%;  
    right:100px;
    height: 65px;  
    margin-top:80px;
    border-radius: 50px;
}
.container2{
    position: absolute;
    text-align: left;  
    width: 50%;  
    left:20px;
    height: auto;  
    margin-top:40px;
    color:white;
}

button{
    background-color:forestgreen;
     color: white;
     // padding: 14px 20px;
      //margin: 8px 0;
      border: none;
      cursor: pointer;
  //    width: 100%;
  //    opacity: 0.9;
}
h4 {
  font-size: 50px;
  color:white;
  padding-left:50px;
}
p{
    font-size: 15px;
    text-align:left;
    padding-left:50px;
    padding-top:0px;

}
p1{
    text-align:center;
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
  width: 75%;
  background-color: #4CAF50;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

input[type=submit]:hover {
  background-color: #45a049;
}
</style>
</head>

<body>

    <form id="form1" runat="server">
        <div class="container2">
            <h4>YOUR <br />FUTURE <br />
                BUILT TODAY</h4>
            <br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
            <p>@ Counselling management system</p>
        </div>
      
          <div class="container">
           
            <p>Username</p>
              <asp:TextBox id="txtUsername" runat="server" placeholder="username"  />
            <p>Password</p>
              <asp:TextBox ID="txtpassword" runat="server" type="password" placeholder="Password" name="password"/>
              <br />
              <asp:Label id="lbllabel" runat="server"  foreColor="red" />
           <br /><br />
             <asp:Button ID="btnSubmit" class="btn" runat="server" Text="Login" OnClick="btnSubmit_Click" />
          <br />
            <p1><a href="ForgotPassword.aspx">forgot password</a></p1>
            <p1><a href="SignUp.aspx">Sign Up</a></p1>
        </div>
          <div class="containerTop"> <h2>Login</h2></div>
           
    </form>
</body>
</html>
