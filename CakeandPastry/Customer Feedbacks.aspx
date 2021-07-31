<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Customer Feedbacks.aspx.cs" Inherits="CakeandPastry.Customer_Feedbacks" %>

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
                           <h3>Customer Feedbacks</h3>
                        </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <asp:Repeater ID="Repeater1" runat="server">
                                    <ItemTemplate>
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
                                                    <p class="text-left">
                                                        <a class="text-primary">Product Name: </a><%#Eval("prdname")%><br />
                                                        <a class="text-primary">Date of Delivered: </a><%#Eval("pickupdate")%><br />
                                                        <a class="text-primary">Date of Order: </a><%#Eval("orderdate")%><br />
                                                    </p>
                                                    <h4>Customer Review</h4>
                                                    <p class="text-left"><a class="text-primary">Satisfaction Level of Product:</a> 
                                            <%#Eval("rating")%><br />
                                            </p>
                                        <p class="text-left"><a class="text-primary">Customer Name:</a> 
                                            <%#Eval("customername")%><br />
                                            </p>
                                                    <p class="text-justify"><a class="text-primary">Feedback:</a> 
                                            <%#Eval("feedbacks")%>
                                            </p>
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
            </div>
        </div>
    </div>
    <br />
</asp:Content>
