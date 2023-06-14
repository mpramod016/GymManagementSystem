<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/demo_1/AdminMasterPage.master" AutoEventWireup="true" CodeFile="Package.aspx.cs" Inherits="Admin_demo_1_Package" EnableEventValidation="false" ValidateRequest="false"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   <div class="content-wrapper">
       <!-- Page Title Header Starts-->
            <div class="row page-title-header">
              <div class="col-12">
                <div class="page-header">
                  <h4 class="page-title">Package</h4>
                  <div class="quick-link-wrapper w-100 d-md-flex flex-md-wrap">
                    <ul class="quick-links">
                      <li><a href="Package.aspx">Add Package</a></li>
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
            <div class="col-12 grid-margin">
                <div class="card">
                  <div class="card-body">
                    <form class="form-sample">
                      <p class="card-description"> Package info </p>
                      <div class="row">
                        <div class="col-md-6">
                          <div class="form-group row">
                            <label class="col-sm-3 col-form-label">Package Id</label><asp:Label ID="lblTrainerId" runat="server" Text="" Visible="false"></asp:Label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtPackageId" Display="Dynamic"></asp:RequiredFieldValidator>
                            <div class="col-sm-9">
                              <asp:TextBox ID="txtPackageId" runat="server" CssClass="form-control"></asp:TextBox></div>
                          </div>
                        </div>
                      </div>
                      <div class="row">
                        <div class="col-md-6">
                          <div class="form-group row">
                            <label class="col-sm-3 col-form-label">Package Name</label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtPackageName" Display="Dynamic"></asp:RequiredFieldValidator>
                            <div class="col-sm-9">
                              <asp:TextBox ID="txtPackageName" runat="server" placeholder="Enter Package Name" CssClass="form-control"></asp:TextBox>
                          </div>
                        </div>
                        </div>
                        <div class="col-md-6">
                          <div class="form-group row">
                            <label class="col-sm-3 col-form-label">Package Price</label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtPackagePrice" Display="Dynamic"></asp:RequiredFieldValidator>
                            <div class="col-sm-9">
                              <asp:TextBox ID="txtPackagePrice" runat="server" placeholder="Enter Package Price" CssClass="form-control"></asp:TextBox></div>
                          </div>
                        </div>
                      </div>
                      <div class="row">
                        <div class="col-md-6">
                          <div class="form-group row">
                            <label class="col-sm-3 col-form-label">Details</label>
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtDetails" Display="Dynamic"></asp:RequiredFieldValidator>
                            <div class="col-sm-9">
                              <asp:TextBox ID="txtDetails" runat="server" placeholder="Enter Details" TextMode="MultiLine" Rows="3" CssClass="form-control"></asp:TextBox></div>
                          </div>
                          </div>
                        </div>
                      </div>
                      <div class="row">
                        <div class="col-md-6">
                      </div>
                             <div class="col-md-6">
                          <div class="form-group row">
                              <asp:Button ID="Button1" runat="server" Text="Submit" CssClass="btn btn-success mr-2" CausesValidation="true" OnClick="Button1_Click"/>
                              <asp:Button ID="Button2" runat="server" Text="Cancel" CssClass="btn btn-light" CausesValidation="false" OnClick="Button2_Click"/>
                          </div>
                          </div>
                          </div>
                    </form>
                  </div>
                </div>
              </div>
            </div>
</asp:Content>

