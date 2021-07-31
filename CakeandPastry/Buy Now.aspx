<%@ Page Title="Buy Now" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Buy Now.aspx.cs" Inherits="CakeandPastry.Buy_Now" EnableEventValidation="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <br />
            <div class="container">
                <div class="row">
                    <div class="col-md-12 mx-auto">
                        <div class="card">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col">
                                        <center>
                           <h3>Order your Product</h3>
                        </center>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col">
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
                                    </div>
                                </div>
                            </div>
                            <hr />
                        </ItemTemplate>
                    </asp:Repeater>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col">
                                        <h3>Order Form</h3>
                                        <hr>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col">
                                        <label>Quantity:</label>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="txtqty" runat="server" placeholder="Quantity" TextMode="Number"></asp:TextBox>
                                        </div>
                                        <label>Full Address:</label>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="txtadd" runat="server" placeholder="Full Address"></asp:TextBox>
                                        </div>
                                        <label>Active Phone Number:</label>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="txtcpnum" runat="server" placeholder="Active Phone Number" TextMode="Number"></asp:TextBox>
                                        </div>
                                        <label>Order Date</label>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control-sm" ID="txtorderdate" runat="server" placeholder="Date Now" TextMode="Date"></asp:TextBox>
                                        </div>
                                        <label>Pick-up Date and Time:</label>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control-sm" ID="txtpickupdate" runat="server" placeholder="Pick-up Date" TextMode="Date"></asp:TextBox>
                                            <asp:TextBox CssClass="form-control-sm" ID="txtpickuptime" runat="server" placeholder="Pick-up Time" TextMode="Time"></asp:TextBox>
                                        </div>
                                        <asp:Button ID="btnbuynow" class="btn btn-info" runat="server" Text="Buy Now!" OnClick="btnbuynow_Click" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
</asp:Content>
