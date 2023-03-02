using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace shopping_cart
{
    public partial class AddToCart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) 
            {
                DataTable dt = new DataTable();
                DataRow dr;
                dt.Columns.Add("sno");
                dt.Columns.Add("product_id");
                dt.Columns.Add("product_name");
                dt.Columns.Add("Price");
                dt.Columns.Add("Product_img");
                dt.Columns.Add("cost");
                dt.Columns.Add("totalcost");

                if (Request.QueryString["id"] != null)
                {
                    if (Session["Buyitems"] == null)
                    {
                        dr = dt.NewRow();
                        String mycon = "Data Source=DESKTOP-9USM95I;Initial Catalog=om_shopping;Integrated Security=True";

                        SqlConnection scon = new SqlConnection(mycon);

                        String myquery = "select*from product_Details where product_id=" + Request.QueryString["id"];

                        SqlCommand cmd = new SqlCommand();
                        cmd.CommandText = myquery;
                        cmd.Connection = scon;
                        SqlDataAdapter da = new SqlDataAdapter();
                        da.SelectCommand = cmd;

                        DataSet ds = new DataSet();
                        da.Fill(ds);
                        dr["sno"] = 1;

                        dr["product_id"] = ds.Tables[0].Rows[0]["product_id"].ToString();
                        dr["product_name"] = ds.Tables[0].Rows[0]["product_name"].ToString();
                        dr["Product_img"] = ds.Tables[0].Rows[0]["product_img"].ToString();
                        dr["Price"] = ds.Tables[0].Rows[0]["Price"].ToString();
                        dt.Rows.Add(dr);

                        GridView12.DataSource = dt;
                        GridView12.DataBind();


                        Session["buyitems"] = dt;
                    }
                    else
                    {
                        dt = ( DataTable )Session["Buyitems"];
                        int sr;
                        sr = dt.Rows.Count;
                        dr = dt.NewRow();
                        String mycon = "Data Source=DESKTOP-9USM95I;Initial Catalog=om_shopping;Integrated Security=True";

                        SqlConnection scon = new SqlConnection(mycon);

                        String myquery = "select*from product_Details where product_id=" + Request.QueryString["id"];

                        SqlCommand cmd = new SqlCommand();
                        cmd.CommandText = myquery;
                        cmd.Connection = scon;
                        SqlDataAdapter da = new SqlDataAdapter();
                        da.SelectCommand = cmd;

                        DataSet ds = new DataSet();
                        da.Fill(ds);
                        dr["sno"] = sr + 1;

                        dr["product_id"] = ds.Tables[0].Rows[0]["product_id"].ToString();
                        dr["product_name"] = ds.Tables[0].Rows[0]["product_name"].ToString();
                        dr["Product_img"] = ds.Tables[0].Rows[0]["product_img"].ToString();
                        dr["Price"] = ds.Tables[0].Rows[0]["Price"].ToString();
                        dt.Rows.Add(dr);

                        GridView12.DataSource = dt;
                        GridView12.DataBind();


                        Session["buyitems"] = dt;
                    }
                }
                else
                {
                    dt = (DataTable)Session["buyitems"];
                    GridView12.DataSource = dt;
                    GridView12.DataBind();

                }
            }
        }
    }
}