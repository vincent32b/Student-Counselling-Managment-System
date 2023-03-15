<%@ Page Title="" Language="C#" MasterPageFile="~/Code/MasterPage.Master" AutoEventWireup="true" CodeBehind="StudentHome.aspx.cs" Inherits="FYPSystem.Code.StudentHome" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <style>
         .image img{
             margin-top:0px;
            width:88%;
            height:100%;
             box-sizing:border-box;
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-size: cover;
              padding-left:150px;
     
        }
      /*   h1{
             width:1000px;
             height:500px;
             margin-top:-500px;
             font-size:30px;
             padding-left:100px;
             
         }*/
         .container .btn {
          position: absolute;
          top: 58%;
          left: 19.5%;
          transform: translate(-50%, -50%);
          -ms-transform: translate(-50%, -50%);
         background-color: red;
          color: white;
          font-size: 16px;
          padding: 12px 24px;
          border: none;
          cursor: pointer;
          border-radius: 5px;
          text-align: center;
        }
         .btnStart{
             margin-top:20px;
             width:20%;
             left: 50%;
                transform: translate(-50%, -50%);
          -ms-transform: translate(-50%, -50%);
          position: absolute;
               background-color: red;
          color: white;
          font-size: 16px;
          padding: 12px 24px;
          border: none;
          cursor: pointer;
          border-radius: 5px;
          text-align: center;
         }
         .btnStart:hover{
              background-color: lawngreen;
         }
         .container .btn:hover {
          background-color: lawngreen;
        }
        .FeaturesContainer {
            text-align: center;
            width: 88%;
            font-size:30px;
           margin-left:100px;
            margin-bottom:10px;
            color: white;
            background-color: red;
            border-radius: 5px;
        }
        .VideoContainer {
            text-align: center;
            width: 88%;
              margin-left:100px;
            border-radius: 5px;
            background-color:floralwhite;
            padding-top:20px;
            margin-bottom :20px;
        }
        .VideoContainer p
        {
            color:dimgray;

        }   
        .VideoContainer k{
             font-size: 30px;
        }
        .column{
            float: left;
          width: 47%;
          padding: 70px;
          height: 300px;
             border-radius: 100px;
            box-sizing: border-box;
            margin:20px;
            background-color:white;
            text-align:left;
        }
                .column1{
            float: left;
          width: 47%;
          padding: 10px;
          height: 400px;
            box-sizing: border-box;
            margin:20px;
       
            text-align:left;
        }
       .column2{
            float: left;
          width: 47%;
          padding-top: 80px;
          height: 400px;
            box-sizing: border-box;
            margin:20px;
       
            text-align:left;
        }
        .VideoContainer:after {
          content: "";
          display: table;
          clear: both;
            box-sizing: border-box;

        }
        .VideoContainer img{
           padding-left:55px;
        }
        hh{
          
               font-size:25px;
           
        }
/*        p1{
        
            font-size:25px;
            color:dimgray;
        }*/


        
 
        </style>


  
     <div class="image">
                <img src="../image/background9.jpg"  />
         
            </div>
    <div class="container">
        
    <a href="StudentAppointment.aspx" class="btn">FIND OUT MORE --></a>    </div>
    <div class="FeaturesContainer">
        Our Features  
    </div>
    <div class="VideoContainer">
       <k> Video Therapy</k>
        <p> Connect with you anywhere, anytime </p>
        <div class="column">
            <hh>Make a Connection with US<br /></hh>
            <p>Video Therapy can be a great complement to the in-person sessions you already do in your practice<br /></p>
            
            <hh><br />A Secure Solution<br /></hh>
            <p>The video feature is secure and private, running exclusively via INTI Counselling System </p>
        </div>
        <div class="column1" >
           <img src="../image/videomeet.png"  width="600"/>
        </div>

    </div>
    
     <div class="VideoContainer">
       <k> Make Appoinment</k>
        <p> Book a timeslot for private Video Therapy </p>
        <div class="column">
            <hh>Book a time for us to meet up!<br /></hh>
            <p>Video Therapy can be a great complement to the in-person sessions you already do in your practice<br /></p>
            
            <hh><br />Talk to us virtually<br /></hh>
            <p>You can now talk to us without the need of visiting physical counselling center </p>
        </div>
        <div class="column1">
             <img src="../image/apphome.png"  width="600"/>
        </div>

    </div>
     <div class="VideoContainer">
       <k> Therapy Process</k>
        <p>Take a chance to test your Academic Performance </p>
        
        <div class="column2">
          <img src="../image/processs.png" width="600"/>
        </div>
        <div class="column">
            <hh>Predict yourself<br /></hh>
            <p>A chance for you to do a prediction for yourself based on your academic performance with an accurancy of 89%<br /></p>
            
            <hh><br />Find out Prediction result<br /></hh>
            <p>You can now know your academic performance instantly but keep track on studying! </p>
        </div>
          
    </div>
    <a class="btnStart" href="StudentAppointment.aspx"> Get Started</a>
   


    
</asp:Content>
