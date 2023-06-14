<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/demo_1/AdminMasterPage.master" AutoEventWireup="true" CodeFile="Order.aspx.cs" Inherits="Admin_demo_1_Order" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="content-wrapper">
<div class="row page-title-header">
              <div class="col-12">
                <div class="page-header">
                  <h4 class="page-title">Order</h4>
                  <div class="quick-link-wrapper w-100 d-md-flex flex-md-wrap">
                    <ul class="quick-links">
                      <li><a href="ViewPackage.aspx">View Order</a></li>
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
                                            <th>PurchaseID </th>
                                            <th>FirstName </th>
                                            <th>LastName</th>
                                            <th>Phone</th>
                                            <th>Addreess</th>
                                            <th>Postcode</th>
                                            <th>PaymentStatus</th>
                                            <th>EquipmentId</th>
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
                                    <td><%# Eval("FirstName")%></td>
                                    <td><%# Eval("LastName")%></td>
                                    <td><%# Eval("Phone")%></td>
                                    <td><%# Eval("Addreess")%></td>
                                    <td><%# Eval("Postcode")%></td>
                                     <td><%# Eval("PaymentStatus")%></td>
                                    <td><%# Eval("EquipmentId")%></td>
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
</asp:Content>

