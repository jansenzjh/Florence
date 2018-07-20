using System;
using System.Text;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;

namespace Florence {
    
    public class Salary : ObjectBase<Salary> {
        public virtual int id { get; set; }
        [Required]
        public virtual int Employee { get; set; }
        [Required]
        public virtual string SalaryType { get; set; }
        
        public virtual string Currency { get; set; }
        [Required]
        public virtual string TaxRule { get; set; }
        [Required]
        public virtual decimal OvertimeRate { get; set; }
        [Required]
        public virtual decimal AnnualGrossSalary { get; set; }
        [Required]
        public virtual decimal MonthlyBasicSalary { get; set; }
        [Required]
        public virtual int AllowanceID { get; set; }
        [Required]
        public virtual decimal Claims { get; set; }
        [Required]
        public virtual decimal Commissions { get; set; }
        [Required]
        public virtual decimal Deductions { get; set; }
        [Required]
        public virtual decimal TaxDeductionAmount { get; set; }
        [Required]
        public virtual decimal TaxDeductionPercentage { get; set; }



        public static string GetTaxRule(int employee)
        {
            return new Salary().GetStringValueFromExpression(x => x.id == employee, x => x.TaxRule);
        }

        public static decimal GetBaseSalary(int employee)
        {
            return new Salary().GetDecimalValueFromExpression(x => x.Employee == employee, x => x.MonthlyBasicSalary);
        }

        
        public static decimal GetDailySalary(int employee)
        {
            var option = PayrollOption.GetAll().FirstOrDefault();
            var baseSalary = Salary.GetBaseSalary(employee);

            if (option.PerDaySalaryCalculation.Equals("Divide with Number of Days in the Salary Month"))
            {
                var days = DateTime.DaysInMonth(DateTime.Today.Year, DateTime.Today.Month);
                return baseSalary / days;
            }
            else if (option.PerDaySalaryCalculation.Equals("Divide with Specified Number of Days"))
            {
                //Missing setting
                if (option.NumberOfDayInMonth == 0)
                {
                    option.NumberOfDayInMonth = 30;
                }
                return baseSalary / option.NumberOfDayInMonth;
            }
            else
            {
                return baseSalary / 30;
            }
        }
    }
}
