<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="MemberMangement.aspx.cs" Inherits="ELibraryManagement.MemberMangement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script type="text/javascript">

        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).DataTable();
        });


    </script>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <section>

        <div class="container-fluid">
            <div class="row">
                <div class="col-md-5">
                    <div class="card">
                        <div class="card-body">
                            <div class="row">
                                <center>
                                    <div class="col">
                                        <h4><b>Member Details</b></h4>
                                    </div>
                                </center>
                            </div>

                            <div class="row">
                                <center>
                                    <div class="col">
                                        <img src="imgs/Member.png" width="100px" />
                                    </div>
                                </center>
                            </div>

                            <div class="row">
                                <div class="col">
                                    <hr />
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-3">
                                    <label>Member ID</label>
                                    <div class="input-group">
                                        <asp:TextBox ID="txtMember" CssClass="form-control" placeholder="ID" runat="server">

                                        </asp:TextBox>
                                        <asp:Button ID="btnGo" Text="GO" CssClass="btn btn-primary" runat="server" OnClick="btnGo_Click" />
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <label>Full Name</label>
                                    <asp:TextBox ReadOnly="true" ID="txtName" CssClass="form-control" placeholder="Full Name" runat="server">

                                    </asp:TextBox>
                                </div>
                                <div class="col-md-5">
                                    <label>Account Status</label>
                                    
                                    <div class="form-group">
                                        <div class="input-group">
                                            <asp:TextBox ReadOnly="true" ID="txtAccount" style="margin-right:3px;" CssClass="form-control d-inline" placeholder="Status" runat="server">

                                            </asp:TextBox>

                                            <asp:LinkButton ID="LinkButton1" style="margin-right:3px;" class="btn btn-success" OnClick="btn_active" runat="server"><i class="fa-solid fa-circle-check"></i></asp:LinkButton>
                                            <asp:LinkButton ID="LinkButton2" style="margin-right:3px;" class="btn btn-warning" OnClick="btn_pending" runat="server"><i class="fa-solid fa-pause-circle"></i></asp:LinkButton>
                                            <asp:LinkButton ID="LinkButton3" style="margin-right:3px;" class="btn btn-danger" OnClick="btn_inactive" runat="server"><i class="fa-solid fa-times-circle"></i></asp:LinkButton>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row mt-3">
                                <div class="col-md-3">
                                    <label>DOB</label>
                                    <asp:TextBox ReadOnly="true" TextMode="Date" ID="txtDOB" CssClass="form-control" placeholder="DOB" runat="server">

                                    </asp:TextBox>
                                    
                                </div>

                                <div class="col-md-4">
                                    <label>Contact Number</label>
                                    <asp:TextBox ReadOnly="true" TextMode="Number" ID="txtContact" CssClass="form-control" placeholder="Contact Number" runat="server">

                                    </asp:TextBox>
                                </div>

                                <div class="col-md-5">
                                    <label>Email ID</label>
                                    <asp:TextBox ReadOnly="true" TextMode="Email" ID="txtEmail" CssClass="form-control" placeholder="ABC@xyz" runat="server">

                                    </asp:TextBox>
                                </div>

                            </div>


                            <div class="row mt-3">
                                <div class="col-md-3">
                                    <label>State</label>
                                    <asp:TextBox ReadOnly="true"  ID="txtState" CssClass="form-control" placeholder="State" runat="server">

                                    </asp:TextBox>
                                    
                                </div>

                                <div class="col-md-4">
                                    <label>City</label>
                                    <asp:TextBox ReadOnly="true" ID="txtCity" CssClass="form-control" placeholder="City" runat="server">

                                    </asp:TextBox>
                                </div>

                                <div class="col-md-5">
                                    <label>Pin Code</label>
                                    <asp:TextBox ReadOnly="true" TextMode="Number" ID="txtPin" CssClass="form-control" placeholder="Pin Code" runat="server">

                                    </asp:TextBox>
                                </div>

                            </div>


                            <div class="row mt-3">
                                <div class="col">
                                    <label>Full Postal Address</label>
                                    <asp:TextBox ReadOnly="true" TextMode="MultiLine" ID="txtFullAddress" CssClass="form-control" placeholder="Full Postal Address" runat="server">

                                    </asp:TextBox>
                                </div>
                            </div>

                            <div class="row mt-4">
                                <div class="col">
                                    <asp:Button ID="btnDelete" Text="Delete User Permanently" CssClass="btn btn-danger" Width="100%" runat="server" OnClick="btnDelete_Click" />
                                </div>
                            </div>


                        </div>
                    </div>


                </div>

                <div class="col-md-7">
                    <div class="card">
                        <div class="card-body">
                            <div class="row">
                                <center>
                                    <div class="col">
                                        <h4><b>Member List</b></h4>
                                    </div>
                                </center>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <hr />
                                </div>
                            </div>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:elibraryDBConnectionString %>" SelectCommand="SELECT * FROM [member_master_tbl]"></asp:SqlDataSource>
                            <div class="row">
                                <div class="col">
                                    <asp:Panel ID="Panel1" runat="server" ScrollBars="Both">
                                    <asp:GridView ID="GridView1" class="table table-striped table-hover" runat="server" AutoGenerateColumns="False" DataKeyNames="member_id" DataSourceID="SqlDataSource1">
                                        <Columns>
                                            <asp:BoundField DataField="full_name" HeaderText="full_name" SortExpression="full_name" />
                                            <asp:BoundField DataField="dob" HeaderText="dob" SortExpression="dob" />
                                            <asp:BoundField DataField="contact_no" HeaderText="contact_no" SortExpression="contact_no" />
                                            <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                                            <asp:BoundField DataField="state" HeaderText="state" SortExpression="state" />
                                            <asp:BoundField DataField="city" HeaderText="city" SortExpression="city" />
                                            <asp:BoundField DataField="pincode" HeaderText="pincode" SortExpression="pincode" />
                                            <asp:BoundField DataField="full_address" HeaderText="full_address" SortExpression="full_address" />
                                            <asp:BoundField DataField="member_id" HeaderText="member_id" ReadOnly="True" SortExpression="member_id" />
                                            <asp:BoundField DataField="password" HeaderText="password" SortExpression="password" />
                                            <asp:BoundField DataField="account_status" HeaderText="account_status" SortExpression="account_status" />
                                        </Columns>
                                    </asp:GridView>
                                    </asp:Panel>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>

            <div class="row mb-3">
                <div class="col">
                    <a href="/HomePage.aspx">Back To Home</a>
                </div>
            </div>

        </div>

    </section>

</asp:Content>
