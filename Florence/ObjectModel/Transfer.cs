using System;
using System.Text;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;


namespace Florence {
    
    public class Transfer : ObjectBase<Transfer> {
        public virtual int id { get; set; }
        [Required]
        public virtual int EmployeeToTransfer { get; set; }
        [Required]
        public virtual int ForwardApplicationTo { get; set; }
        [Required]
        public virtual DateTime TransferDate { get; set; }
        [Required]
        public virtual int TransferToDepartment { get; set; }
        
        public virtual int TransferToStation { get; set; }
        [Required]
        public virtual string TransferDescription { get; set; }
        [Required]
        public virtual int CreatedBy { get; set; }
        [Required]
        public virtual DateTime CreatedAt { get; set; }
    }
}
