<%@ Page Title="Product Management" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Shop Product.aspx.cs" Inherits="CakeandPastry.Shop_Home_Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <ul class="nav nav-tabs justify-content-center">
        <li class="nav-item">
            <a class="nav-link active" data-toggle="tab" href="#add">Add Product</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" data-toggle="tab" href="#list">Product List</a>
        </li>
    </ul>
    <div id="myTabContent" class="tab-content">
        <div class="tab-pane fade active show" id="add">
            <div class="container">
                <div class="row">
                    <div class="col-md-12 mx-auto">
                        <div class="card">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col">
                                        <center>
                           <h3>Add Product</h3>
                        </center>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col">
                                        <hr>
                                    </div>
                                </div>
                                <div class="row">

                                    <div class="col">
                                        <label>Product Name:</label>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="prdname" runat="server" placeholder="Product Name"></asp:TextBox>
                                        </div>
                                        <label>Product Description:</label>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="prddesc" runat="server" placeholder="Product Description" TextMode="MultiLine"></asp:TextBox>
                                        </div>
                                        <label>Product Price:</label>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="prdprice" runat="server" placeholder="Product price" TextMode="Number"></asp:TextBox>
                                        </div>
                                        <hr />
                                        <label>Upload Product Cover Image<a class="text-danger">(.png or .jpg image format only)</a></label>
                                        <br />
                                        <asp:FileUpload ID="FileUpload1" runat="server" />
                                        <br />
                                        <asp:Button class="btn btn-success btn-md float-right" ID="btnsubmit" runat="server" Text="Submit" OnClick="btnsubmit_Click" />
                                        <br />
                                        <hr />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="tab-pane fade" id="list">
            <div class="container">
                <div class="row">
                    <div class="col-md-12 mx-auto">
                        <div class="card">
                            <div class="card-body">
                                <h3>My Product Lists</h3>
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
        </div>
    </div>
    <br />
</asp:Content>
