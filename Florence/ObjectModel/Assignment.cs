using System;
using System.Text;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;


namespace Florence {
    
    public class Assignment : ObjectBase<Assignment> {
        public virtual int id { get; set; }
        [Required]
        public virtual int AssignTo { get; set; }
        [Required]
        public virtual string AssignmentName { get; set; }
        [Required]
        public virtual DateTime StartDate { get; set; }
        [Required]
        public virtual DateTime EndDate { get; set; }
        [Required]
        public virtual string Priority { get; set; }
        [Required]
        public virtual string AssignmentDescription { get; set; }
        [Required]
        public virtual int CreatedBy { get; set; }
        [Required]
        public virtual DateTime CreatedAt { get; set; }
    }
}
