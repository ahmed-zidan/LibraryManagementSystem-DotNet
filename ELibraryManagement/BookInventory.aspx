<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="BookInventory.aspx.cs" Inherits="ELibraryManagement.BookInventory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script>

        function readURL(input) {

            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    $("#imgView").attr("src", e.target.result);
                }

                reader.readAsDataURL(input.files[0]);

            }



        }



    </script>



    <script type="text/javascript">

        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).DataTable();
        });


    </script>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <section>
        <div class="container-fluid">
            <div class="row mb-4">
                <div class="col">
                    <div class="card">
                        <div class="card-body">
                            <div class="row">
                                <center>
                                    <div class="col">
                                        <h4><b>Book Details</b></h4>
                                    </div>
                                </center>
                            </div>
                            <div class="row">
                                <center>
                                    <div class="col">
                                        <img id="imgView" src="imgs/booksIssuing.png" width="100px" />
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
                                    <asp:FileUpload ID="FileUpload1" onChange ="readURL(this);" class="form-control" runat="server" />
                                </div>
                            </div>

                            <div class="row mt-3">
                                <div class="col-md-4">
                                    <label>Book ID</label>
                                    <div class="input-group">
                                        <asp:TextBox ID="txtBookID" placeholder="Book ID" class="form-control" runat="server" ></asp:TextBox>
                                        <asp:Button ID="btnGo" Text="GO" class="btn btn-primary" runat="server" OnClick="btnGo_Click" />
                                    </div>
                                </div>
                                <div class="col-md-8">
                                    <label>Book Name</label>
                                    <asp:TextBox ID="txtBookName" placeholder="Book Name" class="form-control" runat="server" ></asp:TextBox>
                                </div>
                            </div>

                            <div class="row mt-3">
                                <div class="col-md-4">
                                    <label>Language</label>
                                    
                                     <asp:DropDownList ID="ddlLang" class="form-select" runat="server">
                                         <asp:ListItem Text="English" Selected="True" Value="English"></asp:ListItem>
                                         <asp:ListItem Text="Spanish" Value="Spanish"></asp:ListItem>
                                         <asp:ListItem Text="Arabic" Value="Arabic"></asp:ListItem>
                                         <asp:ListItem Text="French" Value="French"></asp:ListItem>
                                         <asp:ListItem Text="Hindi" Value="Hindi"></asp:ListItem>
                                         <asp:ListItem Text="German" Value="German"></asp:ListItem>
                                     </asp:DropDownList>
                                    
                                </div>
                                <div class="col-md-4">
                                    <label>Author Name</label>
                                    <asp:DropDownList ID="ddlAutherName" class="form-select" runat="server">
                                         <asp:ListItem Text="Author 1" Value="Author 1"></asp:ListItem>
                                         <asp:ListItem Text="Author 2" Value="Author 2"></asp:ListItem>
                                     </asp:DropDownList>                                </div>
                                <div class="col-md-4">
                                    <label>Genre</label>
                                    <asp:ListBox SelectionMode="Multiple" ID="lstGenre" CssClass="form-select" runat="server">
                                        <asp:ListItem Text="Action" Value="Action"></asp:ListItem>
                                        <asp:ListItem Text="Adventure" Value="Adventure"></asp:ListItem>
                                        <asp:ListItem Text="Comic Book" Value="Comic Book"></asp:ListItem>
                                        <asp:ListItem Text="Self Help" Value="Self Help"></asp:ListItem>
                                        <asp:ListItem Text="Motivation" Value="Motivation"></asp:ListItem>
                                        <asp:ListItem Text="Personal Development" Value="Personal Development"></asp:ListItem>
                                        <asp:ListItem Text="Healthy Living" Value="Healthy Living"></asp:ListItem>
                                        <asp:ListItem Text="Willness" Value="Willness"></asp:ListItem>
                                        <asp:ListItem Text="Crime" Value="Crime"></asp:ListItem>
                                        <asp:ListItem Text="Drama" Value="Drama"></asp:ListItem>
                                        <asp:ListItem Text="Fantasy" Value="Fantasy"></asp:ListItem>
                                        <asp:ListItem Text="Horror" Value="Horror"></asp:ListItem>
                                        <asp:ListItem Text="Poetry" Value="Poetry"></asp:ListItem>
                                        <asp:ListItem Text="Romance" Value="Romance"></asp:ListItem>
                                        <asp:ListItem Text="Science" Value="Science"></asp:ListItem>
                                        <asp:ListItem Text="Suspense" Value="Suspense"></asp:ListItem>
                                        <asp:ListItem Text="Thriller" Value="Thriller"></asp:ListItem>
                                        <asp:ListItem Text="Art" Value="Art"></asp:ListItem>
                                        <asp:ListItem Text="Autobiography" Value="Autobiography"></asp:ListItem>


                                    </asp:ListBox>

                                </div>
                            </div>


                            <div class="row">
                                <div class="col-md-4">
                                    <label>Publisher Name</label>
                                    <asp:DropDownList ID="ddlPublisher" class="form-select" runat="server">
                                         <asp:ListItem Text="Publisher 1" Value="Publisher 1"></asp:ListItem>
                                         <asp:ListItem Text="Publisher 2" Value="Publisher 2"></asp:ListItem>
                                     </asp:DropDownList>
                                </div>
                                <div class="col-md-4">
                                    <label>Publisher Date</label>
                                    <asp:TextBox ID="txtPublisherDate" textMode="Date" placeholder="Publisher Date" class="form-control" runat="server" ></asp:TextBox>

                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col-md-4">
                                    <label>Edition</label>
                                    <asp:TextBox ID="txtEdition" textMode="number" placeholder="Edition" class="form-control" runat="server" ></asp:TextBox>

                                </div>
                                <div class="col-md-4">
                                    <label>Book Cost(Per Unit)</label>
                                    <asp:TextBox ID="txtCost" TextMode="Number" placeholder="Book Cost" class="form-control" runat="server" ></asp:TextBox>

                                </div>
                                <div class="col-md-4">
                                    <label>Pages</label>
                                    <asp:TextBox ID="txtPages" textMode="number" placeholder="Pages" class="form-control" runat="server" ></asp:TextBox>

                                </div>
                            </div>

                            <div class="row mt-3">
                                <div class="col-md-4">
                                    <label>Actual Stock</label>
                                    <asp:TextBox ID="txtActual" textMode="number" placeholder="Actual Stock" class="form-control" runat="server" ></asp:TextBox>

                                </div>
                                <div class="col-md-4">
                                    <label>Current Stock</label>
                                    <asp:TextBox ID="txtCurrent" ReadOnly="true" textMode="number" placeholder="Current Stock" class="form-control" runat="server" ></asp:TextBox>

                                </div>
                                <div class="col-md-4">
                                    <label>Issued Books</label>
                                    <asp:TextBox ID="txtIssued" ReadOnly="true" textMode="number" placeholder="Issued Books" class="form-control" runat="server" ></asp:TextBox>

                                </div>
                            </div>

                            <div class="row mt-3">
                                <div class="col">
                                    <label>Book Description</label>
                                    <asp:TextBox ID="txtDescription" textMode="MultiLine" placeholder="Description" class="form-control" runat="server" ></asp:TextBox>
                                    
                                </div>
                            </div>

                            <div class="row mt-3">
                                <div class="col-md-4">
                                    <asp:Button ID="btnAdd" Text="Add" Width="100%" CssClass="btn btn-success" runat="server" OnClick="btnAdd_Click" />
                                </div>
                                <div class="col-md-4">
                                    <asp:Button ID="btnUpdate" Text="Update" Width="100%" CssClass="btn btn-primary" runat="server" OnClick="btnUpdate_Click" />
                                </div>
                                <div class="col-md-4">
                                    <asp:Button ID="btnDelete" Text="Delete" Width="100%" CssClass="btn btn-danger" runat="server" OnClick="btnDelete_Click" />
                                </div>
                            </div>

                        </div>
                    </div>


                </div>
                <div class="col">
                    <div class="card">
                        <div class="card-body">

                            <div class="row">
                                <center>
                                    <div class="col">
                                        <h4><b>Book Inventory List</b></h4>
                                    </div>
                                </center>
                            </div>

                            <div class="row">
                                <div class="col">
                                    <hr />
                                </div>
                            </div>

                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:elibraryDBConnectionString %>" SelectCommand="SELECT * FROM [book_master_tbl]"></asp:SqlDataSource>

                            <div class="row">
                                <div class="col">
                                    <asp:GridView ID="grBook" class="table table-striped table-bordered"  runat="server" AutoGenerateColumns="False" DataKeyNames="book_id" DataSourceID="SqlDataSource1">
                                        <Columns>
                                            <asp:BoundField DataField="book_id" HeaderText="ID" ReadOnly="True" SortExpression="book_id" />
                                            
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <div class="container-fluid">
                                                        <div class="row">
                                                            <div class="col-lg-10">
                                                                <div class="row">
                                                                    <div class="col-12">
                                                                        <asp:Label ID="lblTitle" Text='<%# Eval("book_name") %>' CssClass="Book-inventory-title" runat="server"></asp:Label>
                                                                    </div>
                                                                    
                                                                </div>
                                                                <div class="row mt-2">
                                                                    <div class="col">
                                                                        <label>auther - </label>
                                                                        <asp:Label ID="lblAuther" CssClass="Book-inventory-label"  runat="server" Text='<%# Eval("author_name") %>'></asp:Label>
                                                                        
                                                                        <label> | </label>
                                                                    
                                                                        <label>genre - </label>
                                                                        <asp:Label ID="lblgenre" Text='<%# Eval("genre") %>' CssClass="Book-inventory-label" runat="server"></asp:Label>

                                                                        <label> | </label>
                                                                    
                                                                        <label>language - </label>
                                                                        <asp:Label ID="lblLang" Text='<%# Eval("language") %>' CssClass="Book-inventory-label" runat="server"></asp:Label>

                                                                    
                                                                    </div>
                                                                    
                                                                </div>
                                                                <div class="row mt-1">
                                                                    <div class="col">
                                                                        <label>Publisher - </label>
                                                                        <asp:Label ID="lblPublisher" CssClass="Book-inventory-label" Text='<%# Eval("publisher_name") %>' runat="server"></asp:Label>
                                                                        <label> | </label>
                                                                        <label>Publish Date - </label>
                                                                        <asp:Label ID="lblDate" CssClass="Book-inventory-label" Text='<%# Eval("publish_date") %>' runat="server"></asp:Label>
                                                                        <label> | </label>
                                                                        <label>Pages - </label>
                                                                        <asp:Label ID="lblPages" CssClass="Book-inventory-label" Text='<%# Eval("no_of_pages") %>' runat="server"></asp:Label>
                                                                        <label> | </label>
                                                                        <label>Edition - </label>
                                                                        <asp:Label ID="lblEdition" CssClass="Book-inventory-label" Text='<%# Eval("edition") %>' runat="server"></asp:Label>

                                                                    </div>
                                                                </div>
                                                                <div class="row mt-1">
                                                                    <div class="col">
                                                                            <label>Cost - </label>
                                                                            <asp:Label ID="lblCost" CssClass="Book-inventory-label" Text='<%# Eval("book_cost") %>' runat="server"></asp:Label>
                                                                            <label> | </label>
                                                                            <label>Actual Stock - </label>
                                                                            <asp:Label ID="lblActual" CssClass="Book-inventory-label" Text='<%# Eval("actual_cost") %>' runat="server"></asp:Label>
                                                                            <label> | </label>
                                                                            <label>Available - </label>
                                                                            <asp:Label ID="lblAvailable" CssClass="Book-inventory-label" Text='<%# Eval("current_stock") %>' runat="server"></asp:Label>
                                                                    </div>
                                                                </div>
                                                                <div class="row mt-1">
                                                                    <div class="col">
                                                                        <label>Description - </label>
                                                                        <asp:Label ID="lblDescription" CssClass="Book-inventory-label" Text='<%# Eval("book_description") %>' runat="server"></asp:Label>
                                                                            
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-2">
                                                                <asp:Image ID="image" CssClass="img-fluid p-2" runat="server" ImageUrl='<%# Eval("book_img_link") %>' />
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
                    </div>
                </div>
            </div>
        </div>
    </section>



</asp:Content>
