using System;
using System.Text;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using NHibernate;
using Florence.Models;
using NHibernate.Linq;
using System.Linq;

namespace Florence {
    
    public class Loan : ObjectBase<Loan> {
        public virtual int id { get; set; }
        [Required]
        public virtual int Employee { get; set; }
        [Required]
        public virtual string Title { get; set; }
        [Required]
        public virtual decimal LoanAmount { get; set; }
        [Required]
        public virtual decimal LoanBalance { get; set; }
        [Required]
        public virtual DateTime LoanDate { get; set; }
        [Required]
        public virtual decimal MonthlyRepaymentAmount { get; set; }
        [Required]
        public virtual DateTime RepaymentStartDate { get; set; }
        [Required]
        public virtual string Description { get; set; }
        [Required]
        public virtual DateTime CreatedAt { get; set; }
        [Required]
        public virtual int CreatedBy { get; set; }

        
    }
}
