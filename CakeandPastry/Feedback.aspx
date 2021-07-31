<%@ Page Title="Customer Feedback" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Feedback.aspx.cs" Inherits="CakeandPastry.Feedback" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container">
        <div class="row">
            <div class="col-md-12 mx-auto">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                           <h3>Product Feedback</h3>
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
                                                    <p class="text-justify">
                                                        <a class="text-primary">Product Name: </a><%#Eval("prdname")%><br />
                                                        <a class="text-primary">Product Price: </a>Php<%#Eval("prdprice")%><br />
                                                        <a class="text-primary">Product Quantity: </a><%#Eval("quantity")%><br />
                                                        <a class="text-primary">Product Total Amount: </a><%#Eval("total")%>
                                                    </p>
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
                                    </ItemTemplate>
                                </asp:Repeater>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <h3>Feedback Form</h3>
                                <hr>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <label>Write your feedback of Product:</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txtfeedback" runat="server" placeholder="Write your feedback here" TextMode="MultiLine"></asp:TextBox>
                                </div>
                                <label>Satisfaction Level of Product:</label>
                                <div class="form-group">
                                    <asp:RadioButtonList ID="RadioButtonListRating" runat="server">
                                        <asp:ListItem>Highly Dissatisfied</asp:ListItem>
                                        <asp:ListItem>Dissatisfied</asp:ListItem>
                                        <asp:ListItem>Neutral</asp:ListItem>
                                        <asp:ListItem>Satisfied</asp:ListItem>
                                        <asp:ListItem>Highly Satisfied</asp:ListItem>
                                    </asp:RadioButtonList>
                                </div>
                                <asp:Button ID="btnfeedback" class="btn btn-primary" runat="server" Text="Submit" OnClick="btnfeedback_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
