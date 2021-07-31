<%@ Page Title="Shop Order Management" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Shop Manage Order.aspx.cs" Inherits="CakeandPastry.Shop_Manage_Order" EnableEventValidation="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <ul class="nav nav-tabs justify-content-center">
        <li class="nav-item">
            <a class="nav-link active" data-toggle="tab" href="#pending">Pending</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" data-toggle="tab" href="#confirm">Confirmed</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" data-toggle="tab" href="#success">Completed</a>
        </li>
    </ul>
    <div id="myTabContent" class="tab-content">
        <div class="tab-pane fade active show" id="pending">
            <div class="container">
        <section>
            <h2 class="header">Pending Order List</h2>
            <article>
                <asp:Repeater ID="Repeater1" runat="server">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Visible="false" Text='<%#Eval("id")%>'></asp:Label>
                            <div class="row">
                                <div class="col-sm-6 col-sm-6">
                                    <img
                                        class="img-fluid w-100"
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
                                        <h4>Billed To</h4>
                                        <p class="text-justify">
                                            <%#Eval("customername")%><br />
                                            <%#Eval("customeremail")%><br />
                                            <%#Eval("customernumber")%><br />
                                            <%#Eval("customeraddress")%>
                                            </p>
                                        <asp:Button ID="btnconfirm" class="btn btn-danger" runat="server" Text="Order Confirm" OnClick="btnconfirm_Click" />
                                    </div>
                                </div>
                            </div>
                            <br />
                            <hr />
                        </ItemTemplate>
                    </asp:Repeater>
            </article>
        </section>
    </div>
            </div>
        <div class="tab-pane fade" id="confirm">
            <div class="container">
        <section>
            <h2 class="header">Confirmed Order List</h2>
            <article>
                <asp:Repeater ID="Repeater3" runat="server">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Visible="false" Text='<%#Eval("prdname")%>'></asp:Label>
                            <asp:Label ID="Label2" runat="server" Visible="false" Text='<%#Eval("shopname")%>'></asp:Label>
                            <div class="row">
                                <div class="col-sm-6 col-sm-6">
                                    <img
                                        class="img-fluid w-100"
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
                                        <h4>Billed To</h4>
                                        <p class="text-justify">
                                            <%#Eval("customername")%><br />
                                            <%#Eval("customeremail")%><br />
                                            <%#Eval("customernumber")%><br />
                                            <%#Eval("customeraddress")%>
                                            </p>
                                    </div>
                                </div>
                            </div>
                            <br />
                            <hr />
                        </ItemTemplate>
                    </asp:Repeater>
            </article>
        </section>
    </div>
            </div>
        <div class="tab-pane fade" id="success">
            <div class="container">
        <section>
            <h2 class="header">Completed Order List</h2>
            <article>
                <asp:Repeater ID="Repeater2" runat="server">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Visible="false" Text='<%#Eval("prdname")%>'></asp:Label>
                            <asp:Label ID="Label2" runat="server" Visible="false" Text='<%#Eval("shopname")%>'></asp:Label>
                            <div class="row">
                                <div class="col-sm-6 col-sm-6">
                                    <img
                                        class="img-fluid w-100"
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
                                        <h4>Billed To</h4>
                                        <p class="text-justify">
                                            <%#Eval("customername")%><br />
                                            <%#Eval("customeremail")%><br />
                                            <%#Eval("customernumber")%><br />
                                            <%#Eval("customeraddress")%>
                                            </p>
                                    </div>
                                </div>
                            </div>
                            <br />
                            <hr />
                        </ItemTemplate>
                    </asp:Repeater>
            </article>
        </section>
    </div>
            </div>
        </div>

</asp:Content>
