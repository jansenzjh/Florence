using System;
using System.Text;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;


namespace Florence {
    
    public class JobPost : ObjectBase<JobPost> {
        public virtual int id { get; set; }
        [Required]
        public virtual AdminDepartment Department { get; set; }
        [Required]
        public virtual string JobTitle { get; set; }
        [Required]
        public virtual string JobType { get; set; }
        [Required]
        public virtual int NumberOfPositions { get; set; }
        [Required]
        public virtual int CandidateAgeRangeStart { get; set; }
        [Required]
        public virtual int CandidateAgeRangeEnd { get; set; }
        [Required]
        public virtual string JobLocation { get; set; }
        [Required]
        public virtual int SalaryStartRange { get; set; }
        [Required]
        public virtual int SalaryEndRange { get; set; }
        [Required]
        public virtual string CandidateQualification { get; set; }
        [Required]
        public virtual string CandidateExperience { get; set; }
        [Required]
        public virtual string JobPostDescription { get; set; }
        [Required]
        public virtual int CreatedBy { get; set; }
        [Required]
        public virtual DateTime CreatedAt { get; set; }
        [Required]
        public virtual DateTime CloseDate { get; set; }

        public virtual int DepartmentSID { get; set; }
    }
}
