using System;
using System.Text;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;


namespace Florence {
    
    public class EmployeeExit : ObjectBase<EmployeeExit> {
        public virtual int id { get; set; }
        [Required]
        public virtual int Employee { get; set; }
        [Required]
        public virtual DateTime ExitDate { get; set; }
        [Required]
        public virtual string TypeOfExit { get; set; }
        [Required]
        public virtual bool ConductedExitInterview { get; set; }
        [Required]
        public virtual string Reason { get; set; }
        [Required]
        public virtual int CreatedBy { get; set; }
        [Required]
        public virtual DateTime CreatedAt { get; set; }
    }
}
