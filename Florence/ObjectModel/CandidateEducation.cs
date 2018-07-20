using System;
using System.Text;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;


namespace Florence {
    
    public class CandidateEducation : ObjectBase<CandidateEducation> {
        public virtual int id { get; set; }
        [Required]
        public virtual System.Guid LinkID { get; set; }
        [Required]
        public virtual string Degree { get; set; }
        [Required]
        public virtual string Subject { get; set; }
        [Required]
        public virtual string Institute { get; set; }
        [Required]
        public virtual decimal Grade { get; set; }
        [Required]
        public virtual int GraduationYear { get; set; }
    }
}
