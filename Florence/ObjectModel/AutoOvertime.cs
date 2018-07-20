using System;
using System.Text;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;


namespace Florence {
    
    public class AutoOvertime : ObjectBase<AutoOvertime> {
        public virtual int id { get; set; }
        [Required]
        public virtual int MinutesFrom { get; set; }
        [Required]
        public virtual int MinutesTo { get; set; }
        [Required]
        public virtual string OvertimeAmountType { get; set; }
        [Required]
        public virtual decimal Amount { get; set; }



        private List<Overtime> _ProcessAutoOvertime(int employee, DateTime fromDate, DateTime toDate)
        {

            var dailySalary = Salary.GetDailySalary(employee);
            var autoOts = AutoOvertime.GetAll();
            var ded = autoOts.FirstOrDefault();
            var autoOvertimeList = new List<Overtime>();

            //Loop between date range to add deduction day by day
            var tempDate = fromDate;
            while (tempDate < toDate)
            {
                var otModel = GetOvertimeAmountDaily(employee, tempDate, dailySalary, autoOts);
                autoOvertimeList.Add(otModel);
                //Insert into Deduction Table
                otModel.Insert();
                //Next day
                tempDate.AddDays(1);

            }
            return autoOvertimeList;
        }

        public virtual void ProcessAutoOvertime(int employee, DateTime fromDate, DateTime toDate)
        {
            _ProcessAutoOvertime(employee, fromDate, toDate);
        }

        public static decimal GetOvertimeAmount(int employee, DateTime fromDate, DateTime toDate)
        {

            var dailySalary = Salary.GetDailySalary(employee);
            var autoOts = AutoOvertime.GetAll();
            var ded = autoOts.FirstOrDefault();
            decimal totalAmount = 0;

            //Loop between date range to add deduction day by day
            var tempDate = fromDate;
            while (tempDate < toDate)
            {
                totalAmount += GetOvertimeAmountDaily(employee, tempDate, dailySalary, autoOts).Amount;
                tempDate.AddDays(1);
            }
            return totalAmount;
        }

        public static Overtime GetOvertimeAmountDaily(
            int employee, 
            DateTime date, 
            decimal dailySalary = 0, 
            List<AutoOvertime> autoOts = null,
            int otMinutes = 0)
        {
            decimal totalAmount = 0;
            var punchout = new DateTime();
            //Init data if need
            if (dailySalary == 0)
            {
                dailySalary = Salary.GetDailySalary(employee);
            }
            if (autoOts == null)
            {
                autoOts = AutoOvertime.GetAll();
            }
            if (otMinutes == 0)
            {
                otMinutes = Attendance.GetOvertimeMinutes(employee, date, ref punchout);
            }

            foreach (AutoOvertime ot in autoOts.OrderBy(x => x.MinutesTo).ToList())
            {
                if(ot.MinutesFrom >= otMinutes && ot.MinutesTo < otMinutes)
                {
                    totalAmount = GetOvertimeAmountByType(ot.OvertimeAmountType, dailySalary, ot.Amount);
                }
            }

            var ovtm = new Overtime()
            {
                Amount = totalAmount,
                CreatedAt = DateTime.Now,
                CreatedBy = 1,
                Employee = employee,
                IsRecurring = false,
                OvertimeHours = otMinutes % 60 + 1,
                TimeIn = punchout,
                TimeOut = punchout.AddMinutes(otMinutes * -1),
                RecurringCyclePerMonth = 0,
                Title = string.Format("Auto Overtime for Employee {0} on {1}", Employee.GetName(employee), DateTime.Today.ToShortDateString()),
                Description = string.Format("{0}: OT {1} Minutes, Added {2}", date.ToShortDateString(), otMinutes, totalAmount)
            };

            return ovtm;
        }

        private static decimal GetOvertimeAmountByType(string type, decimal dailySalary, decimal specialAmount)
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
}
