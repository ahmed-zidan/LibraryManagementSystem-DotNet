using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;

namespace ELibraryManagement
{

    public class SQLHandler
    {

        private static string conStr = "Data Source=DESKTOP-KDJJ2G8;Initial Catalog=elibraryDB;Integrated Security=True";

       private static SqlConnection sqlCon;
       private static SqlCommand sqlCom;
       private static SqlDataAdapter sqlDataAdapter;
       public static SqlConnection openConnection()
        {

            sqlCon = new SqlConnection(conStr);
            sqlCon.Open();
            return sqlCon;

        }

       public static void closeConnection(SqlConnection sqlConnection)
        {
            sqlConnection.Close();
        }



       public static DataTable selectCommand(string sql)
        {
            var con = openConnection();

            sqlDataAdapter = new SqlDataAdapter(sql, sqlCon);

            DataTable dt = new DataTable();

            sqlDataAdapter.Fill(dt);

            sqlCon.Close();
            return dt;

        }

        //insert into data base
        public static void insertCommand(string sql)
        {
            try
            {

                var con = openConnection();

                sqlCom = new SqlCommand(sql, con);
                sqlCom.ExecuteNonQuery();
                con.Close();


            }catch(SqlException ex)
            {
                throw ex;
            }
        }


        public static void updateCommand(string sql)
        {
            try
            {

                var con = openConnection();

                sqlCom = new SqlCommand(sql, con);
                sqlCom.ExecuteNonQuery();
                con.Close();


            }
            catch (SqlException ex)
            {
                throw ex;
            }
        }




        public static void deleteCommand(string sql)
        {
            try
            {

                var con = openConnection();

                sqlCom = new SqlCommand(sql, con);
                sqlCom.ExecuteNonQuery();
                con.Close();


            }
            catch (SqlException ex)
            {
                throw ex;
            }
        }


    }
}