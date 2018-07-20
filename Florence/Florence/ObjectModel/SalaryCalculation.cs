using System;
using System.Text;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;


namespace Florence {
    
    public class SalaryCalculation : ObjectBase<SalaryCalculation> {
        public virtual int id { get; set; }
        [Required]
        public virtual bool IncludedBaseSalary { get; set; }
        [Required]
        public virtual bool IncludeDeduction { get; set; }
        [Required]
        public virtual bool IncludeBonus { get; set; }
        [Required]
        public virtual bool IncludeCommission { get; set; }
        [Required]
        public virtual bool IncludeAdjustment { get; set; }
        [Required]
        public virtual bool IncludeReimbursement { get; set; }
        [Required]
        public virtual bool IncludeOvertime { get; set; }
        [Required]
        public virtual bool IncludeProvidentFund { get; set; }
        [Required]
        public virtual bool IncludeAdvanceSalary { get; set; }
        [Required]
        public virtual bool IncludeLoan { get; set; }
        [Required]
        public virtual bool IncludeInsurance { get; set; }
    }
}
