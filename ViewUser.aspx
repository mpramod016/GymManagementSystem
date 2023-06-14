<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/demo_1/AdminMasterPage.master" AutoEventWireup="true" CodeFile="ViewUser.aspx.cs" Inherits="Admin_demo_1_ViewUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="content-wrapper">
        <div class="row page-title-header">
            <div class="col-12">
                <div class="page-header">
                    <h4 class="page-title">User</h4>
                    <div class="quick-link-wrapper w-100 d-md-flex flex-md-wrap">
                        <ul class="quick-links">
                            <li><a href="ViewUser.aspx">View User</a></li>
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
                        <h4 class="card-title">User Table</h4>
                        <asp:Repeater ID="RepeaterTeacher" runat="server">
                            <HeaderTemplate>
                                <table class="table table-striped table-responsive">
                                    <thead>
                                        <tr>
                                            <th># </th>
                                            <th>User&nbsp;Image</th>
                                            <th>Name </th>
                                            <th>Email </th>
                                            <th>Phone&nbsp;Number </th>
                                            <th>Gender</th>
                                            <th>DOB</th>
                                            <th>Enter&nbsp;By</th>
                                            <th>Enter&nbsp;On</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr>
                                    <td><%# Eval("Id")%></td>
                                    <td class="py-1">
                                        <ul class="list-inline">
                                            <li class="list-inline-item">
                                                <img src='data:<%#Eval("ContentType")%>;base64,<%# Eval("UImage") != System.DBNull.Value ? Convert.ToBase64String((byte[])Eval("UImage")) : string.Empty %>' alt="" height="50px" width="50px" cssclass="table-avatar" />
                                            </li>
                                        </ul>
                                    </td>
                                    <td><%# Eval("Name")%></td>
                                    <td><%# Eval("Email")%></td>
                                    <td><%# Eval("PhoneNumber")%></td>
                                     <td><%# Eval("Gender")%></td>
                                    <td><%# Eval("DOB")%></td>
                                    <td><%# Eval("EnterBy")%></td>
                                    <td><%# Eval("EnterOn")%></td>
                                     <td><a class="btn btn-danger btn-sm" href="DeleteUser.aspx?Id=<%#Eval("Id") %>">
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

