<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CakeandPastry._Default" EnableEventValidation="false" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <style>
        /* Make the image fully responsive */
        .carousel-inner img {
            width: 100%;
            height: 100%;
        }
    </style>

    <div class="row">
        <div class=" col-lg-3 myfootershare">
        </div>

        <div class="container">
            <section>
                <article>
                    <h1>
                        <center>Trivia of a day<center>
                    </h1>
                    <h3>
                        <center>Do you Know ? more than 29% of U.S districts have banned bake sales due to anti - obesity regulations.</center>
                    </h3>
                    <center>
                    <div class="col-lg-6">
                        <div id="demo" class="carousel slide" data-ride="carousel">

                            <!-- Indicators -->
                            <ul class="carousel-indicators">
                                <li data-target="#demo" data-slide-to="0" class="active"></li>
                                <li data-target="#demo" data-slide-to="1"></li>
                                <li data-target="#demo" data-slide-to="2"></li>
                            </ul>

                            <!-- The slideshow -->
                            <div class="carousel-inner">
                                <asp:Repeater ID="Repeater_Random" runat="server">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Visible="false" Text='<%#Eval("id")%>'></asp:Label>
                            <asp:Label ID="Label2" runat="server" Visible="false" Text='<%#Eval("shopname")%>'></asp:Label>    
                            <div class="carousel-item">
                                    <img src="../products/<%#Eval("prdimage")%>">
                                <div class="carousel-caption">
                                <h3><%#Eval("prdname")%></h3>
                                    <p><%#Eval("prdprice")%></p>
                                        <asp:Button ID="btnbuynow" class="btn btn-success btn-sm" runat="server" Text="Buy Now" OnClick="btnbuynow_Click"  />
                                    <hr />
                                </div>
                                </div>
                            </ItemTemplate>
                                    </asp:Repeater>
                                <asp:Repeater ID="Repeater_Random1" runat="server">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Visible="false" Text='<%#Eval("id")%>'></asp:Label>
                            <asp:Label ID="Label2" runat="server" Visible="false" Text='<%#Eval("shopname")%>'></asp:Label>    
                            <div class="carousel-item active">
                                    <img src="../products/<%#Eval("prdimage")%>">
                                    <div class="carousel-caption">
                                <h3><%#Eval("prdname")%></h3>
                                    <p><%#Eval("prdprice")%></p>
                                        <asp:Button ID="btnbuynow" class="btn btn-success btn-sm" runat="server" Text="Buy Now" OnClick="btnbuynow_Click"  />
                                        <hr />
                                </div>
                                </div>
                            </ItemTemplate>
                                    </asp:Repeater>
                                <asp:Repeater ID="Repeater_Random2" runat="server">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Visible="false" Text='<%#Eval("id")%>'></asp:Label>
                            <asp:Label ID="Label2" runat="server" Visible="false" Text='<%#Eval("shopname")%>'></asp:Label>    
                            <div class="carousel-item">
                                    <img src="../products/<%#Eval("prdimage")%>">
                                    <div class="carousel-caption">
                                <h3><%#Eval("prdname")%></h3>
                                <p><%#Eval("prdprice")%></p>
                                        <asp:Button ID="btnbuynow" class="btn btn-success btn-sm" runat="server" Text="Buy Now" OnClick="btnbuynow_Click"  />
                                        <hr />
                                 </div>
                                </div>
                            </ItemTemplate>
                                    </asp:Repeater>
                            </div>

                            <!-- Left and right controls -->
                            <a class="carousel-control-prev" href="#demo" data-slide="prev">
                                <span class="carousel-control-prev-icon"></span>
                            </a>
                            <a class="carousel-control-next" href="#demo" data-slide="next">
                                <span class="carousel-control-next-icon"></span>
                            </a>
                        </div>
                    </div>
                        </center>
                </article>
            </section>
        </div>
        <div class="col-lg-3 myfootershare">
        </div>
    </div>
    <br />
    <ul class="nav nav-tabs justify-content-center">
        <li class="nav-item">
            <a class="nav-link active" data-toggle="tab" href="#latestpost">New Products</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" data-toggle="tab" href="#shoplist">Shop List</a>
        </li>
    </ul>
    <div id="myTabContent" class="tab-content">
        <div class="tab-pane fade active show" id="latestpost">
    <div class="container">
        <div class="col-md-12 mx-auto">
            <div class="card">
                <div class="card-body">
                    <div class="row">
                                    <div class="col">
                                        <center>
                           <h3>New Products</h3>
                        </center>
                                    </div>
                                </div>
                    <hr />
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
                                    <asp:Label ID="Label2" runat="server" Visible="false" Text='<%#Eval("shopname")%>'></asp:Label>
                                    <div class="amenities-details">
                                        <h2>
                                            <a><%#Eval("shopname")%></a>
                                        </h2>
                                        <hr />
                                        <h3>
                                            <a><%#Eval("prdname")%></a>
                                        </h3>
                                            <a class="text-danger"><h4>Price: Php<%#Eval("prdprice")%></h4></a>
                                        <p>
                                            <h4>Description:</h4>
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
            </div>
        <div class="tab-pane fade" id="shoplist">
            <div class="container">
        <section>
            <h1 class="header">Infanta cake and pastry store list</h1>
            <article class="shope">
                <div class="row">
                    <div class="col-xs-7 col-centered">
                            <asp:Repeater ID="Repeater2" runat="server">
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Visible="false" Text='<%#Eval("email")%>'></asp:Label>
                                    <asp:Label ID="Label2" runat="server" Visible="false" Text='<%#Eval("shopname")%>'></asp:Label>

                                    <div class="card text-white bg-primary" style="max-width: 20rem;">
                                    <div class="card-header">
                                <li class="shopmenu">
                                    <a class="nav_store" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false"><%#Eval("shopname")%></a>

                                        <asp:Button class="dropdown-item" ID="btnmenu" runat="server" Text="Menu" OnClick="btnmenu_Click"/>

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
            </div>
        </div>
    <br />

    <!-- Top content -->

</asp:Content>
