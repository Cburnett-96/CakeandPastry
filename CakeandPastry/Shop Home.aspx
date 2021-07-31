<%@ Page Title="Shop Home" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Shop Home.aspx.cs" Inherits="CakeandPastry.Shop_Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <div class="container">
        <div class="row">
            <div class="col-md-12 mx-auto">
                <asp:Repeater ID="Repeater1" runat="server">
                    <ItemTemplate>
                        <center>
                    <img src="../images/<%#Eval("image")%>" width="90" height="90" />
                            <p><%#Eval("shopname")%></p>
                </center>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-body">
                        <center>
                        <asp:ImageButton ID="ImageButton2" runat="server" Height="90px" Width="90px" ImageUrl="~/images/ManageProduct.png" OnClick="ImageButton2_Click"/>
                            <h5 class="text-success">Manage Product</h5>
                        <asp:ImageButton ID="ImageButton1" runat="server" Height="90px" Width="90px" ImageUrl="~/images/ManageOrder.png" OnClick="ImageButton1_Click"/>
                            <h5 class="text-success">Manage Order</h5>
                        <asp:ImageButton ID="ImageButton3" runat="server" Height="90px" Width="90px" ImageUrl="~/images/Feedbacks.png" OnClick="ImageButton3_Click"/>
                            <h5 class="text-success">Check Customer Feedbacks</h5>
                            </center>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <hr />
</asp:Content>
