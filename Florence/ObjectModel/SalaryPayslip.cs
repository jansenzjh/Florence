using System;
using System.Text;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using Florence.Models.Shared;
using System.Linq;

namespace Florence {
    
    public class SalaryPayslip : ObjectBase<SalaryPayslip> {
        public virtual int id { get; set; }
        [Required]
        public virtual System.Guid InstanceID { get; set; }
        [Required]
        public virtual int Employee { get; set; }
        [Required]
        public virtual DateTime SalaryDate { get; set; }
        [Required]
        public virtual DateTime StartDate { get; set; }
        [Required]
        public virtual DateTime EndDate { get; set; }
        [Required]
        public virtual string Note { get; set; }
        [Required]
        public virtual DateTime CreatedAt { get; set; }
        [Required]
        public virtual int CreatedBy { get; set; }

        public virtual List<SalaryPayslipDetail> Details {
            get
            {
                var objs = new SalaryPayslipDetail().GetObjectsValueFromExpression(x => x.InstanceID == InstanceID);
                if (objs != null && objs.Count > 0)
                {
                    return objs;
                }
                else
                {
                    return new List<SalaryPayslipDetail>();
                }
            }
            set
            {
                this.Details = value;
            }
        }


        public static ResultModel ProcessPaySlip(int employee, DateTime startDate, DateTime endDate)
        {
            var result = new ResultModel();
            decimal totalSalary = 0;
            var setting = SalaryCalculation.GetAll().FirstOrDefault();
            var payslipDetail = new List<SalaryPayslipDetail>();
            var linkID = Guid.NewGuid();

            //***************Detail Handling*********************
            //Base Salary
            if (setting.IncludedBaseSalary)
            {
                var amount = Salary.GetBaseSalary(employee);
                totalSalary += amount;
                payslipDetail.Add(new SalaryPayslipDetail() { SalaryItem = "Deduction", Amount = amount, InstanceID = linkID });
            }
            //Deduction
            if (setting.IncludeDeduction)
            {
                //process the auto deduction(log to salary item table)
                var ad = new AutoDeduction();
                ad.ProcessAutoDeduction(employee, startDate, endDate);
                //Calcuate
                var amount = SalaryItem.GetSalaryTypeTotalAmount(employee, startDate, endDate, "Deductions");
                totalSalary -= amount;
                payslipDetail.Add(new SalaryPayslipDetail() { SalaryItem = "Deduction", Amount = amount, InstanceID = linkID });
            }
            //Bonus
            if (setting.IncludeBonus)
            {
                var amount = SalaryItem.GetSalaryTypeTotalAmount(employee, startDate, endDate, "Bonuses");
                totalSalary += amount;
                payslipDetail.Add(new SalaryPayslipDetail() { SalaryItem = "Bonuses", Amount = amount, InstanceID = linkID });
            }
            //Commission
            if (setting.IncludeCommission)
            {
                var amount = SalaryItem.GetSalaryTypeTotalAmount(employee, startDate, endDate, "Comissions");
                totalSalary += amount;
                payslipDetail.Add(new SalaryPayslipDetail() { SalaryItem = "Comissions", Amount = amount, InstanceID = linkID });
            }
            //Adjustments
            if (setting.IncludeAdjustment)
            {
                var amount = SalaryItem.GetSalaryTypeTotalAmount(employee, startDate, endDate, "Adjustments");
                totalSalary += amount;
                payslipDetail.Add(new SalaryPayslipDetail() { SalaryItem = "Adjustments", Amount = amount, InstanceID = linkID });
            }
            //Advance Salary
            if (setting.IncludeAdvanceSalary)
            {
                var amount = SalaryItem.GetSalaryTypeTotalAmount(employee, startDate, endDate, "Advance Salary");
                totalSalary += amount;
                payslipDetail.Add(new SalaryPayslipDetail() { SalaryItem = "Advance Salary", Amount = amount, InstanceID = linkID });
            }
            //Reimbursement
            if (setting.IncludeReimbursement)
            {
                var amount = new Reimbursement().SumValueFromExpression(x => x.Employee == employee && x.CreatedAt >= startDate && x.CreatedAt < endDate, y => y.Amount);
                totalSalary += amount;
                payslipDetail.Add(new SalaryPayslipDetail() { SalaryItem = "Reimbursement", Amount = amount, InstanceID = linkID });
            }
            //Loan
            if (setting.IncludeLoan)
            {
                var amount = new Loan().SumValueFromExpression(x => x.Employee == employee && x.CreatedAt >= startDate && x.CreatedAt < endDate, y => y.LoanAmount);
                totalSalary -= amount;
                payslipDetail.Add(new SalaryPayslipDetail() { SalaryItem = "Loan", Amount = amount, InstanceID = linkID });
            }
            //Insurance
            if (setting.IncludeInsurance)
            {
                var amount = new Insurance().SumValueFromExpression(x => x.Employee == employee && x.CreatedAt >= startDate && x.CreatedAt < endDate, y => y.EmployeeAmountPerMonth);
                totalSalary -= amount;
                payslipDetail.Add(new SalaryPayslipDetail() { SalaryItem = "Insurance", Amount = amount, InstanceID = linkID });
            }
            //Provident Fund
            if (setting.IncludeProvidentFund)
            {
                var fund = new ProvidentFund().GetObjectValueFromExpression(x => x.Employee == employee);
                decimal amount = 0;
                if (fund != null)
                {
                    if(fund.EmployeeShareAmount > 0)
                    {
                        amount = fund.EmployeeShareAmount;
                    }else if(fund.EmployeeSharePersentage > 0)
                    {
                        amount = Salary.GetBaseSalary(employee) * fund.EmployeeSharePersentage / 100;
                    }
                    totalSalary -= amount;
                    payslipDetail.Add(new SalaryPayslipDetail() { SalaryItem = "Provident Fund", Amount = amount, InstanceID = linkID });
                }
            }
            //Overtime
            if (setting.IncludeOvertime)
            {
                //Process Auto Overtime
                var at = new AutoOvertime();
                at.ProcessAutoOvertime(employee, startDate, endDate);
                //Calculate
                var amount = new Overtime().SumValueFromExpression(x => x.Employee == employee && x.CreatedAt >= startDate && x.CreatedAt < endDate, y => y.Amount);
                totalSalary += amount;
                payslipDetail.Add(new SalaryPayslipDetail() { SalaryItem = "Overtime", Amount = amount, InstanceID = linkID });
            }
            //Tax, HAVE TO CALCULATE IN THE LAST PLACE
            if (!TaxExemptEmployee.IsEmployeeExempt(employee))
            {
                var amount = TaxRule.GetTax(totalSalary, Salary.GetTaxRule(employee));
                totalSalary -= amount;
                payslipDetail.Add(new SalaryPayslipDetail() { SalaryItem = "Tax", Amount = amount, InstanceID = linkID });
            }

            var fullModel = new SalaryPayslip()
            {
                CreatedAt = DateTime.Now,
                CreatedBy = 1,
                Employee = employee,
                StartDate = startDate,
                EndDate = endDate,
                InstanceID = linkID,
                SalaryDate = DateTime.Now,
                Note = string.Format("Payslip for {0} from {1} to {2}", Florence.Employee.GetName(employee), startDate.ToLongDateString(), endDate.ToLongDateString())
            };

            result = fullModel.Insert();
            if (result.BooleanResult)
            {
                foreach(var dt in payslipDetail)
                {
                    dt.Insert();
                }
            }
            return result;
        }

    }
}
