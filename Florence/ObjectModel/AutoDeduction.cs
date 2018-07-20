using System;
using System.Text;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;


namespace Florence {
    
    public enum RegularWorkingHours
    {
        FullDay = 8,
        HalfDay = 3,

    }

    public class AutoDeduction : ObjectBase<AutoDeduction> {
        public virtual int id { get; set; }
        [Required]
        public virtual bool ForAbsence { get; set; }
        [Required]
        public virtual decimal AbsenceAmount { get; set; }
        [Required]
        public virtual bool ForLeaveWithoutPay { get; set; }
        [Required]
        public virtual decimal LeaveWithoutPayAmount { get; set; }
        [Required]
        public virtual bool ForHalfDayLeave { get; set; }
        [Required]
        public virtual decimal HalfDayLeaveAmount { get; set; }
        [Required]
        public virtual bool ForLateAttendance { get; set; }
        [Required]
        public virtual int LateMinutesFrom { get; set; }
        [Required]
        public virtual int LateMinutesTo { get; set; }
        [Required]
        public virtual decimal Amount { get; set; }


        [Required]
        public virtual string LateAmountType { get; set; }
        [Required]
        public virtual string AbsenceAmountType { get; set; }
        [Required]
        public virtual string LeaveWithoutPayAmountType { get; set; }
        [Required]
        public virtual string HalfDayLeaveAmountType { get; set; }

        public virtual Guid LinkID { get; set; }


        public static decimal LateAttendanceDeductedAmount(int employee, DateTime date, decimal dailySalary = 0, List<AutoDeduction> autoDeds = null, int lateMinutes = 0)
        {

            if(dailySalary == 0)
            {
                dailySalary = Salary.GetDailySalary(employee);
            }
            if(autoDeds == null)
            {
                autoDeds = AutoDeduction.GetAll();
            }
            if(lateMinutes == 0)
            {
                lateMinutes = Attendance.GetLateMinutes(employee, date);
            }

            decimal totalAmount = 0;
            foreach (var ad in autoDeds.OrderBy(x => x.LateMinutesTo).ToList())
            {
                if(lateMinutes >= ad.LateMinutesFrom && lateMinutes < ad.LateMinutesTo)
                {
                    totalAmount = GetDeductionAmountByType(ad.LateAmountType, dailySalary, ad.Amount);
                }
            }
            return totalAmount;
        }

        
        public static SalaryItem GetDeductionAmountDaily(int employee, 
            DateTime date, 
            decimal dailySalary = 0, 
            List<AutoDeduction> autoDeds = null, 
            int lateMinutes = 0)
        {
            //Init data if need
            if (dailySalary == 0)
            {
                dailySalary = Salary.GetDailySalary(employee);
            }
            if (autoDeds == null)
            {
                autoDeds = AutoDeduction.GetAll();
            }
            if (lateMinutes == 0)
            {
                lateMinutes = Attendance.GetLateMinutes(employee, date);
            }

            var ded = autoDeds.FirstOrDefault();
            decimal totalAmount = 0;

            //Get the amount based on the lated minutes
            if(ded.ForAbsence && lateMinutes > Convert.ToInt32(RegularWorkingHours.FullDay) * 60)
            {
                totalAmount = GetDeductionAmountByType(ded.AbsenceAmountType, dailySalary, ded.AbsenceAmount);
            }
            else if (ded.ForHalfDayLeave && lateMinutes > Convert.ToInt32(RegularWorkingHours.HalfDay ) * 60)
            {
                totalAmount = GetDeductionAmountByType(ded.HalfDayLeaveAmountType, dailySalary, ded.HalfDayLeaveAmount);
            }
            else if(ded.ForLateAttendance)
            {
                totalAmount = LateAttendanceDeductedAmount(employee, date, dailySalary, autoDeds, lateMinutes);
            }

            //Return model with all data it needs
            var deduct = new SalaryItem()
            {
                Amount = totalAmount,
                CreatedAt = DateTime.Now,
                CreatedBy = 1,
                Employee = employee,
                IsRecurring = false,
                RecurringCyclePerMonth = 0,
                SalaryItemType = "Deductions",
                Title = string.Format("Auto Deductions for Employee {0} on {1}", Employee.GetName(employee), DateTime.Today.ToShortDateString()),
                Description = string.Format("{0}: Late {1} Minutes, deducted {2}", date.ToShortDateString(), lateMinutes, totalAmount)
            };
            
            return deduct;
        }


        /// <summary>
        /// Get the Auto Deduction Amount in a given date rage. 
        /// </summary>
        /// <param name="employee"></param>
        /// <param name="fromDate"></param>
        /// <param name="toDate"></param>
        /// <returns></returns>
        public static decimal GetAutoDeductionAmount(int employee, DateTime fromDate, DateTime toDate)
        {

            var dailySalary = Salary.GetDailySalary(employee);
            var autoDeds = AutoDeduction.GetAll();
            var ded = autoDeds.FirstOrDefault();
            decimal totalAmount = 0;

            //Loop between date range to add deduction day by day
            var tempDate = fromDate;
            while (tempDate < toDate)
            {
                totalAmount += GetDeductionAmountDaily(employee, tempDate, dailySalary, autoDeds).Amount;
                tempDate.AddDays(1);
            }
            return totalAmount;
        }

        public virtual void ProcessAutoDeduction(int employee, DateTime fromDate, DateTime toDate)
        {
            _ProcessAutoDeduction(employee, fromDate, toDate);
        }

        private List<SalaryItem> _ProcessAutoDeduction(int employee, DateTime fromDate, DateTime toDate)
        {

            //AutoDeduction.GetAutoDeductionAmount(employee, fromDate, toDate, true);
            var dailySalary = Salary.GetDailySalary(employee);
            var autoDeds = AutoDeduction.GetAll();
            var ded = autoDeds.FirstOrDefault();
            var autoDeductList = new List<SalaryItem>();
            
            //Loop between date range to add deduction day by day
            var tempDate = fromDate;
            while (tempDate < toDate)
            {
                var deductModel = GetDeductionAmountDaily(employee, tempDate, dailySalary, autoDeds);
                autoDeductList.Add(deductModel);
                //Insert into Deduction Table
                deductModel.Insert();
                //Next day
                tempDate.AddDays(1);
                
            }
            return autoDeductList;
        }


        private static decimal GetDeductionAmountByType(string type, decimal dailySalary, decimal specialAmount)
        {
            var weight = AutoAmountTypes.GetWeightByType(type);
            if (type.Equals("Specified Amount"))
            {
                return specialAmount;
            }
            else
            {
                return dailySalary * weight;
            }
        }
    }

    

    //Completely hardcoded model, hehe
    public class AutoAmountTypes
    {
        public string[] Types
        {
            get
            {
                return new string[]
                {
                    "Specified Amount",
                    "Per Day Salary",
                    "Half Day Salary",
                    "Quarter Day Salary",
                    "Two Days Salary"
                };
            }
        }
        

        public static decimal GetWeightByType(string type)
        {
            var obj = new AutoAmountTypes();
            foreach(var t in obj.Types)
            {
                if (t.Equals("Specified Amount"))
                {
                    return 0;
                }
                else if (t.Equals("Per Day Salary"))
                {
                    return 1;
                }
                else if (t.Equals("Half Day Salary"))
                {
                    return Convert.ToDecimal(0.5);
                }
                else if (t.Equals("Quarter Day Salary"))
                {
                    return Convert.ToDecimal(0.25);
                }
                else if (t.Equals("Two Days Salary"))
                {
                    return 2;
                }
            }
            return 0;
        }
    }
}


