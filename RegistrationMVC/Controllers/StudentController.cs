using RegistrationMVC.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace RegistrationMVC.Controllers
{
    public class StudentController : Controller
    {
        // GET: Student
        string connectionString = "Server=ARYASHAJI\\SQLEXPRESS;Database=RegistrationMVC;Trusted_Connection=True";
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Index1(Student student)
        {
            SqlConnection connection = new SqlConnection(connectionString);
            connection.Open();

            SqlCommand command = new SqlCommand("StudentSave", connection);
            command.CommandType = System.Data.CommandType.StoredProcedure;
            command.Parameters.AddWithValue("Name", student.Name);
            command.Parameters.AddWithValue("Address", student.Address);
            command.Parameters.AddWithValue("Gender", student.Gender);
            command.Parameters.AddWithValue("Dob", student.Dob);
            command.Parameters.AddWithValue("Pincode", student.Pincode);
            command.Parameters.AddWithValue("Username",student.Username);
            command.Parameters.AddWithValue("Password", student.Password);

            command.ExecuteNonQuery();
            connection.Close();
            return View("About", student);

        }
        public ActionResult Index2(string username, string password)
        {
            SqlConnection connection = new SqlConnection(connectionString);
            connection.Open();

            SqlCommand command = new SqlCommand("StudentRead", connection);
            command.CommandType = System.Data.CommandType.StoredProcedure;
            command.Parameters.AddWithValue("Username", username);
            command.Parameters.AddWithValue("Password", password);

            SqlDataReader reader = command.ExecuteReader();
            reader.Read();

            Student student = new Student();

            student.Name = reader["Name"].ToString();
            student.Address = reader["Address"].ToString();

            student.Gender = reader["Gender"].ToString();
            student.Dob = Convert.ToDateTime(reader["Dob"]);
            student.Pincode = Convert.ToInt32(reader["Pincode"]);

            reader.Close();
            connection.Close();

            return View("Result", student);

        }
    }
}
          
    
