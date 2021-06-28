using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace RegistrationMVC.Models
{
    public class Student
    {
        public string Name { get; set; }
        public string Address { get; set; }
        public string Gender { get; set; }
        public string Male { get; set; }
        public string Female { get; set; }
        public DateTime Dob { get; set; }
        public int Pincode{ get; set; }
        public string Username { get; set; }
        public string Password { get; set; }


    }
}