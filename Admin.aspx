<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/demo_1/AdminMasterPage.master" AutoEventWireup="true" CodeFile="Admin.aspx.cs" Inherits="Admin_Admin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="content-wrapper">
        <!-- Page Title Header Starts-->
        <div class="row page-title-header">
            <div class="col-12">
                <div class="page-header">
                    <h4 class="page-title">Dashboard</h4>
                    <div class="quick-link-wrapper w-100 d-md-flex flex-md-wrap">
                        <ul class="quick-links">
                            <li><a href="Member.aspx">New Member</a></li>
                            <li><a href="Trainer.aspx">New Trainer</a></li>
                            <li><a href="Package.aspx">New Package</a></li>
                        </ul>
                        <ul class="quick-links ml-auto">
                            <li><a href="User.aspx">Create User</a></li>
                            <li><a href="../../User/SignIn.aspx">LogOut</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <!-- Page Title Header Ends-->
        <div class="row">
            <div class="col-md-12 grid-margin">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-lg-3 col-md-6">
                                <div class="d-flex">
                                    <div class="wrapper">
                                        <h3 class="mb-0 font-weight-semibold"><asp:Label ID="lblMember" runat="server" Text="0"></asp:Label></h3>
                                        <h5 class="mb-0 font-weight-medium text-primary">Member</h5>
                                    </div>
                                    <div class="wrapper my-auto ml-auto ml-lg-4">
                                        <img height="100" width="100" src="../assets/images/conference-512.png"></img>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-6 mt-md-0 mt-4">
                                <div class="d-flex">
                                    <div class="wrapper">
                                        <h3 class="mb-0 font-weight-semibold"><asp:Label ID="lblTrainer" runat="server" Text="0"></asp:Label></h3>
                                        <h5 class="mb-0 font-weight-medium text-primary">Trainer</h5>
                                    </div>
                                    <div class="wrapper my-auto ml-auto ml-lg-4">
                                        <img height="100" width="100" src="../assets/images/trainers-512.png"></img>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-6 mt-md-0 mt-4">
                                <div class="d-flex">
                                    <div class="wrapper">
                                        <h3 class="mb-0 font-weight-semibold"><asp:Label ID="lblPackage" runat="server" Text="0"></asp:Label></h3>
                                        <h5 class="mb-0 font-weight-medium text-primary">Package</h5>
                                    </div>
                                    <div class="wrapper my-auto ml-auto ml-lg-4">
                                        <img height="100" width="100" src="../assets/images/package-512.png"></img>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-6 mt-md-0 mt-4">
                                <div class="d-flex">
                                    <div class="wrapper">
                                        <h3 class="mb-0 font-weight-semibold"><asp:Label ID="lblEquipment" runat="server" Text="0"></asp:Label></h3>
                                        <h5 class="mb-0 font-weight-medium text-primary">Equipment</h5>
                                    </div>
                                    <div class="wrapper my-auto ml-auto ml-lg-4">
                                        <img height="100" width="100" src="../assets/images/settings-5-512.png"></img>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="row">
                    <div class="col-lg-4 col-md-3 col-sm-6 grid-margin stretch-card">
                        <div class="card card-statistics bg-orange-gradient">
                            <div class="card-body">
                                <div class="clearfix">
                                    <div class="float-left">
                                        <i class="mdi mdi-receipt icon-lg"></i>
                                    </div>
                                    <div class="float-right">
                                        <p class="mb-0 text-right text-white">Orders</p>
                                        <div class="fluid-container">
                                            <h3 class="font-weight-medium text-right mb-0"><asp:Label ID="lblOrders" runat="server" Text="0"></asp:Label></h3>
                                        </div>
                                    </div>
                                </div>
                                <p class="mt-3 mb-0 text-white">
                                    <i class="mdi mdi-bookmark-outline mr-1" aria-hidden="true"></i>Product-wise sales
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 grid-margin stretch-card">
                            <div class="card">
                                <div class="card-body">
                                    <h4 class="card-title">Order Table</h4>
                                    <asp:Repeater ID="RepeaterTeacher" runat="server">
                                        <HeaderTemplate>
                                            <table class="table table-striped table-responsive">
                                                <thead>
                                                    <tr>
                                                        <th>PurchaseID </th>
                                                        <th>PaymentStatus</th>
                                                        <th>TotalPayed</th>
                                                        <th>PurchaseDate</th>
                                                        <th>UserId</th>
                                                        <th>UserName</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <tr>
                                                <td><%# Eval("PurchaseID")%></td>
                                                <td><%# Eval("PaymentStatus")%></td>
                                                <td><%# Eval("TotalPayed")%></td>
                                                <td><%# Eval("PurchaseDate")%></td>
                                                <td><%# Eval("UserId")%></td>
                                                <td><%# Eval("UserName")%></td>
                                            </tr>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            </tbody>
                            </table>
                                        </FooterTemplate>
                                    </asp:Repeater>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>

        </div>
    </div>
</asp:Content>

