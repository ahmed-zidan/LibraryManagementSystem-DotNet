using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ELibraryManagement
{
    public partial class PublisherManagement : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //add publisher into database
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                if (autherIdExists())
                {
                    alert("user id is already exists");
                    return;
                }

                if (txtPublisherName.Text.Trim() == "")
                {
                    alert("please add publisher name");
                    return;
                }


                string sql = "insert into publisher_master_tbl values('" + txtPublisherId.Text.Trim() + "','" + txtPublisherName.Text.Trim() + "');";

                SQLHandler.insertCommand(sql);

                alert("Data Added Successfully");

                clear();
                GridView1.DataBind();

            }
            catch (Exception ex)
            {
                alert("error in system");
            }
        }



        private void clear()
        {
            txtPublisherId.Text = "";
            txtPublisherName.Text = "";
        }


        private void alert(string message)
        {
            Response.Write("<script> alert('" + message + "')</script>");
        }


        //check publisher exists or not
        private bool autherIdExists()
        {
            string sql = "select * from publisher_master_tbl where publisher_id = '" + txtPublisherId.Text + "';";
            DataTable dt = SQLHandler.selectCommand(sql);

            if (dt.Rows.Count == 0)
            {
                return false;
            }

            return true;
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            try
            {
                //check if auther id is exists or not
                if (!autherIdExists())
                {
                    alert("publisher id doesn\\'t exist");
                    return;
                }

                //auther name doesn't entered
                if (txtPublisherName.Text.Trim() == "")
                {
                    alert("please enter publisher name");
                    return;
                }

                string sql = "update publisher_master_tbl set publisher_name = '" + txtPublisherName.Text.Trim() + "' where" +
                    " publisher_id = '" + txtPublisherId.Text + "'";


                SQLHandler.updateCommand(sql);

                alert("Auther name Updated Successfully");

                clear();
                GridView1.DataBind();

            }
            catch (Exception ex)
            {
                alert("system error");
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            //check if publisher id is exists or not
            try
            {
                if (!autherIdExists())
                {
                    alert("publisher id doesn\\'t exist");
                    return;
                }


                string sql = "delete publisher_master_tbl where publisher_id = '" + txtPublisherId.Text + "'";

                SQLHandler.deleteCommand(sql);
                alert("data removed successfully");
                clear();
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                alert("system error");
            }


        }


        //get name of publisher
        protected void btnGO_Click(object sender, EventArgs e)
        {
            try
            {
                if (!autherIdExists())
                {
                    alert("publisher id doesn\\'t exist");

                    clear();
                    return;
                }


                string sql = "select publisher_name from publisher_master_tbl where publisher_id = '" + txtPublisherId.Text + "'";

                DataTable dt = SQLHandler.selectCommand(sql);

                txtPublisherName.Text = dt.Rows[0][0].ToString();



            }
            catch (Exception ex)
            {
                alert("error in system");
            }

        }

        protected void txtPublisherId_TextChanged(object sender, EventArgs e)
        {

        }
    }
}