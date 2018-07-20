using System;
using System.Text;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;


namespace Florence {
    
    public class TrainingNeedAssessment : ObjectBase<TrainingNeedAssessment> {
        public virtual int id { get; set; }
        [Required]
        public virtual int Department { get; set; }
        [Required]
        public virtual string Type { get; set; }
        [Required]
        public virtual string Subject { get; set; }
        [Required]
        public virtual string NatureOfTraining { get; set; }
        [Required]
        public virtual string Title { get; set; }
        [Required]
        public virtual int Employee { get; set; }
        [Required]
        public virtual string Reason { get; set; }
        [Required]
        public virtual string PreferredTrainer { get; set; }
        [Required]
        public virtual string PreferredLocation { get; set; }
        [Required]
        public virtual DateTime PreferredStartDate { get; set; }
        [Required]
        public virtual DateTime PreferredEndDate { get; set; }
        [Required]
        public virtual string Description { get; set; }
        [Required]
        public virtual DateTime CreatedAt { get; set; }
        [Required]
        public virtual int CreatedBy { get; set; }
    }
}
