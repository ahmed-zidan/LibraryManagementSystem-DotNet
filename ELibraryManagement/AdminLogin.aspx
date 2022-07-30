<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AdminLogin.aspx.cs" Inherits="ELibraryManagement.pages.AdminLogin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <section>

        <div class="container">
            <div class="row">
                <div class="col-md-4 mx-auto">
                    <div class="card">
                        <div class="card-body">
                            <div class="row">
                                <div class="col">
                                    <center>
                                        <img src="../imgs/Admin.png" width="120px" />
                                    </center>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <center>
                                        <h3>Admin Login</h3>
                                    </center>
                                </div>
                            </div>
                            <div class="row">
                                <hr />

                            </div>

                            <div class="row">
                                <asp:TextBox ID="txtAdminId"  placeholder="Admin ID" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                            
                            <div style="margin-top:9px" class="row">
                                <asp:TextBox ID="txtPassword" TextMode="Password" placeholder="Password" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>

                            <div style="margin-top:9px" class="row">
                                <asp:Button ID="btnLogin" Text="Login" CssClass="btn btn-success" runat="server" OnClick="btnLogin_Click" />
                            </div>
                        </div>
                    </div>

                </div>
            </div>


        </div>



    </section>



</asp:Content>
