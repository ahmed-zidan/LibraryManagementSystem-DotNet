<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="ELibraryManagement.pages.SignUp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <section>

        <div class="container">
            <div class="row">
                <div class="col-md-6 mx-auto">
                    <br />
                    <div class="card">
                        <div class="card-body">
                            <div class="row">
                                <div class="col">
                                    <center>
                                        <img src="../imgs/man.png" width="100px" />
                                    </center>
                                </div>

                            </div>

                            <div class="row">
                                <div class="col">
                                    <center>
                                        <h3>User Registeration</h3>
                                    </center>
                                </div>
                            </div>
                            <div class="row">
                                <hr />
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <label>Full Name</label>
                                </div>
                                <div class="col-md-6">
                                    <label>Date Of Birth</label>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <asp:TextBox  ID="txtFullName" placeholder="Full Name" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                                <div class="col-md-6">
                                    <asp:TextBox  ID="txtDateOfBirth" TextMode="Date" placeholder="Date Of Birth" CssClass="form-control"
                                        runat="server"></asp:TextBox>
                                </div>

                            </div>

                            <div style="margin-top:10px" class="row">
                                <div class="col-md-6">
                                    <label>Contact Number</label>
                                </div>

                                <div  class="col-md-6">
                                    <label>Email ID</label>
                                </div>

                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <asp:TextBox ID="txtContactNumber" TextMode="Number" CssClass="form-control" placeholder="Contact Number"
                                        runat="server"></asp:TextBox>
                                </div>

                                <div class="col-md-6">
                                    <asp:TextBox ID="txtEmailID" TextMode="Email" CssClass="form-control" placeholder="Email ID"
                                        runat="server"></asp:TextBox>
                                </div>

                            </div>

                            <div style="margin-top:10px;" class="row">
                                <div class="col-md-4">
                                    <label>State</label>
                                </div>
                                <div class="col-md-4">
                                    <label>City</label>
                                </div>
                                <div class="col-md-4">
                                    <label>Pin Code</label>
                                </div>

                            </div>

                            <div class="row">
                                <div class="col-md-4">
                                    
                                    <asp:DropDownList Width="100%" Height="35px" ID="ddlState" class="form-select"  runat="server">
                                        
                                        <asp:ListItem value="select" Text="select"></asp:ListItem>
                                        <asp:ListItem value="giza" Text="giza"></asp:ListItem>
                                        <asp:ListItem value="cairo" Text="cairo"></asp:ListItem>
                                        <asp:ListItem value="alexandria" Text="alexandria"></asp:ListItem>
                                        <asp:ListItem value="bani suef" Text="bani suef"></asp:ListItem>
                                        

                                    </asp:DropDownList>
                                        
                                </div>
                                <div class="col-md-4">
                                    <asp:TextBox ID="txtCity" CssClass="form-control" placeholder="City"
                                        runat="server"></asp:TextBox>
                                </div>
                                <div class="col-md-4">
                                    <asp:TextBox ID="txtPinCode" TextMode="Number" CssClass="form-control" placeholder="Pin Code"
                                        runat="server"></asp:TextBox>
                                </div>

                            </div>

                            <div style="margin-top:10px;" class="row">
                                <div class="col">
                                    <label>Full Address</label>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col">
                                    <asp:textbox TextMode="MultiLine" style="padding:0 0 30px 2px;" ID="txtFullAddress" placeholder="Full Address..." CssClass="form-control" runat="server">

                                    </asp:textbox>
                                </div>
                            </div>


                            <div style="margin:10px 0" class="row">
                                <center>
                                    <p style="background-color:aqua; border-radius:30px; width:fit-content; padding:5px; font-size:10px"><b>Login Credintials</b></p>
                                </center>
                            </div>

                            <div class="row">

                                <div class="col-md-6">
                                    <label>User ID</label>
                                </div>
                                <div class="col-md-6">
                                    <label>Password</label>
                                </div>

                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <asp:TextBox ID="txtUserID" CssClass="form-control" placeholder="User ID" runat="server">
                                    </asp:TextBox>
                                </div>
                                <div class="col-md-6">
                                    <asp:TextBox ID="txtPassowrd" TextMode="Password" CssClass="form-control" placeholder="Password" runat="server">

                                    </asp:TextBox>
                                </div>


                            </div>

                            <div style="margin-top:10px;" class="row">
                                <div class="col">
                                    <asp:Button ID="btnSignUp"  Width="100%" Text="Sign Up" CssClass="btn btn-success"  runat="server" OnClick="btnSignUp_Click"/>
                                </div>
                            </div>

                        </div>

                    </div>
                    <div class="row">
                        <a href="../HomePage.aspx">Back To Home</a>
                    </div>
                    <br />
                </div>

                

            </div>

        </div>


    </section>


</asp:Content>
