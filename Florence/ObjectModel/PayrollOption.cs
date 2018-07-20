using System;
using System.Text;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;

namespace Florence {
    
    public class PayrollOption : ObjectBase<PayrollOption> {
        public virtual int id { get; set; }
        [Required]
        public virtual string PayrollMethod { get; set; }
        [Required]
        public virtual string AutoApprovePayroll { get; set; }
        [Required]
        public virtual int PayrollApprovedBy { get; set; }
        [Required]
        public virtual bool AutoEmailPayslips { get; set; }
        [Required]
        public virtual string PerDaySalaryCalculation { get; set; }
        [Required]
        public virtual int NumberOfDayInMonth { get; set; }
       
        public virtual string PayrollCurrency { get; set; }
        [Required]
        public virtual string PayslipTitle { get; set; }
        [Required]
        public virtual string PayslipFormat { get; set; }
        [Required]
        public virtual string BasicSalaryType { get; set; }
        [Required]
        public virtual decimal BasicSalaryPercentage { get; set; }





    }
}
