using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ELibraryManagement
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {


              //there is a user login in the system
                if(Session["role"] == "member")
                {
                    displayMemberScreen();
                }else if(Session["role"] == "admin")
                {
                    displayAdminScreen();
                }
                else
                {
                    displayDefaultScreen();
                }
           


        }

        private void displayDefaultScreen()
        {
            userLogin.Visible = true;
            helloUser.Visible = false;
            logOut.Visible = false;
            autherManagement.Visible = false;
            publisherManagement.Visible = false;
            bookInventory.Visible = false;
            bookIssuing.Visible = false;
            memberManagement.Visible = false;
            adminLogin.Visible = true;
            
        }

        private void displayAdminScreen()
        {
            userLogin.Visible = false;
            helloUser.Text = "hello " + Session["AdminId"];
            helloUser.Visible = true;
            logOut.Visible = true;
            autherManagement.Visible = true;
            publisherManagement.Visible = true;
            bookInventory.Visible = true;
            bookIssuing.Visible = true;
            memberManagement.Visible = true;
            adminLogin.Visible = false;
            signUp.Visible = false;
        }

        private void displayMemberScreen()
        {
            userLogin.Visible = false;
            helloUser.Text = "hello " + Session["memberId"];
            helloUser.Visible = true;
            logOut.Visible = true;
            autherManagement.Visible = false;
            publisherManagement.Visible = false;
            bookInventory.Visible = false;
            bookIssuing.Visible = false;
            memberManagement.Visible = false;
            adminLogin.Visible = true;
            signUp.Visible = false;
        }


        protected void viewBook_click(object sender, EventArgs e)
        {
            Response.Redirect("ViewBook.aspx");
        }

        protected void userLogin_click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }

        protected void signUp_click(object sender, EventArgs e)
        {
            Response.Redirect("SignUp.aspx");
        }

        protected void logOut_click(object sender, EventArgs e)
        {
            freeSession();
        }

        private void freeSession()
        {
            Session["role"] = "";
            Session["adminId"] = "";
            Session["password"] = "";
            Session["memberId"] = "";
            Response.Redirect("/HomePage.aspx");

        }
        protected void helloUser_click(object sender, EventArgs e)
        {

        }

        protected void adminLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminLogin.aspx");
        }

        protected void autherManagement_Click(object sender, EventArgs e)
        {
            Response.Redirect("AutherManagement.aspx");
        }

        protected void publisherManagement_Click(object sender, EventArgs e)
        {
            Response.Redirect("PublisherManagement.aspx");
        }

        protected void bookInventory_Click(object sender, EventArgs e)
        {
            Response.Redirect("BookInventory.aspx");
        }

        protected void bookIssuing_Click(object sender, EventArgs e)
        {
            Response.Redirect("BookIssuing.aspx");
        }

        protected void memberManagement_Click(object sender, EventArgs e)
        {
            Response.Redirect("MemberMangement.aspx");
        }
    }



}