<%@ Page Title="Product Management" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Admin Manage Product.aspx.cs" Inherits="CakeandPastry.Admin_Manage_Order" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <div class="container">
                <div class="row">
                    <div class="col-md-12 mx-auto">
                        <div class="card">
                            <div class="card-body">
                                <h3>Product Lists</h3>
                                <div class="row">
                                    <div class="col">
                                        <label>Product ID:</label>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="txtprdid" runat="server" placeholder="Product ID"></asp:TextBox>
                                        </div>
                                        <asp:Button class="btn btn-success" ID="btndelete" runat="server" Text="Delete" OnClick="btndelete_Click" />
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
    <br />

</asp:Content>
