using System;
using System.Text;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;


namespace Florence {
    
    public class ExtraPayrollItems : ObjectBase<ExtraPayrollItems> {
        public virtual int id { get; set; }
        [Required]
        public virtual string PayrollItemName { get; set; }
        [Required]
        public virtual decimal Amount { get; set; }
    }
}
