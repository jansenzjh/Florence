using System;
using System.Text;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;


namespace Florence {
    
    public class Leave : ObjectBase<Leave> {
        public virtual int id { get; set; }
        [Required]
        public virtual int Employee { get; set; }
        [Required]
        public virtual string LeaveType { get; set; }
        [Required]
        public virtual string Reason { get; set; }
        
        public virtual string LeaveDuration { get; set; }
        [Required]
        public virtual DateTime LeaveFrom { get; set; }
        [Required]
        public virtual DateTime LeaveTo { get; set; }
        [Required]
        public virtual string AlternateContactNumber { get; set; }
        [Required]
        public virtual int AlternateEmployee { get; set; }
        [Required]
        public virtual string LeaveDescription { get; set; }
        [Required]
        public virtual int CreatedBy { get; set; }
        [Required]
        public virtual DateTime CreatedAt { get; set; }
    }
}
