<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="PublisherManagement.aspx.cs" Inherits="ELibraryManagement.PublisherManagement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">


     <script type="text/javascript">

        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).DataTable();
        });


    </script>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    
    <section>
        <div class="container">

          
            <div class="row">
               
                <div class="col-md-2">

                </div>

                <div style="border-right:1px solid rgba(0,0,0,0.2);" class="col-md-4 p-4">
                    <div class="row">
                        <center>
                            <div class="col">
                                <h4><b>Publisher Details</b></h4>
                            </div>
                        </center>
                    </div>
                    
                    <div class="row">
                        <center>
                            <div class="col">
                                <img src="imgs/publisher.png" width="100px" />
                            </div>
                        </center>
                    </div>

                    <div class="row mt-2">
                        <hr />
                    </div>

                    <div class="row">
                        <div class="col-md-4">
                            <label>Publisher ID</label>
                              <div class="input-group">
                                    <asp:TextBox Width="50px"  id="txtPublisherId" placeholder="ID" class="form-control" runat="server">

                                    </asp:TextBox>
                                    <asp:Button id="btnGO" Text="GO" class="btn btn-dark" runat="server" OnClick="btnGO_Click" />
                              </div>
                        </div>

                        <div class="col-md-8">

                            <label>Publisher Name</label>
                            <div>
                                <asp:TextBox ID="txtPublisherName" CssClass="form-control" placeholder="name" runat="server">

                                </asp:TextBox>
                                
                            </div>

                        </div>
                    </div>
                    
                    <div class="row mt-4 mb-4">
                        <div class="col-md-4 ">
                            <asp:Button Text="Add" ID="btnAdd" CssClass="btn btn-success w-100" runat="server" OnClick="btnAdd_Click" />
                        </div>
                       
                        <div class="col-md-4">
                            <asp:Button Text="Update" ID="btnUpdate" CssClass="btn btn-primary w-100" runat="server" OnClick="btnUpdate_Click" />
                        </div>

                        <div class="col-md-4">
                            <asp:Button Text="Delete" ID="btnDelete" CssClass="btn btn-danger w-100" runat="server" OnClick="btnDelete_Click" />
                        </div>

                    </div>
                
                    
                    <div class="row mb-2">
                        <a href="../HomePage.aspx">Back To Home</a>
                    </div>
                
                </div>

               

                
                <div class="col-md-5 p-4">
                    
                    <div class="row">
                        <center>
                            <div class="col">
                                <h4><b>Publisher List</b></h4>
                            </div>
                        </center>
                    </div>
                    
                    

                    <div class="row">
                        <hr />
                    </div>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:elibraryDBConnectionString %>" SelectCommand="SELECT * FROM [publisher_master_tbl]"></asp:SqlDataSource>
                    <div class="row mt-4">
                        <div class="col">
                            <asp:GridView ID="GridView1" class="table table-striped table-hover" runat="server" AutoGenerateColumns="False" DataKeyNames="publisher_id" DataSourceID="SqlDataSource1">
                                <Columns>
                                    <asp:BoundField DataField="publisher_id" HeaderText="publisher_id" ReadOnly="True" SortExpression="publisher_id" />
                                    <asp:BoundField DataField="publisher_name" HeaderText="publisher_name" SortExpression="publisher_name" />
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>

                </div>

                <div class="col-md-1">

                </div>



            </div>

       </div>
        
    </section>



</asp:Content>
