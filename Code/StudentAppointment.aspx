<%@ Page Title="" Language="C#" MasterPageFile="~/Code/MasterPage.Master" AutoEventWireup="true" CodeBehind="StudentAppointment.aspx.cs" Inherits="FYPSystem.Code.StudentAppointment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <style>
       
        .con {
            padding-top:150px;
            background-image:url('/image/Event%20backgrounff.jpg');
            height:745px;
           background-repeat: no-repeat;
            background-attachment: fixed;
            background-size: cover;
    
        }
            
        
        .well-block {
    background-color: #fff;
    border: 1px solid #e9e6e8;
    padding: 40px;
        }

        .well-title {
            margin-bottom: 40px;
        }
    </style>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

    <div class="con">
 <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <div class="well-block">
                        <div class="well-title">
                            <h2>Questions? Book an Appointment</h2>
                        </div>
                        <form>
                            <!-- Form start -->
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="control-label" for="name">Preferred Date</label>
                                        <asp:TextBox id="txtDate"   runat="server" textmode="Date" class="form-control input-md"/>

                                    </div>
                                </div>
                                <!-- Text input-->
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="control-label" for="email">Issue Face</label>
                                         <asp:DropDownList ID="ddlissue" runat="server" class="form-control">
                                                <asp:ListItem>General</asp:ListItem>
                                                <asp:ListItem>Mental</asp:ListItem>
                                                <asp:ListItem>Physical</asp:ListItem>

                                            </asp:DropDownList>

                                      
                                    </div>
                                </div>
                                <!-- Text input-->
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="control-label" for="date">Short Description</label>
                                        <asp:TextBox ID="txtDesc" runat="server"  class="form-control input-md" />
                                    </div>
                                </div>
                                <!-- Select Basic -->


                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="control-label" for="time">Preferred Tim Slot</label>
                                            <asp:DropDownList ID="Slotlist" runat="server" class="form-control">
                                                <asp:ListItem>8:00 am - 9.00 am</asp:ListItem>
                                                <asp:ListItem>9:00 am - 10.00 pm</asp:ListItem>
                                                <asp:ListItem>11:00 am - 12.00 pm</asp:ListItem>
                                                <asp:ListItem>2:00 pm - 3.00 pm</asp:ListItem>
                                                <asp:ListItem>3:00 pm - 4.00 pm</asp:ListItem>
                                                <asp:ListItem>4:00 pm - 5.00 pm</asp:ListItem>
                                            </asp:DropDownList>
                                    </div>
                                </div>
                                <!-- Select Basic -->
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label class="control-label" for="appointmentfor">Therapy Method</label>
                                            <asp:DropDownList ID="Methodlist" runat="server" class="form-control">
                                                <asp:ListItem>Face-2-face</asp:ListItem>
                                                <asp:ListItem>Video Therapy</asp:ListItem>
                                            </asp:DropDownList>
                                                                             </div>
                                </div>
                               
                                <!-- Button -->
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <asp:Button ID="btnSubmit" runat="server" name="singlebutton" class="btn btn-default" Text="Make An Appointment" OnClick="btnSubmit_Click"/>
                                    </div>
                                </div>
                                <asp:Label ID="lblStatus" runat="server" />
                            </div>
                        </form>
                        <!-- form end -->
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="well-block">
                        <div class="well-title">
                            <h2>Coming Appointment</h2>

                                    <div class="form-group">
                                        <label class="control-label" for="name">Date</label>
                                        <asp:Label ID="lblDate"  runat="server" datetime="1914-12-20" class="form-control input-md"/>

                                    </div>
                                    <div class="form-group">
                                        <label class="control-label" for="name">Slot</label>
                                        <asp:Label ID="lblSlot"  runat="server" class="form-control input-md"/>

                                    </div>
                                    <div class="form-group">
                                        <label class="control-label" for="name">Status</label>
                                        <asp:Label ID="lblastatus"  runat="server" class="form-control input-md"/>

                                    </div>
                                   <div class="form-group">
                                        <label class="control-label" for="name">Link</label>
                                       <asp:HyperLink ID="lblLink"  runat="server" class="form-control input-md"/>

                                    </div>

                        </div>
                      
                    </div>
                </div>
            </div>
        </div>
        </div>
</asp:Content>