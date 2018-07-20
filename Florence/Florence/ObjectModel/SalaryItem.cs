using System;
using System.Text;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;


namespace Florence {
    
    public class SalaryItem : ObjectBase<SalaryItem> {
        public virtual int id { get; set; }
        [Required]
        public virtual int Employee { get; set; }
        [Required]
        public virtual string SalaryItemType { get; set; }
        [Required]
        public virtual string Title { get; set; }
        [Required]
        public virtual decimal Amount { get; set; }
        [Required]
        public virtual string Description { get; set; }
        [Required]
        public virtual DateTime CreatedAt { get; set; }
        [Required]
        public virtual int CreatedBy { get; set; }
        [Required]
        public virtual bool IsRecurring { get; set; }
        [Required]
        public virtual int RecurringCyclePerMonth { get; set; }

        /// <summary>
        /// Get the total amount of given type
        /// </summary>
        /// <param name="employee">Employee id(int)</param>
        /// <param name="fromDate"></param>
        /// <param name="toDate"></param>
        /// <param name="salaryItemType">Salary Item Type, includes Deductions,Bonuses,Adjustments,Comissions,Advance Salary</param>
        /// <returns></returns>
        public static decimal GetSalaryTypeTotalAmount(int employee, DateTime fromDate, DateTime toDate, string salaryItemType)
        {
            var objs = new SalaryItem().GetObjectsValueFromExpression(x => x.SalaryItemType.Equals(salaryItemType) 
                                                                        && x.CreatedAt >= fromDate 
                                                                        && x.CreatedAt < toDate 
                                                                        && x.Employee == employee);
            if (objs != null && objs.Count > 0)
            {
                return objs.Sum(x => x.Amount);
            }
            else
            {
                return 0;
            }

        }
    }
}
