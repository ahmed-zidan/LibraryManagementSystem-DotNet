<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ViewBook.aspx.cs" Inherits="ELibraryManagement.ViewBook" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script type="text/javascript">

        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).DataTable();
        });


    </script>



</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <section>
        <div class="container mt-3 mb-3">
            <div class="row">
                <center>
                    <div class="col">
                       <h4><b>Book Inventory List</b></h4>
                    </div>
                </center>
            </div>



            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:elibraryDBConnectionString %>" SelectCommand="SELECT * FROM [book_master_tbl]"></asp:SqlDataSource>
            <div class ="row">
                <div class="col">
                    <asp:GridView ID="GridView1" class="table table-striped table-hover" runat="server" AutoGenerateColumns="False" DataKeyNames="book_id" DataSourceID="SqlDataSource1">
                        <Columns>
                            <asp:BoundField DataField="book_id" HeaderText="book_id" ReadOnly="True" SortExpression="book_id" />
                            
                            <asp:TemplateField>
                                <ItemTemplate>

                                    <div class="container-fluid">
                                        <div class="row">
                                            <div class="col-lg-10">
                                                <div class="row">
                                                    <div class="col">
                                                        <asp:Label ID="title" class="Book-inventory-title" runat="server" Text='<%# Eval("book_name") %>'></asp:Label>
                                                    </div>

                                                </div>
                                                <div class="row">
                                                    <div class="col">
                                                        <span>Auther - </span>
                                                        <asp:Label ID="Label1" class="Book-inventory-label" runat="server" Text='<%# Eval("author_name") %>'></asp:Label>
                                                   
                                                        <span> | </span>
                                                         <span>Genre - </span>
                                                        <asp:Label ID="Label2" class="Book-inventory-label" runat="server" Text='<%# Eval("genre") %>'></asp:Label>
                                                   

                                                    </div>
                                                </div>

                                                <div class="row">
                                                    <div class="col">
                                                        <span>Language - </span>
                                                        <asp:Label ID="Label3" class="Book-inventory-label" runat="server" Text='<%# Eval("language") %>'></asp:Label>
                                                   
                                                        <span> | </span>
                                                         <span>Edition - </span>
                                                        <asp:Label ID="Label4" class="Book-inventory-label" runat="server" Text='<%# Eval("edition") %>'></asp:Label>
                                                   
                                                        <span> | </span>
                                                        <span>Pages - </span>
                                                        <asp:Label ID="Label5" class="Book-inventory-label" runat="server" Text='<%# Eval("no_of_pages") %>'></asp:Label>

                                                    </div>
                                                </div>

                                                <div class="row">
                                                    <div class="col">
                                                        <span>Cost - </span>
                                                        <asp:Label ID="Label6" class="Book-inventory-label" runat="server" Text='<%# Eval("book_cost") %>'></asp:Label>
                                                   
                                                        <span> | </span>
                                                         <span>Actual Stock - </span>
                                                        <asp:Label ID="Label7" class="Book-inventory-label" runat="server" Text='<%# Eval("actual_cost") %>'></asp:Label>
                                                   
                                                        <span> | </span>
                                                        <span>Available - </span>
                                                        <asp:Label ID="Label8" class="Book-inventory-label" runat="server" Text='<%# Eval("current_stock") %>'></asp:Label>


                                                    </div>
                                                </div>

                                                <div class="row">
                                                    <div class="col">

                                                        <span>Description - </span>
                                                        <asp:Label ID="Label9" class="Book-inventory-label" runat="server" Text='<%# Eval("book_description") %>'></asp:Label>
                                                   

                                                    </div>
                                                </div>


                                            </div>
                                            <div class="col-lg-2">
                                                <div class="row">
                                                    <div class="col">
                                                        <asp:Image ID="img" runat="server" class="img-fluid" ImageUrl='<%# Eval("book_img_link") %>' />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>


                                </ItemTemplate>


                            </asp:TemplateField>
                            
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </section>


</asp:Content>
