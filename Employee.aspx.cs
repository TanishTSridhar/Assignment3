using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment3
{
    public partial class WebForm1 : System.Web.UI.Page
    {     
        protected void Page_Load(object sender, EventArgs e)
        {

            if(!IsPostBack)
            {
                Calendar1.Visible = false;
               
            }

            if (!IsPostBack)
            {
               
                Calendar2.Visible = false;
            }

            Dbconnection dbconnection = new Dbconnection();
            DataTable Result = dbconnection.GetEmployeeDetails();
            GridView.DataSource = Result;
            GridView.DataBind();

        }



        protected void ImageCalendar1_Click(object sender, ImageClickEventArgs e)
        {
            Calendar1.Visible = true;
          
        }

        protected void ImageCalendar2_Click(object sender, ImageClickEventArgs e)
        {
            
            Calendar2.Visible = true;
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            //DateTime date1 = Calendar1.SelectedDate;
            //Birthday.Text = date1.ToString("dd/MM/yyyy");
            Calendar1.Visible = false;


            DateTime date1 = new DateTime();
            date1 = DateTime.Parse(Calendar1.SelectedDate.ToShortDateString());
            string birthday = date1.ToString("dd-MM-yyyy", DateTimeFormatInfo.InvariantInfo);
            Birthday.Text = birthday;

        }

        protected void Calendar2_SelectionChanged(object sender, EventArgs e)
        {
            //DateTime date2 = Calendar2.SelectedDate;
            //Hiredate.Text = date2.ToString("dd/MM/yyyy");
            Calendar2.Visible = false;

            DateTime date2 = new DateTime();
            date2 = DateTime.Parse(Calendar2.SelectedDate.ToShortDateString());
            string hireDate = date2.ToString("dd-MM-yyyy", DateTimeFormatInfo.InvariantInfo);
            Hiredate.Text = hireDate;
        }

      

        protected void Insert_Employee(object sender, EventArgs e)
        {

            //SqlConnection connection = new SqlConnection("Data Source=LAPTOP-QDLQ8NAJ;Initial Catalog=Assignment3;Integrated Security=True");
            Dbconnection dbconnection = new Dbconnection();
            SqlConnection connection = dbconnection.getconnection();
            SqlCommand sqlCommand = new SqlCommand("insert into Employee(Job_title , LastName , FirstName ,gender , DateOfBirth, HireDate, DepartmentNumber, ProjectNumber) Values (' " + Job_title.Text + "' , ' " + LastName.Text + "' , '"+ FirstName.Text+"' ,'"+ Gender.Text+ "' , '"+ Birthday.Text+"','"+ Hiredate.Text+"', '"+ DepartmentNumber.Text+"', '"+ProjectNumber.Text+"' )", connection);

            connection.Open();
            sqlCommand.ExecuteNonQuery();
            connection.Close();

            DataTable Result = dbconnection.GetEmployeeDetails();
             GridView.DataSource = Result;
            GridView.DataBind();
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int Emp_num = Convert.ToInt32(e.CommandArgument);
            if (e.CommandName == "Edit")
            {

                Dbconnection connection = new Dbconnection();
                DataTable dtDeptResult = connection.GetEmployee(Emp_num);
                EmployeeNumbe.Text = dtDeptResult.Rows[0][0].ToString();
                Job_title.Text = dtDeptResult.Rows[0][1].ToString();
                LastName.Text = dtDeptResult.Rows[0][2].ToString();
                FirstName.Text = dtDeptResult.Rows[0][3].ToString();
                Gender.Text = dtDeptResult.Rows[0][4].ToString();
                Birthday.Text = dtDeptResult.Rows[0][5].ToString();
                Hiredate.Text = dtDeptResult.Rows[0][6].ToString();
                DepartmentNumber.Text = dtDeptResult.Rows[0][7].ToString();
                ProjectNumber.Text = dtDeptResult.Rows[0][8].ToString();
                
                Save.Visible = false;


            }

            else if (e.CommandName == "Delete")
            {
                Dbconnection connection = new Dbconnection();
                connection.deleteEmployee(Emp_num);

                DataTable Result = connection.GetEmployeeDetails();
                GridView.DataSource = Result;
                GridView.DataBind();
            }

        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {

        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

        }

        protected void Update_Click(object sender, EventArgs e)
        {
            string query = "update Employee set Job_title=  ' " + Job_title.Text + "' , LastName= ' " + LastName.Text + "' , FirstName= '" + FirstName.Text + "' ,gender = '" + Gender.Text + "' ,DateOfBirth= '" + Birthday.Text + "',HireDate = '" + Hiredate.Text + "',DepartmentNumber= '" + DepartmentNumber.Text + "', ProjectNumber=  '" + ProjectNumber.Text + "'  where EmployeeNumber=" + EmployeeNumbe.Text+"";
            Dbconnection dbconnection = new Dbconnection();
            SqlConnection connection = dbconnection.getconnection();
            SqlCommand sqlCommand = new SqlCommand(query, connection);

            connection.Open();
            sqlCommand.ExecuteNonQuery();
            connection.Close();

            DataTable Result = dbconnection.GetEmployeeDetails();
           GridView.DataSource = Result;
            GridView.DataBind();

            Save.Visible = true;
            EmployeeNumbe.Text = string.Empty;
            Job_title.Text = string.Empty;
            LastName.Text = string.Empty;
            FirstName.Text = string.Empty;
            Gender.Text = string.Empty;
            Birthday.Text = string.Empty;
            Gender.Text = string.Empty;
            Hiredate.Text = string.Empty;
           
        }

        protected void Reset_Click(object sender, EventArgs e)
        {
            EmployeeNumbe.Text = string.Empty;
            Job_title.Text = string.Empty;
            LastName.Text = string.Empty;
            FirstName.Text = string.Empty;
            Gender.Text = string.Empty;
            Birthday.Text = string.Empty;
            Gender.Text = string.Empty;
            Hiredate.Text = string.Empty;
          
        }

        protected void BtnSearch_Click(object sender, EventArgs e)
        {
            Dbconnection dbconnection = new Dbconnection();
            DataTable Result = dbconnection.GetEmployeeDetailsByName(Search.Text);
            GridView.DataSource = Result;
            GridView.DataBind();
        }
    }
}