<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/demo_1/AdminMasterPage.master" AutoEventWireup="true" CodeFile="ViewEquipment.aspx.cs" Inherits="Admin_demo_1_ViewEquipment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="content-wrapper">
<div class="row page-title-header">
              <div class="col-12">
                <div class="page-header">
                  <h4 class="page-title">Equipment</h4>
                  <div class="quick-link-wrapper w-100 d-md-flex flex-md-wrap">
                    <ul class="quick-links">
                      <li><a href="ViewPackage.aspx">View Equipment</a></li>
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
                    <h4 class="card-title">Equipment Table</h4>
                    <asp:Repeater ID="RepeaterTeacher" runat="server">
                            <HeaderTemplate>
                                <table class="table table-striped table-responsive">
                                    <thead>
                                        <tr>
                                            <th># </th>
                                            <th>Equipment&nbsp;Image</th>
                                            <th>Equipment&nbsp;Name </th>
                                            <th>Details </th>
                                            <th>Price</th>
                                            <th>UOM</th>
                                            <th>Enter&nbsp;By</th>
                                            <th>Enter&nbsp;On</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr>
                                    <td><%# Eval("EquipmentId")%></td>
                                    <td class="py-1">
                                        <ul class="list-inline">
                                            <li class="list-inline-item">
                                                <img src='data:<%#Eval("ContentType")%>;base64,<%# Eval("Eimage") != System.DBNull.Value ? Convert.ToBase64String((byte[])Eval("Eimage")) : string.Empty %>' alt="" height="50px" width="50px" cssclass="table-avatar" />
                                            </li>
                                        </ul>
                                    </td>
                                    <td><%# Eval("EquipmentName")%></td>
                                    <td><%# Eval("Details")%></td>
                                    <td><%# Eval("Price")%></td>
                                    <td><%# Eval("UOM")%></td>
                                    <td><%# Eval("EnterBy")%></td>
                                    <td><%# Eval("EnterOn")%></td>
                                    <td><a class="btn btn-danger btn-sm" href="DeleteEquipment.aspx?Id=<%#Eval("EquipmentId") %>">
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

