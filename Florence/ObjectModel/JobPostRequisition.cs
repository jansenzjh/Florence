using System;
using System.Text;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;


namespace Florence {
    
    public class JobPostRequisition : ObjectBase<JobPostRequisition> {
        public virtual int id { get; set; }
        [Required]
        public virtual AdminDepartment Department { get; set; }
        [Required]
        [DisplayName("Job Title")]
        public virtual string JobTitle { get; set; }
        [Required]
        [DisplayName("Type")]
        public virtual string JobType { get; set; }
        [Required]
        [DisplayName("# of Position")]
        public virtual int NumberOfPositions { get; set; }
        [Required]
        [DisplayName("Age")]
        public virtual int CandidateAgeRangeStart { get; set; }
        [Required]
        [DisplayName("Age")]
        public virtual int CandidateAgeRangeEnd { get; set; }
        [Required]
        [DisplayName("Location")]
        public virtual string JobLocation { get; set; }
        [Required]
        [DisplayName("Min Salary")]
        public virtual int SalaryStartRange { get; set; }
        [Required]
        [DisplayName("Max Salary")]
        public virtual int SalaryEndRange { get; set; }
        [Required]
        [DisplayName("Qualification")]
        public virtual string CandidateQualification { get; set; }
        [Required]
        [DisplayName("Experience")]
        public virtual string CandidateExperience { get; set; }
        [Required]
        [DisplayName("Description")]
        public virtual string JobPostDescription { get; set; }
        [Required]
        [DisplayName("Created By")]
        public virtual int CreatedBy { get; set; }
        [Required]
        [DisplayName("Created At")]
        public virtual DateTime CreatedAt { get; set; }

        public virtual int DepartmentSID { get; set; }
    }
}
