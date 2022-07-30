using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ELibraryManagement
{
    public partial class MemberMangement : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.DataBind();
        }

        protected void btnGo_Click(object sender, EventArgs e)
        {

            fillTexts();
            GridView1.DataBind();

        }


        protected void btn_active(object sender, EventArgs e)
        {

            try
            {
                string sql = "update member_master_tbl set account_status= 'active' where member_id = '" + txtMember.Text + "'";
                txtAccount.Text = "active"; 
                SQLHandler.updateCommand(sql);
                
                GridView1.DataBind();
                alert("data updated successfully");
            }catch(Exception ex)
            {
                alert("error in system");
            }

        }


        protected void btn_pending(object sender, EventArgs e)
        {

            try
            {
                string sql = "update member_master_tbl set account_status= 'pending' where member_id = '" + txtMember.Text + "'";
                txtAccount.Text = "pending";
                SQLHandler.updateCommand(sql);
                GridView1.DataBind();

                alert("data updated successfully");
            }
            catch (Exception ex)
            {
                alert("error in system");
            }

        }


        protected void btn_inactive(object sender, EventArgs e)
        {

            try
            {
                string sql = "update member_master_tbl set account_status= 'inactive' where member_id = '" + txtMember.Text + "'";
                txtAccount.Text = "inactive";
                SQLHandler.updateCommand(sql);
                GridView1.DataBind();

                alert("data updated successfully");
            }
            catch (Exception ex)
            {
                alert("error in system");
            }

        }

        private void fillTexts()
        {
            try
            {
                string sql = "select * from member_master_tbl where member_id = '" + txtMember.Text + "'";
                DataTable dt = SQLHandler.selectCommand(sql);

                if (dt.Rows.Count == 0)
                {
                    alert("member id doesn\\'t exist");
                    return;
                }


                txtName.Text = dt.Rows[0][0].ToString();
                txtDOB.Text = dt.Rows[0][1].ToString();
                txtContact.Text = dt.Rows[0][2].ToString();
                txtEmail.Text = dt.Rows[0][3].ToString();
                txtState.Text = dt.Rows[0][4].ToString();
                txtCity.Text = dt.Rows[0][5].ToString();
                txtPin.Text = dt.Rows[0][6].ToString();
                txtFullAddress.Text = dt.Rows[0][7].ToString();
                txtAccount.Text = dt.Rows[0][10].ToString();

            }
            catch(Exception ex)
            {
                alert("error in system");
            }


        }


        private void alert(string message)
        {


            Response.Write("<script> alert('" + message + "') </script>");

        
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            try
            {
                string sql = "delete [member_master_tbl] where [member_id] = '" + txtMember.Text + "'";

                SQLHandler.deleteCommand(sql);

                alert("data has been deleted successfully");
                GridView1.DataBind();
                clearForm();

            }catch(Exception ex)
            {
                alert("error in system");
            }

        }


        private void clearForm()
        {
            txtMember.Text = "";
            txtName.Text = "";
            txtDOB.Text = "";
            txtContact.Text = "";
            txtEmail.Text = "";
            txtState.Text = "";
            txtCity.Text = "";
            txtPin.Text = "";
            txtFullAddress.Text = "";
            txtAccount.Text = "";
        }

    }
}