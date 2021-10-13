using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;

namespace Assignment3
{
    public class Dbconnection
    {

        //DB Connection
        public SqlConnection getconnection()
        {
            SqlConnection connection = new SqlConnection("Data Source=LAPTOP-QDLQ8NAJ;Initial Catalog=Assignment3;Integrated Security=True");

            return connection;
        }


        //*********EMPLOYEE************************

        // Getting complete Employee Details
        public DataTable GetEmployeeDetails()
        {
            SqlConnection connection = getconnection();
            SqlCommand sqlCommand = new SqlCommand("select * from Employee ", connection);

            connection.Open();
            SqlDataReader dr = sqlCommand.ExecuteReader();
            DataTable dt = new DataTable();
            dt.Load(dr);
            connection.Close();

            return dt;

        }

        // Getting Employee Details by using Employee Number

        public DataTable GetEmployee(int EmpNumber)
        {
            SqlConnection connection = getconnection();
            SqlCommand sqlCommand = new SqlCommand("select * from Employee where EmployeeNumber = " + EmpNumber, connection);

            connection.Open();
            SqlDataReader dr = sqlCommand.ExecuteReader();
            DataTable dt = new DataTable();
            dt.Load(dr);
            connection.Close();

            return dt;

        }



        //Getting Employee Details by Name
        public DataTable GetEmployeeDetailsByName(string Emp_name)
        {
            SqlConnection connection = getconnection();
            SqlCommand sqlCommand = new SqlCommand("select * from Employee where FirstName = '" + Emp_name + "'", connection);

            connection.Open();
            SqlDataReader dr = sqlCommand.ExecuteReader();
            DataTable dt = new DataTable();
            dt.Load(dr);
            connection.Close();

          
            return dt;

        }

        //Deleting Employee Details
        public void deleteEmployee(int emp_num)
        {
            SqlConnection connection = getconnection();
            SqlCommand sqlCommand = new SqlCommand("Delete from Employee where EmployeeNumber =  " + emp_num, connection);

            connection.Open();
            sqlCommand.ExecuteNonQuery();
            connection.Close();
        }


        //*********DEPARTMENT************************

        // Getting Department Details by using Department Number
        public DataTable GetDepartment(int DeptNumber )
        {
            SqlConnection connection = getconnection();
            SqlCommand sqlCommand = new SqlCommand("select * from Department where DepartmentNumber = " + DeptNumber, connection);

            connection.Open();
            SqlDataReader dr = sqlCommand.ExecuteReader();
            DataTable dt = new DataTable();
            dt.Load(dr);
            connection.Close();

            return dt;

        } 
        
        //Getting complete Department Details
        public DataTable GetDepartmentDetails( )
        {
            SqlConnection connection = getconnection();
            SqlCommand sqlCommand = new SqlCommand("select * from Department ", connection);

            connection.Open();
            SqlDataReader dr = sqlCommand.ExecuteReader();
            DataTable dt = new DataTable();
            dt.Load(dr);
            connection.Close();

            return dt;

        }

        //Deleting Department Details
        public void deleteDepartment(int dept_num)
        {
            SqlConnection connection = getconnection();
            SqlCommand sqlCommand = new SqlCommand("Delete from Department where DepartmentNumber =  "+ dept_num, connection);

            connection.Open();
            sqlCommand.ExecuteNonQuery();
            connection.Close();
        }


        //*********PROJECT************************

        // Getting Project Details by using Project Number
        public DataTable GetProject(int ProjNumber)
        {
            SqlConnection connection = getconnection();
            SqlCommand sqlCommand = new SqlCommand("select * from Project where ProjectNumber = " + ProjNumber, connection);

            connection.Open();
            SqlDataReader dr = sqlCommand.ExecuteReader();
            DataTable dt = new DataTable();
            dt.Load(dr);
            connection.Close();

            return dt;

        }

        //Getting complete Project Details
        public DataTable GetProjectDetails()
        {
            SqlConnection connection = getconnection();
            SqlCommand sqlCommand = new SqlCommand("select * from Project ", connection);

            connection.Open();
            SqlDataReader dr = sqlCommand.ExecuteReader();
            DataTable dt = new DataTable();
            dt.Load(dr);
            connection.Close();

            return dt;

        }

        //Getting Project Details By Name
        public DataTable GetProjectDetailsByName(string Project_name)
        {
            SqlConnection connection = getconnection();
            SqlCommand sqlCommand = new SqlCommand("select * from Project where ProjectName = '" + Project_name + "'", connection);

            connection.Open();
            SqlDataReader dr = sqlCommand.ExecuteReader();
            DataTable dt = new DataTable();
            dt.Load(dr);
            connection.Close();


            return dt;

        }



        //Deleting Project Details
        public void deleteProject(int Proj_num)
        {
            SqlConnection connection = getconnection();
            SqlCommand sqlCommand = new SqlCommand("Delete from Project where ProjectNumber =  " + Proj_num, connection);

            connection.Open();
            sqlCommand.ExecuteNonQuery();
            connection.Close();
        }
    }
}