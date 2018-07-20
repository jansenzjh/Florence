using System;
using System.Text;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using Florence.Models;
using NHibernate;
using NHibernate.Linq;
using System.Linq;

namespace Florence {
    
    public class Employee : ObjectBase<Employee> {

        

        public virtual AppUser CreateAppUser()
        {
            var user = new AppUser()
            {
                UserName = this.UserName,
                PasswordHash = this.Password,
                IsActive = true,
                CreatedAt = DateTime.Now,
                UpdatedAt = DateTime.Now,
                SecurityStamp = Guid.NewGuid().ToString(),
                FirstName = this.FirstName,
                LastName = this.LastName,
                Email = this.Email
            };
            return user;
        }

        public virtual bool IsWorkingOnProject()
        {
            return (new ProjectActivity().CountFromExpression(x => x.UserID == this.id && x.StartTime == x.EndTime) > 0);
        }

        public virtual bool IsWorkingOnProject(out Project project)
        {
            if (!this.IsWorkingOnProject())
            {
                project = null;
                return false;
            }
            else
            {
                var projectAct = new ProjectActivity().GetObjectValueFromExpression(x => x.UserID == this.id && x.StartTime == x.EndTime, x => x.StartTime, true);
                if(projectAct != null && projectAct.id > 0)
                {
                    project = Project.GetById(projectAct.ProjectID);
                    return true;
                }
                else
                {
                    project = null;
                    return false;
                }
                
            }
        }

        public static string GetName(int id)
        {
            using (ISession session = NHibernateHelper.OpenSession<Employee>())
            {
                
                var obj = session.Query<Employee>().Where(x => x.id == id).FirstOrDefault();
                if (obj != null)
                {
                    return string.Format("{0} {1}", obj.FirstName, obj.LastName);
                }
                return string.Empty;
            }
        }


        public static string GetWorkShift(int employee)
        {
            return new Employee().GetStringValueFromExpression(x => x.id == employee, x => x.WorkShift);
        }
        
        public virtual int id { get; set; }
        [Required]
        public virtual string Type { get; set; }
        [Required]
        public virtual string Category { get; set; }
        [Required]
        public virtual string Designation { get; set; }
        
        public virtual string Station { get; set; }
        [Required]
        public virtual int Department { get; set; }
        [Required]
        public virtual string Grade { get; set; }
        [Required]
        public virtual string WorkShift { get; set; }
        [Required]
        public virtual string UserName { get; set; }
        [Required]
        public virtual string Password { get; set; }
        [Required]
        public virtual string Email { get; set; }
        [Required]
        public virtual bool ShowInOrganogram { get; set; }
        [Required]
        public virtual bool NotificationByEmail { get; set; }
        [Required]
        public virtual int ReportTo { get; set; }
        [Required]
        public virtual string Salutation { get; set; }
        [Required]
        public virtual string FirstName { get; set; }
        [Required]
        public virtual string LastName { get; set; }
        [Required]
        public virtual DateTime DOB { get; set; }
        [Required]
        public virtual string Gender { get; set; }
        [Required]
        public virtual string BloodGroup { get; set; }
        [Required]
        public virtual string Nationality { get; set; }
        [Required]
        public virtual DateTime JoiningDate { get; set; }
        [Required]
        public virtual string GovernmentID { get; set; }
        [Required]
        public virtual string SSN { get; set; }
        [Required]
        public virtual string PassportID { get; set; }
        public virtual DateTime? PassportExpiration { get; set; }
        [Required]
        public virtual string DriverLicense { get; set; }
        public virtual DateTime? DriverLicenseExpiration { get; set; }
        [Required]
        public virtual string Address { get; set; }
        [Required]
        public virtual string City { get; set; }
        [Required]
        public virtual string State { get; set; }
        [Required]
        public virtual string Zip { get; set; }
        [Required]
        public virtual string Country { get; set; }
        [Required]
        public virtual string HomePhone { get; set; }
        [Required]
        public virtual string OfficePhone { get; set; }
        [Required]
        public virtual string Mobile { get; set; }
        [Required]
        public virtual string EmergencyContactName { get; set; }
        [Required]
        public virtual string EmergencyRelationship { get; set; }
        [Required]
        public virtual string EmergencyPhone { get; set; }
        [Required]
        public virtual bool IsActive { get; set; }
        [Required]
        public virtual int CreatedBy { get; set; }
        [Required]
        public virtual DateTime CreatedAt { get; set; }
        [Required]
        public virtual string AvetarPath { get; set; }

        public virtual string FullName { get { return string.Format("{0} {1}", FirstName, LastName); } }

        public virtual int UserID { get { return id; } }
    }
}
