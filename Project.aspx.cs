using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Globalization;

namespace Assignment3
{
    public partial class Project : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Calendar1.Visible = false;

            }

            Dbconnection dbconnection = new Dbconnection();
            DataTable Result = dbconnection.GetProjectDetails();
            GridView.DataSource = Result;
            GridView.DataBind();
        }

       

        protected void ImageCalendar1_Click(object sender, ImageClickEventArgs e)
        {
            Calendar1.Visible = true;
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            //DateTime date1 = Calendar1.SelectedDate;
            //Birthday.Text = date1.ToString("dd/MM/yyyy");
            Calendar1.Visible = false;


            DateTime Sdate = new DateTime();
            Sdate = DateTime.Parse(Calendar1.SelectedDate.ToShortDateString());
            string startDate = Sdate.ToString("dd-MM-yyyy", DateTimeFormatInfo.InvariantInfo);
            StartDate.Text = startDate;

        }

        protected void Insert_Project(object sender, EventArgs e)
        {
            //SqlConnection connection = new SqlConnection("Data Source=LAPTOP-QDLQ8NAJ;Initial Catalog=Assignment3;Integrated Security=True");
            Dbconnection dbconnection = new Dbconnection();
            SqlConnection connection = dbconnection.getconnection();
            SqlCommand sqlCommand = new SqlCommand("insert into Project(ProjectName,Startdate) Values (' " + ProjectName.Text + "', '"+ StartDate.Text+"')", connection);

            connection.Open();
            sqlCommand.ExecuteNonQuery();
            connection.Close();

           
            DataTable Result = dbconnection.GetProjectDetails();
            GridView.DataSource = Result;
            GridView.DataBind();
        }

        protected void GridView_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int Proj_num = Convert.ToInt32(e.CommandArgument);
            if (e.CommandName == "Edit")
            {

                Dbconnection connection = new Dbconnection();
                DataTable dtProjResult = connection.GetProject(Proj_num);
                ProjectNumbe.Text = dtProjResult.Rows[0][0].ToString();
                ProjectName.Text = dtProjResult.Rows[0][1].ToString();
                StartDate.Text = dtProjResult.Rows[0][2].ToString();

                Save.Visible = false;
            }

            else if (e.CommandName == "Delete")
            {
                Dbconnection connection = new Dbconnection();
                connection.deleteProject(Proj_num);

                DataTable Result = connection.GetProjectDetails();
                GridView.DataSource = Result;
                GridView.DataBind();
            }
        }

        protected void GridView_RowEditing(object sender, GridViewEditEventArgs e)
        {

        }

        protected void GridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

        }

        protected void Update_Click(object sender, EventArgs e)
        {
            string query = " update Project set ProjectName='" + ProjectName.Text + "', Startdate = '" + StartDate.Text + "' where ProjectNumber=" + ProjectNumbe.Text + "";
            Dbconnection dbconnection = new Dbconnection();
            SqlConnection connection = dbconnection.getconnection();
            SqlCommand sqlCommand = new SqlCommand(query, connection);

            connection.Open();
            sqlCommand.ExecuteNonQuery();
            connection.Close();

            DataTable Result = dbconnection.GetProjectDetails();
            GridView.DataSource = Result;
            GridView.DataBind();

            Save.Visible = true;
            ProjectName.Text = string.Empty;
            ProjectName.Text = string.Empty;
            StartDate.Text = string.Empty;

        }

        protected void Reset_Click(object sender, EventArgs e)
        {

            ProjectName.Text = string.Empty;
            ProjectName.Text = string.Empty;
            StartDate.Text = string.Empty;
           
        }

        protected void BtnSearch_Click(object sender, EventArgs e)
        {
            Dbconnection dbconnection = new Dbconnection();
            DataTable Result = dbconnection.GetProjectDetailsByName(Search.Text);
            GridView.DataSource = Result;
            GridView.DataBind();
        }
    }
}