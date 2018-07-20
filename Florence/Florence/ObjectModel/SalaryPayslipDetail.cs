using System;
using System.Text;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;


namespace Florence {
    
    public class SalaryPayslipDetail : ObjectBase<SalaryPayslipDetail> {
        public virtual int id { get; set; }
        [Required]
        public virtual System.Guid InstanceID { get; set; }
        [Required]
        public virtual string SalaryItem { get; set; }
        [Required]
        public virtual decimal Amount { get; set; }
    }
}
