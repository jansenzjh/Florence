using System;
using System.Text;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;


namespace Florence {
    
    public class EmployeeJoining : ObjectBase<EmployeeJoining> {
        public virtual int id { get; set; }
        [Required]
        public virtual int EmployeeID { get; set; }
        [Required]
        public virtual DateTime JoiningDate { get; set; }
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
        public virtual string Note { get; set; }
        [Required]
        public virtual int CreatedBy { get; set; }
        [Required]
        public virtual DateTime CreatedAt { get; set; }
    }
}
