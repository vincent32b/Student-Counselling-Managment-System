<%@ Page Title="" Language="C#" MasterPageFile="~/Code/MasterPage.Master" AutoEventWireup="true" CodeBehind="StudentTherapy.aspx.cs" Inherits="FYPSystem.Code.StudentTherapy" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<style>

        .con{
            
       padding-top:100px;
        text-align:center;
        background-image:url('/image/therapyb2.jpg');
        color:white;
           background-repeat: no-repeat;
    background-attachment: fixed;
    background-size: cover;
    padding-bottom:30px;
    }
        h1{
            font-size:50px;
        }
        .option{
            text-align:center;
        }
        .option .button2 {
          width: 25%;
         
          padding: 14px 20px;
          margin: 8px 0;
          border: none;

          cursor: pointer;
          border-bottom: 5px solid red;
        }

        .option .button2:hover {
       
          border-bottom: 5px solid lawngreen;
      
        }
        .maxwi{
            width:100%;
        }
        .item{

            width:300px;
            height:400px;
            background-color:floralwhite;
            margin-top:30px;
            margin-left:60px;
            border:3px;
            text-align:center;
            border-radius:10px;
            border-bottom: 5px solid blue;
            margin-bottom:10px;
        }
        .item img{
            padding-top:10px;
            width:200px;
            height:200px;
        }
       
         .item  button {
          width: 40%;
          padding: 10px 16px;
          margin: 8px 0;
          border:none;
          border-radius: 1px;
          cursor: pointer;
          color:white;
          background-color:red;
        }

        .item  button:hover {
       
          background-color: lawngreen;
      
        }
        .conDetails{
            margin-top:50px;
            margin-left:80px;
            width:90%;
            background-color:deepskyblue;
            padding-top:20px;
            padding-bottom:20px;
            margin-bottom :20px;
            text-align:center;
        }
        .conDetails2{
            width:95%;
            margin-left:30px;


            background-color:floralwhite;
            text-align:center;
        }
        .conDetails3{
            width:60%;
            margin-left:300px;
        }
        .conDetails2 img{
            width:100px;
            height:80px;
        }
         .button1 {
             padding-top:5px;
          width: 40%;
          padding: 10px 16px;
          margin: 8px 0;
          border:none;
          border-radius: 1px;
          cursor: pointer;
          color:white;
          background-color:red;
        }
    </style>

     <div class="con">
        <h1>THERAPY</h1>
    </div>
    <div class="option">
        <asp:button class="button2" runat="server" type="button" Text="General" ></asp:button>
         <asp:button  class="button2" runat="server" type="button" Text="Mental Health" OnClick="Unnamed2_Click" > </asp:button>
        <asp:button class="button2" runat="server" type="button" Text="Health" OnClick="Unnamed3_Click" ></asp:button>
    </div>
   
    <div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Therapy]"></asp:SqlDataSource>
    <asp:DataList ID="Dl1" runat="server" RepeatColumns="4" RepeatDirection="Horizontal"  OnItemCommand="Dl1_ItemCommand">
        <ItemTemplate>

                <div class="item">
                     <img src='<%# Eval("TherapyImg") %>' runat="server" id="img" />
                     <asp:Panel ID="Panel1" src='<%# Eval("TherapyLink") %>' runat="server"></asp:Panel>
                   <br />
                    <h3><%# Eval("TherapyTitle") %></h3>
                    <br />
                    
                    <%# Eval("TherapyDesc") %><br />
                    <asp:Button ID="btnRead" class="button1"  runat="server" Text="Read" CommandName="Read" ToolTip="Read"  CommandArgument='<%# DataBinder.Eval(Container.DataItem,"TherapyId") %>'/>
               


                </div>

        </ItemTemplate>
    </asp:DataList>
        </div>
     <div class="conDetails">
        <div class="conDetails2">
            <div class="conDetails3">

          
                            <br />                    <asp:Panel ID="Panel1" runat="server"></asp:Panel>
                    <asp:Panel ID="Panel2" runat="server"></asp:Panel>
                                    
                            Title:        <asp:Label ID="lblTitle" runat="server"></asp:Label><br />
                 Category :<asp:Label ID="lblcat" runat="server"></asp:Label><br />
                                    <asp:Label ID="lblDesc" runat="server"></asp:Label><br />
                <asp:Label ID="Label1" runat="server"></asp:Label><br />

                           
                            <br />
                   
                </div>
            </div>
    </div>
</asp:Content>

