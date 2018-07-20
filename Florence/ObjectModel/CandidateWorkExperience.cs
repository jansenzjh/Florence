using System;
using System.Text;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;


namespace Florence {
    
    public class CandidateWorkExperience : ObjectBase<CandidateWorkExperience> {
        public virtual int id { get; set; }
        [Required]
        public virtual System.Guid LinkID { get; set; }
        [Required]
        public virtual string JobField { get; set; }
        [Required]
        public virtual string OrganizationName { get; set; }
        [Required]
        public virtual string Designation { get; set; }
        [Required]
        public virtual DateTime StartDate { get; set; }
        [Required]
        public virtual DateTime EndDate { get; set; }
        [Required]
        public virtual string JobDescription { get; set; }
    }
}
