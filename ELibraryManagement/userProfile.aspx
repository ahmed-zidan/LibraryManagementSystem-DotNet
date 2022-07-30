<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="userProfile.aspx.cs" Inherits="ELibraryManagement.pages.userProfile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <section>
        <div class="container-fluid">
            <br />

            <div class="row">

                <div class="col-md-5 mx-auto">
                    <div class="card">
                        <div class="card-body">

                            <div class="row">
                                <center>
                                    <div class="col">
                                        <img src="../imgs/man.png" width="100px" />
                                    </div>
                                </center>
                            </div>
                            <div class="row">
                                <center>
                                    <div class="col">
                                        <h5><b>Your Profile</b></h5>
                                    </div>
                                </center>
                            </div>

                            <div class="row">
                                <center>
                                    <div class="col">
                                        <h7>Account Status - <asp:Label ID="lblStatus" Text="Active" class="badge rounded-pill bg-success" runat="server"></asp:Label></h7>
                                    </div>
                                </center>
                            </div>

                            <div class="row">
                                <div class="col">
                                    <hr />
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <h8>Full Name</h8>
                                    <asp:TextBox placeholder="Full Name" ID="txtFullName" class="form-control" runat="server">

                                    </asp:TextBox>
                                </div>

                                <div class="col-md-6">
                                    <h8>Date Of Birth</h8>
                                    <asp:TextBox placeholder="Date Of Birth" TextMode="Date" ID="txtDate" class="form-control" runat="server">

                                    </asp:TextBox>
                                </div>
                            </div>


                            <div class="row mt-2">
                                <div class="col-md-6">
                                    <h8>Contact Number</h8>
                                    <asp:TextBox TextMode="Number" placeholder="Contact number" ID="txtContactNumber" class="form-control" runat="server">

                                    </asp:TextBox>
                                </div>

                                <div class="col-md-6">
                                    <h8>Email ID</h8>
                                    <asp:TextBox placeholder="Email ID" TextMode="Email" ID="txtEmailID" class="form-control" runat="server">

                                    </asp:TextBox>
                                </div>
                            </div>

                            <div class="row mt-2">
                                <div class="col-md-4">
                                    <h8>State</h8>
                                    <asp:DropDownList Width="100%" Height="35px" ID="ddlState" Class="dropdown-toggle form-control"  runat="server">
                                        
                                        <asp:ListItem value="select" Text="select"></asp:ListItem>
                                        <asp:ListItem value="giza" Text="giza"></asp:ListItem>
                                        <asp:ListItem value="cairo" Text="cairo"></asp:ListItem>
                                        <asp:ListItem value="alexandria" Text="alexandria"></asp:ListItem>
                                        <asp:ListItem value="bani suef" Text="bani suef"></asp:ListItem>
                                        

                                    </asp:DropDownList>
                                </div>

                                <div class="col-md-4">
                                    <h8>City</h8>
                                    <asp:TextBox placeholder="City" ID="txtCity" class="form-control" runat="server">

                                    </asp:TextBox>
                                </div>

                                <div class="col-md-4">
                                    <h8>Pin Code</h8>
                                    <asp:TextBox TextMode="Number" placeholder="Pin Code" ID="txtPinCode" class="form-control" runat="server">

                                    </asp:TextBox>
                                </div>

                            </div>

                            <div class="row mt-2">
                                <div class="col">
                                    <h8>Full Address</h8>
                                    <asp:TextBox TextMode="MultiLine" placeholder="Full Address" ID="txtFullAddress" class="form-control" runat="server">

                                    </asp:TextBox>
                                </div>

                            </div>

                            <div class="row mt-3">
                                <center>
                                    <div class="col">
                                        <h7><span class="badge bg-info rounded-pill">Login Credintials</span></h7>
                                    </div>
                                </center>

                            </div>

                            <div class="row mt-2">
                                <div class="col-md-4">
                                    <h7>Member ID</h7>
                                    <asp:TextBox ReadOnly="true" placeholder="Member ID" ID="txtMemberID" class="form-control" runat="server">

                                    </asp:TextBox>
                                </div>

                                <div class="col-md-4">
                                    <h8>Password</h8>
                                    <asp:TextBox ReadOnly="true" placeholder="Password" ID="txtPassword" class="form-control" runat="server">

                                    </asp:TextBox>
                                </div>

                                <div class="col-md-4">
                                    <h7>New Password</h7>
                                    <asp:TextBox TextMode="Password" placeholder="New Password" ID="txtNewPass" class="form-control" runat="server">

                                    </asp:TextBox>
                                </div>

                            </div>

                            <div class="row mt-3">
                                <center>
                                    <div class="col">
                                        <asp:Button Width="60%" Text="Update" CssClass="btn btn-primary" ID="btnUpdate" runat="server" />
                                    </div>
                                </center>
                            </div>


                        </div>
                    </div>



                </div>
                <div class="col-md-7 mx-auto">
                    <div class="card">
                        <div class="card-body">
                            <div class="row">
                                <center>
                                    <div class="col">
                                        <img src="../imgs/books.png" width="100px" />
                                    </div>
                                </center>
                            </div>

                            <div class="row">
                                <center>
                                    <div class="col">
                                        <h4><b>Your Issued Books</b></h4>
                                    </div>
                                </center>
                            </div>

                            <div class="row">
                                <center>
                                    <div class="col">
                                        <h7><span style="font-size:10px" class="badge bg-info rounded-pill">Issued About Book Due To Date</span></h7>
                                    </div>
                                </center>
                            </div>


                            <div class="row">
                                <div class="col">
                                    <hr />
                                </div>
                            </div>

                            <div class="row">
                                <div class="col">
                                    <asp:GridView ID="GridView1" runat="server" class="table table-striped table-hover">
                                        
                                    </asp:GridView>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>

            </div>
            <br />
        </div>
    </section>



</asp:Content>
