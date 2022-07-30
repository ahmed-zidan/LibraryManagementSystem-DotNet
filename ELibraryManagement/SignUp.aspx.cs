using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ELibraryManagement.pages
{
    public partial class SignUp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    freeInputs();
                }catch(Exception ex)
                {
                    alert("Error in System");
                }
            }

            

        }

        //free all inputs 
        private void freeInputs()
        {
            try
            {
                txtFullName.Text = "";
                txtDateOfBirth.Text = "";
                txtContactNumber.Text = "";
                txtEmailID.Text = "";
                ddlState.Text = "";
                txtCity.Text = "";
                txtPinCode.Text = "";
                txtFullAddress.Text = "";
                txtUserID.Text = "";
                txtPassowrd.Text = "";

            }catch(Exception ex)
            {
                throw ex;
            }
        }





        //show alert popup 
        private void alert(string message)
        {
            Response.Write("<script> alert('" + message + "')</script>");
        }

        // get data from inputs and store it in database table(member_master_tbl)
        protected void btnSignUp_Click(object sender, EventArgs e)
        {
            try
            {
                //all inputs are filled ?
                if (!allInputsEntered())
                {
                    return;
                }

                //store data in database
                if (storeData())
                {
                    alert("Data has been Uploaded Successfully");

                    freeInputs();
                    

                }

            }catch(SqlException ex)
            {
                alert("error in DataBase");
            }
            
            catch(Exception ex)
            {
                alert("error in System");
            }
        }

        private bool storeData()
        {


            string fullName = txtFullName.Text.Trim();
            string Date = txtDateOfBirth.Text.Trim();
            string contactNum = txtContactNumber.Text.Trim();
            if(contactNum.Length != 11)
            {
                alert("contact number must contain 11 numbers");
                return false; 
            }
            string email = txtEmailID.Text.Trim();
            string state = ddlState.SelectedValue.ToString();
            string city = txtCity.Text.Trim();
            string pin = txtPinCode.Text.Trim();
            if(pin.Length != 4)
            {
                alert("pin code must contain 4 numbers");
                return false;
            }
            string address = txtFullAddress.Text.Trim();
            string userId = txtUserID.Text.Trim();
            string pass = txtPassowrd.Text.Trim();


            string sql = "insert into member_master_tbl (full_name,dob,contact_no,email" +
                ",[state],[city],[pincode],[full_address],[member_id],[password],[account_status]) " +
                "values('" + fullName + "','" + Date + "','" + contactNum + "','" + email + "','" + state + "','" + city + "','" +
                pin + "','" + address + "','" + userId + "','" + pass + "','pending');";


            SQLHandler.insertCommand(sql);


            return true;

        }


        //check if all inputes are filled
        private bool allInputsEntered()
        {
            
            
            if (txtFullName.Text.Trim() == "")
            {
                alert("please enter full name");
                return false;
            }
            if (txtDateOfBirth.Text.Trim() == "")
            {
                alert("please enter date of birth");
                return false;
            }
            

            if (txtContactNumber.Text.Trim() == "")
            {
                alert("please enter contact number");
                return false;
            }
            if (txtEmailID.Text.Trim() == "")
            {
                alert("please enter email");
                return false;
            }

            if (ddlState.SelectedValue.ToString() == "select")
            {
                alert("please enter state");
                return false;
            }
            if (txtCity.Text.Trim() == "")
            {
                alert("please enter city");
                return false;
            }
            if (txtPinCode.Text.Trim() == "")
            {
                alert("please enter pin code");
                return false;
            }
            if (txtFullAddress.Text.Trim() == "")
            {
                alert("please enter address");
                return false;
            }
            if (txtUserID.Text.Trim() == "")
            {
                alert("please enter user id");
                return false;
            }
            if (txtPassowrd.Text.Trim() == "")
            {
                alert("please enter password");
                return false;
            }


            return true;

        }
    }



   


}