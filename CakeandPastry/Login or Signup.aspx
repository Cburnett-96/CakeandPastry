<%@ Page Title="Customer Login or Signup" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login or Signup.aspx.cs" Inherits="CakeandPastry.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <ul class="nav nav-tabs justify-content-center">
        <li class="nav-item">
            <a class="nav-link active" data-toggle="tab" href="#login">Login</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" data-toggle="tab" href="#signup">Sign Up</a>
        </li>
    </ul>
    <div id="myTabContent" class="tab-content">
        <div class="tab-pane fade active show" id="login">
            <br />
            <div class="container">
                <div class="row">
                    <div class="col-md-12 mx-auto">
                        <div class="card">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col">
                                        <center>
                           <h3>Customer Login</h3>
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
                                        <label>Email Address:</label>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="email" runat="server" placeholder="Email Address"></asp:TextBox>
                                        </div>
                                        <label>Password</label>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="password" runat="server" placeholder="Password" TextMode="Password"></asp:TextBox>
                                        </div>
                                        <asp:Button class="btn btn-success btn-lg" ID="btnlogin" runat="server" Text="Login" OnClick="loginbtn_Click"/>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="tab-pane fade" id="signup">
            <br />
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-body">
                                <div class="alert alert-dismissible alert-success">
                                    <button type="button" class="close" data-dismiss="alert">&times;</button>
                                    <strong>Please fill this form to create an account.</strong>
                                </div>
                                <div class="row">
                                    <div class="col">
                                        <center>
                           <h4>Create your Profile</h4>
                        </center>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col">
                                        <hr>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <label>Full Name</label>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="txtname" runat="server" placeholder="First/Middle/Last Name"></asp:TextBox>
                                            <label>Email Address</label>
                                            <asp:TextBox CssClass="form-control" ID="txtemail" runat="server" placeholder="Email Address" TextMode="Email"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <label>New Password</label>
                                        <asp:TextBox class="form-control" ID="passwordsignup" runat="server" placeholder="New Password" TextMode="Password"></asp:TextBox>
                                        <label>Confirm New Password</label>
                                        <asp:TextBox class="form-control" ID="confirmpassword" runat="server" placeholder="Confirm New Password" TextMode="Password"></asp:TextBox>
                                        <asp:CompareValidator CssClass="btn btn-link text-danger" ID="CompareValidator1" runat="server" ErrorMessage="Password Not Match!" ControlToCompare="passwordsignup" ControlToValidate="confirmpassword"> </asp:CompareValidator>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12 mx-auto">
                                    <center>
                           <div class="form-group">
                               <asp:Button class="btn btn-info btn-lg" ID="btnsignup" runat="server" Text="Sign Up" OnClick="btnsignup_Click"/>
                           </div>
                        </center>
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
