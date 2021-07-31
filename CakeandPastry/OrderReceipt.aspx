<%@ Page Title="Order Receipt" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="OrderReceipt.aspx.cs" Inherits="CakeandPastry.OrderReceipt" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container">
        <section>
            <h2 class="header">Order Receipt</h2>
            <article>
                <asp:Repeater ID="Repeater1" runat="server">
                        <ItemTemplate>
                            <div class="row">
                                <div class="col-sm-6 col-sm-6">
                                    <img
                                        class="img-fluid w-75"
                                        src="../products/<%#Eval("prdimage")%>"
                                        alt="" />
                                </div>
                                <hr />
                                <div class="col-sm-6 col-sm-6">
                                    <div class="card-body card">
                                        <h4>Order Details</h4>
                                        <p class="text-justify">
                                            <a class="text-primary">Product Name: </a><%#Eval("prdname")%><br />
                                            <a class="text-primary">Product ID Number: </a><%#Eval("id")%><br />
                                            <a class="text-primary">Product Price: </a>Php<%#Eval("prdprice")%><br />
                                            <a class="text-primary">Product Quantity: </a><%#Eval("quantity")%><br />
                                            <a class="text-primary">Product Pickup Date/Time: </a><%#Eval("pickupdate")%> / <%#Eval("pickuptime")%><br />
                                            <a class="text-primary">Product Order Status: </a><%#Eval("status")%><br />
                                            <a class="text-primary">Product Total Amount: </a><%#Eval("total")%>
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <br />
                            <div class="row">
                                <div class="col-sm-6 col-sm-6">
                                    <div class="card-body card">
                                    <h4>Billed To</h4>
                                        <p class="text-justify">
                                            <%#Eval("customername")%><br />
                                            <%#Eval("customeremail")%><br />
                                            <%#Eval("customernumber")%><br />
                                            <%#Eval("customeraddress")%>
                                            </p>
                                </div>
                                    </div>
                                <hr />
                                <div class="col-sm-6 col-sm-6">
                                    <div class="card-body card">
                                    <h4>Billed From</h4>
                                        <p class="text-justify">
                                            <%#Eval("shopname")%><br />
                                            <%#Eval("shopcontact")%><br />
                                            <%#Eval("shopaddress")%>
                                            </p>
                                        </div>
                                </div>
                            </div>
                            <hr />
                            <a class="btn btn-success btn-sm" href="Order Status.aspx">Check More Order Status</a>
                            <hr />
                        </ItemTemplate>
                    </asp:Repeater>
            </article>
        </section>
    </div>
    <br />

</asp:Content>
