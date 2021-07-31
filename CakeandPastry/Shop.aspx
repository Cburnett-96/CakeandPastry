<%@ Page Title="Shop Lists" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Shop.aspx.cs" Inherits="CakeandPastry.Shop" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <!--locator and store1--------------------------------------------------------------------->
    <div class="container">
        <section>
            <h1 class="header">Infanta cake and pastry store list</h1>
            <article class="shope">
                <div class="row">
                    <div class="col-xs-7 col-centered">
                        <asp:Repeater ID="Repeater1" runat="server">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Visible="false" Text='<%#Eval("email")%>'></asp:Label>
                                <asp:Label ID="Label2" runat="server" Visible="false" Text='<%#Eval("shopname")%>'></asp:Label>

                                <div class="card text-white bg-primary" style="max-width: 20rem;">
                                    <div class="card-header">
                                        <li class="shopmenu">
                                            <a class="nav_store" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false"><%#Eval("shopname")%></a>

                                            <asp:Button class="dropdown-item" ID="btnmenu" runat="server" Text="Menu" OnClick="btnmenu_Click" />
                                    </div>
                                    <div class="card-body">
                                        <article>
                                            <img src="../images/<%#Eval("image")%>" alt="Shop" class="responsive">
                                            <br />
                                            <h4 class="header">Shop Location</h4>
                                            <iframe class="embed-responsive" src="<%#Eval("shoplocation")%>" width="400" height="300" style="border: 0;" allowfullscreen="" loading="lazy"></iframe>
                                        </article>
                                    </div>
                                </div>
                                <hr />
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </div>
            </article>
        </section>
    </div>

</asp:Content>
