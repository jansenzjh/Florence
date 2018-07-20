using System;
using System.Text;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;


namespace Florence {
    
    public class Contract : ObjectBase<Contract> {
        public virtual int id { get; set; }
        [Required]
        public virtual int EmployeeID { get; set; }
        [Required]
        public virtual string ContractType { get; set; }
        [Required]
        public virtual string Title { get; set; }
        [Required]
        public virtual DateTime StartDate { get; set; }
        [Required]
        public virtual DateTime EndDate { get; set; }
        [Required]
        public virtual string Designation { get; set; }
        [Required]
        public virtual string EmployeeType { get; set; }
        [Required]
        public virtual string EmployeeCategory { get; set; }
        [Required]
        public virtual string EmployeeGrade { get; set; }
        
        public virtual string Station { get; set; }
        [Required]
        public virtual int Department { get; set; }
        [Required]
        public virtual string ContactDesc { get; set; }
        [Required]
        public virtual int CreatedBy { get; set; }
        [Required]
        public virtual DateTime CreatedAt { get; set; }
        [Required]
        public virtual string ContractFilePath { get; set; }
    }
}
