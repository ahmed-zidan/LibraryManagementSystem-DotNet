<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="BookIssuing.aspx.cs" Inherits="ELibraryManagement.BookIssuing" %>
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
                                        <h4><b>Book Issuing</b></h4>
                                    </div>
                                </center>
                            </div>


                            <div class="row">
                                <center>
                                    <div class="col">
                                        <img src="imgs/booksIssuing.png" width="100px" />
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
                                        <label>Member ID</label>
                                        <asp:TextBox ID="txtMemberID" placeholder="Member ID" class="form-control" runat="server" required>

                                        </asp:TextBox>
                                    </div>
                                    <div class="col-md-6">
                                        <label>Book ID</label>

                                        <div class="input-group">
                                            <asp:TextBox ID="txtBookID" placeholder="Book ID" class="form-control" runat="server" required>

                                            </asp:TextBox>

                                            <asp:Button ID="btnGo" Text="GO" class="btn btn-secondary" runat="server" OnClick="btnGo_Click" />
                                        </div>
                                    </div>
                                </div>

                                <div class="row mt-3">
                                    <div class="col-md-6">
                                        <label>Member Name</label>
                                        <asp:TextBox ReadOnly="true"  ID="txtMemberName" placeholder="Member Name" class="form-control" runat="server">

                                        </asp:TextBox>
                                    </div>

                                    <div class="col-md-6">
                                        <label>Book Name</label>
                                        
                                        <asp:TextBox ReadOnly="true" ID="txtBookName" placeholder="Book Name" class="form-control" runat="server">

                                        </asp:TextBox>
                                        
                                    </div>


                                </div>

                                <div class="row mt-3">
                                    <div class="col-md-6">

                                        <label>Start Date</label>
                                        <asp:TextBox ID="txtStartDate" TextMode="Date" placeholder="Start Date" class="form-control" runat="server">

                                        </asp:TextBox>

                                    </div>

                                    <div class="col-md-6">
                                        <label>End Date</label>
                                        <asp:TextBox ID="txtEndDate" TextMode="Date" placeholder="End Date" class="form-control" runat="server">

                                        </asp:TextBox>
                                    </div>

                                </div>

                                <div class="row mt-3">
                                    <div class="col-md-6">
                                        <asp:Button Width="100%" ID="btnIssue" Text="Issue" CssClass="btn btn-primary" runat="server" OnClick="btnIssue_Click" />
                                    </div>
                                    <div class="col-md-6">
                                        <asp:Button width="100%" ID="btnReturn" Text="Return" CssClass="btn btn-success" runat="server" OnClick="btnReturn_Click" />
                                    </div>
                                </div>
                                




                            </div>


                        </div>
                    </div>

                <div class="col-md-7">
                    <div class="card">
                        <div class="card-body">
                            <div class="row">
                                <Center>
                                    <div class="col">
                                        <h4><b>Issued Book List</b></h4>
                                    </div>
                                </Center>
                            </div>


                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:elibraryDBConnectionString %>" SelectCommand="SELECT * FROM [book_issue_tbl]"></asp:SqlDataSource>
                            <div class="row">
                                <div class="col">
                                    <asp:GridView ID="grIssuedBook" class="table table-striped table-hover" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="grIssuedBook_SelectedIndexChanged" OnRowDataBound="grIssuedBook_RowDataBound">
                                        <Columns>
                                            <asp:BoundField  ControlStyle-BackColor="DarkRed" DataField="member_id" HeaderText="member_id" SortExpression="member_id" />
                                            <asp:BoundField ControlStyle-BackColor="DarkRed" DataField="member_name" HeaderText="member_name" SortExpression="member_name" />
                                            <asp:BoundField ControlStyle-BackColor="DarkRed" DataField="book_id" HeaderText="book_id" SortExpression="book_id" />
                                            <asp:BoundField ControlStyle-BackColor="DarkRed" DataField="book_name" HeaderText="book_name" SortExpression="book_name" />
                                            <asp:BoundField ControlStyle-BackColor="DarkRed" DataField="issue_date" HeaderText="issue_date" SortExpression="issue_date" />
                                            <asp:BoundField ControlStyle-BackColor="DarkRed" DataField="due_date" HeaderText="due_date" SortExpression="due_date" />
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
