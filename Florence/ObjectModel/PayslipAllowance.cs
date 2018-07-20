using System;
using System.Text;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;


namespace Florence {
    
    public class PayslipAllowance : ObjectBase<PayslipAllowance> {
        public virtual int id { get; set; }
        [Required]
        public virtual string AllowanceTitle { get; set; }
        [Required]
        public virtual bool IsTaxable { get; set; }
        [Required]
        public virtual string AllowanceType { get; set; }
        [Required]
        public virtual decimal Amount { get; set; }
        [Required]
        public virtual decimal Percentage { get; set; }
    }
}
