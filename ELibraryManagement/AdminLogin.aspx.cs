using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ELibraryManagement.pages
{
    public partial class AdminLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            try
            {

                string AdminId = txtAdminId.Text.Trim();
                string password = txtPassword.Text.Trim();

                string sql = "select * from admin_login_tbl where username = '" + AdminId + "' and password = '" + password + "';";
                //get data of user
                DataTable dt = SQLHandler.selectCommand(sql);
                //is user exists in database?
                if (dt.Rows.Count != 1)
                {
                    alert("admin id or password is wrong");
                    return;
                }
                else
                {
                    Session["role"] = "admin";
                    Session["adminId"] = AdminId;
                    Session["password"] = password;
                    Response.Redirect("/HomePage.aspx");

                }



            }
            catch (Exception ex)
            {
                alert("Error in System");
            }
        }

        private void alert(string message)
        {
            Response.Write("<script> alert('" + message + "')</script>");
        }
    }
}