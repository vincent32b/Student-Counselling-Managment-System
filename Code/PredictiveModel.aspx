<%@ Page Title="" Language="C#" MasterPageFile="~/Code/Admin.Master" AutoEventWireup="true" CodeBehind="PredictiveModel.aspx.cs" Inherits="FYPSystem.Code.PredictiveModel" %>
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
        }.wrapper{
  display: flex;
  position: relative;
}
            .wrapper .main_content {
                width: 100%;
               // padding-left: 100px;
            }

    </style>
    <div class="wrapper">
        <div class="main_content">
        <iframe style="width:100%;" height="900" data-anvil-embed="data-anvil-embed" src="http://localhost:8502/"></iframe>
        </div>
           </div>
</asp:Content>

