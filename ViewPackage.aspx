<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/demo_1/AdminMasterPage.master" AutoEventWireup="true" CodeFile="ViewPackage.aspx.cs" Inherits="Admin_demo_1_ViewPackage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="content-wrapper">
<div class="row page-title-header">
              <div class="col-12">
                <div class="page-header">
                  <h4 class="page-title">Package</h4>
                  <div class="quick-link-wrapper w-100 d-md-flex flex-md-wrap">
                    <ul class="quick-links">
                      <li><a href="ViewPackage.aspx">View Package</a></li>
                    </ul>
                    <ul class="quick-links ml-auto">
                      <li><a href="../../User/SignIn.aspx">LogOut</a></li>
                    </ul>
                  </div>
                </div>
              </div>
            </div>
            <!-- Page Title Header Ends-->
            <div class="row">
              <div class="col-lg-12 grid-margin stretch-card">
                <div class="card">
                  <div class="card-body">
                    <h4 class="card-title">Package Table</h4>
                    <asp:Repeater ID="RepeaterTeacher" runat="server">
                            <HeaderTemplate>
                                <table class="table table-striped table-responsive">
                                    <thead>
                                        <tr>
                                            <th># </th>
                                            <th>Package&nbsp;Name </th>
                                            <th>Details </th>
                                            <th>Price</th>
                                            <th>Enter&nbsp;By</th>
                                            <th>Enter&nbsp;On</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr>
                                    <td><%# Eval("PackageId")%></td>
                                    <td><%# Eval("PackageName")%></td>
                                    <td><%# Eval("Details")%></td>
                                    <td><%# Eval("PackagePrice")%></td>
                                    <td><%# Eval("EnterBy")%></td>
                                    <td><%# Eval("EnterOn")%></td>
                                     <td><a class="btn btn-danger btn-sm" href="DeletePackage.aspx?Id=<%#Eval("PackageId") %>">
                                                <i class="fas fa-trash"></i>
                                                Delete
                                            </a></td>
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
</asp:Content>

