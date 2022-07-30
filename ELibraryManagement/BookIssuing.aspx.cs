using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ELibraryManagement
{
    public partial class BookIssuing : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            grIssuedBook.DataBind();

        }

        protected void btnGo_Click(object sender, EventArgs e)
        {

            try
            {

                if (!isMemberExists())
                {
                    alert("member not exists");
                    return;
                }

                if (!isBookExists())
                {
                    alert("book not exists");
                    return;
                }


            }catch(Exception ex)
            {
                alert("Error in System");
            }



        }

        //check if book exists or not and fill book Name
        private bool isBookExists()
        {
            string sql = "select [book_name] from [book_master_tbl] where [book_id] = '" + txtBookID.Text + "'";
            DataTable dt = SQLHandler.selectCommand(sql);
            if (dt.Rows.Count > 0)
            {
                txtBookName.Text = dt.Rows[0][0].ToString();
                return true;

            }
            return false;
        }

        //check if member exists or not and fill member Name
        private bool isMemberExists()
        {

            string sql = "select [full_name] from [member_master_tbl] where [member_id] = '" + txtMemberID.Text + "'";
            DataTable dt = SQLHandler.selectCommand(sql);
            if(dt.Rows.Count > 0)
            {
                txtMemberName.Text = dt.Rows[0][0].ToString();
                return true;

            }
            return false;
        }




        private void alert(string v)
        {
            Response.Write("<script> alert('" + v + "')</script>");
        }


        //insert book into issuing table 
        protected void btnIssue_Click(object sender, EventArgs e)
        {

            try
            {

                if (!isMemberExists())
                {
                    alert("member not exists");
                    return;
                }

                if (!isBookExists())
                {
                    alert("book not exists");
                    return;
                }


                string sql = "select * from [book_issue_tbl] where [member_id]='" + txtMemberID.Text + "' and [book_id] ='" + txtBookID.Text + "'";
                DataTable dt = SQLHandler.selectCommand(sql);
                if(dt.Rows.Count > 0)
                {
                    alert("member already has book");
                    return;
                }


                string strartDate = txtStartDate.Text;
                string endDate = txtEndDate.Text;


                if (strartDate == "" || endDate == "" || txtMemberName.Text == "" || txtBookName.Text==""||txtBookID.Text =="" ||txtMemberID.Text=="")
                {
                    alert("please enter start Date and End Date");
                    return;
                }

                
                if (Convert.ToDateTime(strartDate) > Convert.ToDateTime(endDate))
                {
                    alert("start date and end date not valid");
                    return;
                }

                sql = "insert into [book_issue_tbl] values('" + txtMemberID.Text + "','" + txtMemberName.Text + "','" + txtBookID.Text + "','" + txtBookName.Text + "','" +
                    txtStartDate.Text + "','" + txtEndDate.Text + "')";

                SQLHandler.insertCommand(sql);


                sql = "select [current_stock] from [book_master_tbl] where [book_id]='" + txtBookID.Text+"'";

                dt = SQLHandler.selectCommand(sql);

                int current = Convert.ToInt32(dt.Rows[0][0]);

                current--;

                sql = "update [book_master_tbl] set [current_stock] = '" + current + "' where [book_id]='" + txtBookID.Text + "'";
                SQLHandler.updateCommand(sql);


                alert("Data inserted successfully");

                grIssuedBook.DataBind();
            }
            catch(Exception ex)
            {
                alert("error in system");
            }


        }




        protected void btnReturn_Click(object sender, EventArgs e)
        {
            try
            {

                if (!isMemberExists())
                {
                    alert("member not exists");
                    return;
                }

                if (!isBookExists())
                {
                    alert("book not exists");
                    return;
                }


                string sql = "select * from [book_issue_tbl] where [member_id]='" + txtMemberID.Text + "' and [book_id] ='" + txtBookID.Text + "'";
                DataTable dt = SQLHandler.selectCommand(sql);
                if (dt.Rows.Count > 0)
                {
                   
                    sql = "delete [book_issue_tbl] where [member_id]='" + txtMemberID.Text + "' and [book_id] ='" + txtBookID.Text + "'";
                    SQLHandler.deleteCommand(sql);

                    sql = "select [current_stock] from [book_master_tbl] where [book_id]='" + txtBookID.Text + "'";

                    dt = SQLHandler.selectCommand(sql);

                    int current = Convert.ToInt32(dt.Rows[0][0]);

                    current++;

                    sql = "update [book_master_tbl] set [current_stock] = '" + current + "' where [book_id]='" + txtBookID.Text + "'";
                    SQLHandler.updateCommand(sql);

                    alert("Data Deleted Successfully");
                    grIssuedBook.DataBind();
                }
                else
                {
                    alert("Data Doesn\\'t exists");
                }


            }
            catch(Exception ex)
            {
                alert("error in system");
            }

        }

        protected void grIssuedBook_SelectedIndexChanged(object sender, EventArgs e)
        {

           

        }

        protected void grIssuedBook_RowDataBound(object sender, GridViewRowEventArgs e)
        {

            try
            {

                if (e.Row.RowType == DataControlRowType.DataRow)
                {
                    DateTime today = DateTime.Today;
                    DateTime dt = Convert.ToDateTime(e.Row.Cells[5].Text);

                    if(dt < today)
                    {
                        e.Row.BackColor = System.Drawing.Color.Red;
                    }
                }


            }catch(Exception ex)
            {
                alert("error in system");
            }


        }
    }
}