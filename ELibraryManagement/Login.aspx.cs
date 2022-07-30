using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ELibraryManagement.pages
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                
                txtMemberId.Text = "";
                txtPassword.Text = "";
            }
        }

        //log in to system to allow features for member admin
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            try {
                
                string memberId = txtMemberId.Text.Trim();
                string password = txtPassword.Text.Trim();

                string sql = "select * from member_master_tbl where member_id = '" + memberId + "' and password = '" + password + "';";
                //get data of user
                DataTable dt = SQLHandler.selectCommand(sql);
                //is user exists in database?
                if(dt.Rows.Count != 1)
                {
                    alert("member id or password is wrong");
                    return;
                }
                else
                {
                    Session["role"] = "member";
                    Session["memberId"] = memberId;
                    Session["password"] = password;
                    Response.Redirect("/HomePage.aspx");

                }



            }
            catch(Exception ex)
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