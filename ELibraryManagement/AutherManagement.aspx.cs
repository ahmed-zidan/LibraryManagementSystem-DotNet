using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ELibraryManagement.pages
{
    public partial class AutherManagement : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                GridView1.DataBind();

            }


        }

        //add auther in database
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                if (autherIdExists())
                {
                    alert("user id is already exists");
                    return;
                }

                if(txtAutherName.Text.Trim() == "")
                {
                    alert("please add auther name");
                    return;
                }


                string sql = "insert into auther_master_tbl values('" + txtAutherID.Text.Trim() + "','" + txtAutherName.Text.Trim() + "');";

                SQLHandler.insertCommand(sql);

                alert("Data Added Successfully");

                clear();
                GridView1.DataBind();

            }
            catch(Exception ex)
            {
                alert("error in system");
            }

        }

        private bool autherIdExists()
        {
            string sql = "select * from auther_master_tbl where auther_id = '" + txtAutherID.Text + "';";
            DataTable dt = SQLHandler.selectCommand(sql);

            if (dt.Rows.Count == 0)
            {
                return false;
            }
            
            return true;
        }

        private void alert(string message)
        {
            Response.Write("<script> alert('" + message + "')</script>");
        }

        //update auther name based on auther id
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            try { 
                //check if auther id is exists or not
                if (!autherIdExists())
                {
                        alert("auther id doesn\\'t exist");
                        return;
                }

                //auther name doesn't entered
                if (txtAutherName.Text.Trim() == "")
                {
                    alert("please enter auther name");
                    return;
                }

                string sql = "update auther_master_tbl set auther_name = '" + txtAutherName.Text.Trim() + "' where" +
                    " auther_id = '" + txtAutherID.Text + "'";


                SQLHandler.updateCommand(sql);

                alert("Auther name Updated Successfully");

                clear();
                GridView1.DataBind();

            }
            catch(Exception ex)
            {
                alert("system error");
            }


        }

        //delete auther based on auther id
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            //check if auther id is exists or not
            try
            {
                if (!autherIdExists())
                {
                    alert("auther id doesn\\'t exist");
                    return;
                }


                string sql = "delete auther_master_tbl where auther_id = '" + txtAutherID.Text + "'";
                
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


        private void clear()
        {
            txtAutherID.Text = "";
            txtAutherName.Text = "";
        }


        //get name of auther
        protected void btnGO_Click(object sender, EventArgs e)
        {

            try
            {
                if (!autherIdExists())
                {
                    alert("auther id doesn\\'t exist");
                    
                    clear();
                    return;
                }


                string sql = "select auther_name from auther_master_tbl where auther_id = '" + txtAutherID.Text + "'";

                DataTable dt = SQLHandler.selectCommand(sql);

                txtAutherName.Text = dt.Rows[0][0].ToString();



            }
            catch (Exception ex)
            {
                alert("error in system");
            }



        }
    }
}