using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ELibraryManagement
{
    public partial class BookInventory : System.Web.UI.Page
    {

        static string imgUrl;
        static int issuedBooks;
        static int currentStock;
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {

                fillAutherName();
                fillPublisherName();
                grBook.DataBind();

            }

        }


        private void fillAutherName()
        {
            try {

                ddlPublisher.Items[0].Selected = true;
                ddlAutherName.Items.Clear();
                string sql = "select auther_name from auther_master_tbl";

                DataTable dt = SQLHandler.selectCommand(sql);

                foreach(DataRow r in dt.Rows)
                {
                    ddlAutherName.Items.Add(r[0].ToString());
                }

                ddlAutherName.DataBind();

            }
            catch(Exception ex)
            {
                alert("error in system");
            }



        }

        private void fillPublisherName()
        {
            try
            {

                ddlPublisher.Items.Clear();


                string sql = "select [publisher_name] from [publisher_master_tbl]";

                DataTable dt = SQLHandler.selectCommand(sql);

                foreach (DataRow r in dt.Rows)
                {
                    ddlPublisher.Items.Add(r[0].ToString());
                }

                ddlPublisher.Items[0].Selected = true;
                ddlPublisher.DataBind();



            }
            catch(Exception ex)
            {
                alert("error in system");
            }
        }

        private void alert(string v)
        {

            Response.Write("<script> alert('" + v + "')</script>");
        }


        //add book information into database
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                if (isBookExists())
                {
                    alert("book is already exists");
                    return;
                }


                string fileName = Path.GetFileName(FileUpload1.PostedFile.FileName);
                FileUpload1.SaveAs(Server.MapPath("BookInventory/" + fileName));
                string filePath = "~/BookInventory/" + fileName;
                string bookID = txtBookID.Text.Trim();
                string bookName = txtBookName.Text.Trim();
                string language = ddlLang.SelectedItem.Text;
                string autherName = ddlAutherName.SelectedItem.Text;

                string genre = "";
                foreach(int i in lstGenre.GetSelectedIndices())
                {
                    genre += lstGenre.Items[i].Text + ","; 
                }

                genre = genre.Remove(genre.Length - 1);


                string publisherName = ddlPublisher.SelectedItem.Text;
                string publisherDate = txtPublisherDate.Text;
                string edition = txtEdition.Text;
                string bookCost = txtCost.Text;
                string pages = txtPages.Text;
                string ActualStock = txtActual.Text;
                string description = txtDescription.Text;



                string sql = "insert into [book_master_tbl] values('"+bookID+"','"+bookName+ "','"+genre+ "','"+autherName+ "','"+
                    publisherName+ "','"+publisherDate+ "','"+language+ "','"+edition+ "','"+bookCost+ "','"+pages+ "','"+description+ "','"+ActualStock+ "','"+ActualStock+ "','"+
                    filePath+"')";


                SQLHandler.insertCommand(sql);

                alert("Data has been Added Successfully");
                clearForm();
                grBook.DataBind();
                

            }
            catch(Exception ex)
            {
                alert("error in system");
            }
        }

        private bool isBookExists()
        {

            string sql = "select * from [book_master_tbl] where [book_id]='" + txtBookID.Text.Trim() + "' " +
                "or [book_name] ='"+txtBookName.Text.Trim()+"'";

            DataTable dt = SQLHandler.selectCommand(sql);

            if(dt.Rows.Count > 0)
            {
                return true;
            }

            return false;

        }

        protected void btnGo_Click(object sender, EventArgs e)
        {


            try
            {
                
                if (!isBookExists())
                {
                    alert("book ID doesn\\'t exists");
                    return;
                }

                string sql = "select * from [book_master_tbl] where [book_id]='" + txtBookID.Text.Trim() + "' ";

                DataTable dt = SQLHandler.selectCommand(sql);



                
                txtBookID.Text = dt.Rows[0][0].ToString();
                 txtBookName.Text  = dt.Rows[0][1].ToString();
                
                string [] genre = dt.Rows[0][2].ToString().Split(',');


                lstGenre.ClearSelection();

                foreach (string i in genre)
                {
                    lstGenre.Items.FindByText(i).Selected = true;
                }


                ddlAutherName.SelectedItem.Text = dt.Rows[0][3].ToString();


                ddlPublisher.SelectedItem.Text = dt.Rows[0][4].ToString();
                txtPublisherDate.Text = dt.Rows[0][5].ToString();
                ddlLang.SelectedItem.Text = dt.Rows[0][6].ToString();

                txtEdition.Text = dt.Rows[0][7].ToString();
                txtCost.Text = dt.Rows[0][8].ToString();
                txtPages.Text = dt.Rows[0][9].ToString();
                txtActual.Text = dt.Rows[0][11].ToString();
                txtDescription.Text = dt.Rows[0][10].ToString();

                txtCurrent.Text = dt.Rows[0][12].ToString();
                imgUrl = dt.Rows[0][13].ToString();

                issuedBooks = Convert.ToInt32(txtActual.Text) - Convert.ToInt32(txtCurrent.Text);

                txtIssued.Text = issuedBooks.ToString();

            }
            catch(Exception ex)
            {
                alert("error in system");
            }


        }

        private void clearForm()
        {
            


            txtBookID.Text = "";
            txtBookName.Text = "";

            foreach (int i in lstGenre.GetSelectedIndices())
            {
                lstGenre.Items[i].Selected = false;

            }



            ddlAutherName.Items[0].Selected = true;


            ddlPublisher.Items[0].Selected = true;
            txtPublisherDate.Text = "";
            ddlLang.Items[0].Selected = true;

            txtEdition.Text = "";
            txtCost.Text = "";
            txtPages.Text = "";
            txtActual.Text = "";
            txtDescription.Text = "";
            txtCurrent.Text = "";
            txtIssued.Text = "";

        }

        //update information of book
        protected void btnUpdate_Click(object sender, EventArgs e)
        {


            try
            {
                if (!isBookExists())
                {
                    alert("book id doesn\\'t exist");
                    return;
                }

                if (FileUpload1.HasFile)
                {
                    string fileName = Path.GetFileName(FileUpload1.PostedFile.FileName);
                    FileUpload1.SaveAs(Server.MapPath("BookInventory/" + fileName));
                    imgUrl = "~/BookInventory/" + fileName;
                }
                
                
                string bookID = txtBookID.Text.Trim();
                string bookName = txtBookName.Text.Trim();
                string language = ddlLang.SelectedItem.Text;
                string autherName = ddlAutherName.SelectedItem.Text;

                string genre = "";
                foreach (int i in lstGenre.GetSelectedIndices())
                {
                    genre += lstGenre.Items[i].Text + ",";
                }

                genre = genre.Remove(genre.Length - 1);


                string publisherName = ddlPublisher.SelectedItem.Text;
                string publisherDate = txtPublisherDate.Text;
                string edition = txtEdition.Text;
                string bookCost = txtCost.Text;
                string pages = txtPages.Text;
                string ActualStock = txtActual.Text;
                string description = txtDescription.Text;

                if(Convert.ToInt32(txtActual.Text) < Convert.ToInt32(txtCurrent.Text))
                {
                    alert("invalid actual stock");
                    return;
                }

                currentStock = currentStock + Convert.ToInt32(txtActual.Text);

                string sql = "update [book_master_tbl] set [book_id] ='" + bookID + "', [book_name] = '" + bookName + "', [genre] = '" + genre + "', [author_name] = '" + autherName + "', [publisher_name] = '" +
                    publisherName + "',[publish_date] = '" + publisherDate + "',[language] = '" + language + "',[edition] = '" + edition + "',[book_cost] = '" + bookCost + "',[no_of_pages] = '" + pages + "',[book_description] = '" + description + "', [actual_cost] = '" + ActualStock + "', [current_stock] = '" + currentStock + "',[book_img_link] = '" +
                    imgUrl + "' where book_id = '" +bookID+"'";


                SQLHandler.updateCommand(sql);

                alert("Data has been Updated Successfully");
                grBook.DataBind();
                clearForm();

            }
            catch (Exception ex)
            {
                alert("error in system");
            }



        }

        //delete book from system
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            try
            {

                if (!isBookExists())
                {
                    alert("book id doesn\\'t exist");
                    return;
                }

                string sql = "select [book_img_link] from [book_master_tbl]";

                

                DataTable dt = SQLHandler.selectCommand(sql);
                string file = Path.GetFileName(dt.Rows[0][0].ToString());
                if (dt.Rows.Count > 0)
                {
                    File.Delete(MapPath("/BookInventory/"+file));
                }


                sql = "delete book_master_tbl where book_id='" + txtBookID.Text + "'";

                SQLHandler.deleteCommand(sql);

                alert("Book has been deleted");



                grBook.DataBind();

                clearForm();


            }
            catch(Exception ex)
            {
                alert("Error In System");
            }





        }
    }
}