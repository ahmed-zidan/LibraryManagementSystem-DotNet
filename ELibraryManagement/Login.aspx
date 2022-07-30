<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ELibraryManagement.pages.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    

    <section>

        <div class="container">
            <div class="row">
                <div class="col-md-4 mx-auto">
                    <br />
                    <div  class="card">

                        <div class="card-body">

                            <div class="row">
                                <div class="col">
                                    <center>
                                        <img src="../imgs/man.png" width="103px" />
                                    </center>
                                </div>

                            </div>

                            <div class="row">
                                <div class="col">
                                    <Center>
                                        <h4><b>Member Login</b></h4>
                                    </Center>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col">
                                    <hr />
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-12">
                                    <div class="form-group">
                                        <asp:TextBox ID="txtMemberId" required cssclass="form-control" runat="server" placeholder="Member ID">

                                        </asp:TextBox> 
                                    </div>
                                    <br />
                                    <div class="form-group">
                                        <asp:TextBox ID="txtPassword" required TextMode="Password" cssclass="form-control" runat="server" placeholder="Password">

                                        </asp:TextBox> 
                                    </div>

                                </div>
                            </div>

                            <br />
                            <div class ="row">
     
                                <div class="col">
                                    <asp:Button Width="100%" ID="btnLogin" class="btn btn-success" runat="server" Text="Login" OnClick="btnLogin_Click" />
                                </div>
                            </div>
                            <br />

                            <div class ="row">
                                  <a href="SignUp.aspx"><input style="width:100%" id="Button1" type="button" class="btn btn-info" value="SignUp" /></a>
                                
                            </div>

                            <br />
                        </div>

                    </div>
                    <div class="row">
                        <a href="../HomePage.aspx">Back to Home</a>
                    </div>
                    <br />
                </div>
            </div>
        </div>
        
    </section>




</asp:Content>
