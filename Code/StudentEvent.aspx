<%@ Page Title="" Language="C#" MasterPageFile="~/Code/MasterPage.Master" AutoEventWireup="true" CodeBehind="StudentEvent.aspx.cs" Inherits="FYPSystem.Code.StudentEvent" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>

        .con{
            
       padding-top:200px;
        text-align:center;
        background-image:url('/image/Event%20backgrounff.jpg');
        color:white;
           background-repeat: no-repeat;
    background-attachment: fixed;
    background-size: cover;
    padding-bottom:100px;
    }
        h1{
            font-size:50px;
        }
        .option{
            text-align:center;
        }
        .option button {
          width: 25%;
         
          padding: 14px 20px;
          margin: 8px 0;
          border: none;

          cursor: pointer;
          border-bottom: 5px solid red;
        }

        .option button:hover {
       
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
            border-bottom: 5px solid red;
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
         .btnn{
padding-top:5px;
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
        .item  button:hover {
       
          background-color: lawngreen;
      
        }
        .conDetails{
            margin-left:80px;
            width:90%;
            background-color:red;
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
            margin-left:100px;
        }
        .conDetails2 img{
            width:100px;
            height:80px;
        }

        


        .auto-style1 {
            width: 100px;
        }
        .auto-style2 {
            width: 350px;
            height: 24px;
        }
        .auto-style3 {
            height: 24px;
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
.ii{
   padding-left:100px;
}
        


    </style>

     <div class="con">
        <h1>DISCOVER OUR INTIMA EVENT</h1>
    </div>
    <div class="option">

        <button type="button">Event</button>
    </div>
   
    <div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Event]"></asp:SqlDataSource>
    <asp:DataList ID="Dl1" runat="server" RepeatColumns="4" RepeatDirection="Horizontal"  OnItemCommand="Dl1_ItemCommand">
        <ItemTemplate>

                <div class="item">

                    <img src="<%# Eval("EventImg") %>" /><br />
                    <h3><%# Eval("EventName") %></h3>
                    <br />
                    Time:<%# Eval("EventTime") %><br />Date:<%# Eval("EventDate") %><br />Venue:<%# Eval("EventVenue") %><br /><%# Eval("EventDesc") %><br />
                    <asp:Button ID="btnRead" class="btnn" runat="server" href="#popup1"  CommandName="Read" ToolTip="Read"  CommandArgument='<%# DataBinder.Eval(Container.DataItem,"EventId") %>'/>

                    <asp:HyperLink ID="HyperLink1" class="button1"   href="#popup1" runat="server" CommandName="Read" ToolTip="Read"  CommandArgument='<%# DataBinder.Eval(Container.DataItem,"EventId") %>'>Read</asp:HyperLink>

						
                </div>

        </ItemTemplate>
    </asp:DataList>
        </div>
    	<div id="popup1" class="overlay">
	<div class="popup">
		<h2></h2>
		<a class="close" href="#">&times;</a>

    <div class="conDetails">
        <div class="conDetails2">
            <div class="conDetails3">
                <asp:Image id="lblimage" runat="server" class="ii" Height="400px" Width="600px"  />

                            <br />
                            <table class="maxwi">
                                <tr>
                                    <td class="auto-style1">Title</td>
                                    <td><asp:Label ID="lblName" runat="server"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td class="auto-style1">Time</td>
                                    <td><asp:Label ID="lblTime" runat="server"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td class="auto-style2">Date</td>
                                    <td class="auto-style3"> <asp:Label ID="lblDate" runat="server"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td class="auto-style1">Venue</td>
                                    <td><asp:Label ID="lblVenue" runat="server"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td class="auto-style1">Description</td>
                                    <td><asp:Label ID="lblDes" runat="server"></asp:Label></td>
                                </tr>
             </table>

                           
                            <br />
<%--                            <asp:Label ID="lbllongDes" runat="server"></asp:Label><br />--%>
                </div>
            </div>
    </div>
                    </div>
    </div>
   
</asp:Content>
