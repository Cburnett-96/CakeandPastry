<%@ Page Title="User Account Management" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="User Account Management.aspx.cs" Inherits="CakeandPastry.User_Account_Management" ValidateRequest="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <ul class="nav nav-tabs justify-content-center">
        <li class="nav-item">
            <a class="nav-link active" data-toggle="tab" href="#customer">Customer</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" data-toggle="tab" href="#shop">Shop</a>
        </li>
    </ul>
    <div id="myTabContent" class="tab-content">
        <div class="tab-pane fade active show" id="customer">
            <div class="container">
                <div class="row">
                    <div class="col-md-12 mx-auto">
                        <div class="card">
                            <div class="card-body">
                                <h3>Customer Account Lists</h3>
                                <div class="row">
                                    <div class="col">
                                        <label>Customer ID Number:</label>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="txtcusemail" runat="server" placeholder="Customer ID"></asp:TextBox>
                                        </div>
                                        <asp:Button class="btn btn-success" ID="btndelete" runat="server" Text="Delete" OnClick="btndelete_Click"/>
                                        <hr />
                                        <asp:GridView class="table table-hover table-responsive-sm" ID="GridView2" runat="server">
                                            <EditRowStyle Font-Bold="True" HorizontalAlign="Justify" VerticalAlign="Middle" />
                                        </asp:GridView>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            </div>
        <div class="tab-pane fade" id="shop">
            <div class="container">
                <div class="row">
                    <div class="col-md-12 mx-auto">
                        <div class="card">
                            <div class="card-body">
                                <h3>Customer Account Lists</h3>
                                <div class="row">
                                    <div class="col">
                                        <label>Shop ID Number:</label>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="txtshopemail" runat="server" placeholder="Shop ID"></asp:TextBox>
                                        </div>
                                        <asp:Button class="btn btn-success" ID="btnshopdel" runat="server" Text="Delete" OnClick="btnshopdel_Click"/>
                                        <hr />
                                        <label>Update Shop Google Map Location:</label>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="txtlink" runat="server" placeholder="src link" TextMode="Url"></asp:TextBox>
                                        </div>
                                        <asp:Button class="btn btn-info" ID="btnupdate" runat="server" Text="Update Location" OnClick="btnupdate_Click"/>
                                        <hr />
                                        <asp:GridView class="table table-hover table-responsive" ID="GridView1" runat="server">
                                            <EditRowStyle Font-Bold="True" HorizontalAlign="Justify" VerticalAlign="Middle" />
                                        </asp:GridView>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            </div>
        </div>
    <br />
</asp:Content>
