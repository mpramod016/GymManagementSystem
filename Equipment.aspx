<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/demo_1/AdminMasterPage.master" AutoEventWireup="true" CodeFile="Equipment.aspx.cs" Inherits="Admin_demo_1_Equipment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="content-wrapper">
       <!-- Page Title Header Starts-->
            <div class="row page-title-header">
              <div class="col-12">
                <div class="page-header">
                  <h4 class="page-title">Equipment</h4>
                  <div class="quick-link-wrapper w-100 d-md-flex flex-md-wrap">
                    <ul class="quick-links">
                      <li><a href="Equipment.aspx">Add Equipment</a></li>
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
                      <p class="card-description"> Equipment info </p>
                      <div class="row">
                        <div class="col-md-6">
                          <div class="form-group row">
                            <label class="col-sm-3 col-form-label">Equipment Id</label><asp:Label ID="lblTrainerId" runat="server" Text="" Visible="false"></asp:Label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtEquipmentId" Display="Dynamic"></asp:RequiredFieldValidator>
                            <div class="col-sm-9">
                              <asp:TextBox ID="txtEquipmentId" runat="server" CssClass="form-control" Enabled="false"></asp:TextBox></div>
                          </div>
                        </div>
                      </div>
                      <div class="row">
                        <div class="col-md-6">
                          <div class="form-group row">
                            <label class="col-sm-3 col-form-label">Name</label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtEquipmentName" Display="Dynamic"></asp:RequiredFieldValidator>
                            <div class="col-sm-9">
                              <asp:TextBox ID="txtEquipmentName" runat="server" placeholder="Enter Equipment Name" CssClass="form-control"></asp:TextBox>
                          </div>
                        </div>
                        </div>
                        <div class="col-md-6">
                          <div class="form-group row">
                            <label class="col-sm-3 col-form-label">Price</label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtEquipmentPrice" Display="Dynamic"></asp:RequiredFieldValidator>
                            <div class="col-sm-9">
                              <asp:TextBox ID="txtEquipmentPrice" runat="server" placeholder="Enter Equipment Price" CssClass="form-control"></asp:TextBox></div>
                          </div>
                        </div>
                      </div>
                      <div class="row">
                        <div class="col-md-6">
                          <div class="form-group row">
                            <label class="col-sm-3 col-form-label">UOM</label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="DropDownList1" Display="Dynamic"></asp:RequiredFieldValidator>
                            <div class="col-sm-9">
                                <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control">
                                      <asp:ListItem>--</asp:ListItem>
                                    <asp:ListItem>KG</asp:ListItem>
                                    <asp:ListItem>LTR</asp:ListItem>
                                </asp:DropDownList>
                          </div>
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
                         <div class="row">
                        <div class="col-md-6">
                          <div class="form-group row">
                            <label class="col-sm-3 col-form-label">Equipment Image</label>
                            <div class="col-sm-9">
                              <asp:FileUpload ID="FileUpload1" runat="server" CssClass="form-control"/>
                          </div>
                        </div>
                      </div>
                      <div class="row">
                        <div class="col-md-6">
                      </div>
                             <div class="col-md-6">
                          <div class="form-group row">
                              <asp:Button ID="Button1" runat="server" Text="Submit" CssClass="btn btn-success mr-2" CausesValidation="true" OnClick="Button1_Click" />
                              <asp:Button ID="Button2" runat="server" Text="Cancel" CssClass="btn btn-light" CausesValidation="false" OnClick="Button2_Click" />
                          </div>
                          </div>
                          </div>
                    </form>
                  </div>
                </div>
              </div>
            </div>
    </div>
</asp:Content>

