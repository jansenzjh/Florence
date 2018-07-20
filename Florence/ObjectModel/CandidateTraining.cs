using System;
using System.Text;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;


namespace Florence {
    
    public class CandidateTraining : ObjectBase<CandidateTraining> {
        public virtual int id { get; set; }
        [Required]
        public virtual System.Guid LinkID { get; set; }
        [Required]
        public virtual string Field { get; set; }
        [Required]
        public virtual string OrganizationName { get; set; }
        [Required]
        public virtual string TrainingTitle { get; set; }
        [Required]
        public virtual string Location { get; set; }
    }
}
