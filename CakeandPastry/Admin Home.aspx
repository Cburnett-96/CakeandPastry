<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Admin Home.aspx.cs" Inherits="CakeandPastry.Admin_Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-body">
                        <center>
                        <asp:ImageButton ID="Imagebtnaccount" runat="server" Height="90px" Width="90px" ImageUrl="~/images/management.jpg" OnClick="Imagebtnaccount_Click"/>
                            <h5 class="text-success">Manage User Account</h5>
                        <asp:ImageButton ID="Imagebtnproduct" runat="server" Height="90px" Width="90px" ImageUrl="~/images/ManageProduct.png" OnClick="Imagebtnproduct_Click"/>
                            <h5 class="text-success">Manage Product</h5>
                        <asp:ImageButton ID="Imagebtn" runat="server" Height="90px" Width="90px" ImageUrl="~/images/Feedbacks.png" OnClick="Imagebtn_Click" />
                            <h5 class="text-success">Check Customer Feedbacks</h5>
                            </center>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <hr />

</asp:Content>
