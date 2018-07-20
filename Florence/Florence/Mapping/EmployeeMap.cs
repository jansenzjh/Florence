using System; 
using System.Collections.Generic; 
using System.Text; 
using FluentNHibernate.Mapping;
using Florence; 

namespace Florence.Maps {
    
    
    public class EmployeeMap : ClassMap<Employee> {
        
        public EmployeeMap() {
			Table("Employee");
			LazyLoad();
			Id(x => x.id).GeneratedBy.Identity().Column("id");
			Map(x => x.Type).Column("Type").Not.Nullable();
			Map(x => x.Category).Column("Category").Not.Nullable();
			Map(x => x.Designation).Column("Designation").Not.Nullable();
			Map(x => x.Station).Column("Station");
			Map(x => x.Department).Column("Department").Not.Nullable();
			Map(x => x.Grade).Column("Grade").Not.Nullable();
			Map(x => x.WorkShift).Column("WorkShift").Not.Nullable();
			Map(x => x.UserName).Column("UserName").Not.Nullable();
			Map(x => x.Password).Column("Password").Not.Nullable();
			Map(x => x.Email).Column("Email").Not.Nullable();
			Map(x => x.ShowInOrganogram).Column("ShowInOrganogram").Not.Nullable();
			Map(x => x.NotificationByEmail).Column("NotificationByEmail").Not.Nullable();
			Map(x => x.ReportTo).Column("ReportTo").Not.Nullable();
			Map(x => x.Salutation).Column("Salutation").Not.Nullable();
			Map(x => x.FirstName).Column("FirstName").Not.Nullable();
			Map(x => x.LastName).Column("LastName").Not.Nullable();
			Map(x => x.DOB).Column("DOB").Not.Nullable();
			Map(x => x.Gender).Column("Gender").Not.Nullable();
			Map(x => x.BloodGroup).Column("BloodGroup").Not.Nullable();
			Map(x => x.Nationality).Column("Nationality").Not.Nullable();
			Map(x => x.JoiningDate).Column("JoiningDate").Not.Nullable();
			Map(x => x.GovernmentID).Column("GovernmentID").Not.Nullable();
			Map(x => x.SSN).Column("SSN").Not.Nullable();
			Map(x => x.PassportID).Column("PassportID").Not.Nullable();
			Map(x => x.PassportExpiration).Column("PassportExpiration");
			Map(x => x.DriverLicense).Column("DriverLicense").Not.Nullable();
			Map(x => x.DriverLicenseExpiration).Column("DriverLicenseExpiration");
			Map(x => x.Address).Column("Address").Not.Nullable();
			Map(x => x.City).Column("City").Not.Nullable();
			Map(x => x.State).Column("State").Not.Nullable();
			Map(x => x.Zip).Column("Zip").Not.Nullable();
			Map(x => x.Country).Column("Country").Not.Nullable();
			Map(x => x.HomePhone).Column("HomePhone").Not.Nullable();
			Map(x => x.OfficePhone).Column("OfficePhone").Not.Nullable();
			Map(x => x.Mobile).Column("Mobile").Not.Nullable();
			Map(x => x.EmergencyContactName).Column("EmergencyContactName").Not.Nullable();
			Map(x => x.EmergencyRelationship).Column("EmergencyRelationship").Not.Nullable();
			Map(x => x.EmergencyPhone).Column("EmergencyPhone").Not.Nullable();
			Map(x => x.IsActive).Column("IsActive").Not.Nullable();
			Map(x => x.CreatedBy).Column("CreatedBy").Not.Nullable();
			Map(x => x.CreatedAt).Column("CreatedAt").Not.Nullable();
			Map(x => x.AvetarPath).Column("AvetarPath").Not.Nullable();
        }
    }
}
