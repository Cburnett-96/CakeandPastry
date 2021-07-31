<%@ Page Title="Product Menu" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Product Menu.aspx.cs" Inherits="CakeandPastry.Product_Menu" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <div class="container">
        <div class="col-md-12 mx-auto">
            <div class="card">
                <div class="card-body">
                    <div class="row">
                                    <div class="col">
                                        <center>
                           <h3>Product Menu</h3>
                        </center>
                                    </div>
                                </div>
                    <asp:Repeater ID="Repeater1" runat="server">
                        <ItemTemplate>
                            <div class="row">
                                <div class="col-sm-6 col-sm-6 amenities-details">
                                    <img
                                        class="img-fluid w-100"
                                        src="../products/<%#Eval("prdimage")%>"
                                        alt="" />
                                </div>
                                <div class="col-sm-6 col-sm-6">
                                    <asp:Label ID="Label1" runat="server" Visible="false" Text='<%#Eval("id")%>'></asp:Label>
                                    <div class="amenities-details">
                                        <h2>
                                            <a><%#Eval("prdname")%></a>
                                        </h2>
                                            <a class="text-danger"><h4>Price: Php<%#Eval("prdprice")%></h4></a>
                                        <p>
                                            <h3>Description:</h3>
                                            <%#Eval("prddesc")%>
                                        </p>
                                        <a>
                                            <asp:Button ID="btnbuynow" class="btn btn-success" runat="server" Text="Buy Now" OnClick="btnbuynow_Click"  />
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <hr />
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>
        </div>
    </div>
    <br />
</asp:Content>
