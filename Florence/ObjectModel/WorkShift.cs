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
    
    public class WorkShift : ObjectBase<WorkShift> {
        public virtual int id { get; set; }
        [Required]
        public virtual System.Guid InstanceID { get; set; }
        public virtual string WorkShiftTitle { get; set; }
        [Required]
        public virtual string WorkDays { get; set; }
        [Required]
        public virtual DateTime RegularWorkHoursFrom { get; set; }
        [Required]
        public virtual DateTime RegularWorkHoursTo { get; set; }
        [Required]
        public virtual DateTime LunchBreakHoursFrom { get; set; }
        [Required]
        public virtual DateTime LunchBreakHoursTo { get; set; }
        [Required]
        public virtual DateTime AdditionalBreakHoursFrom { get; set; }
        [Required]
        public virtual DateTime AdditionalBreakHoursTo { get; set; }



        public static List<string> WorkShiftList(Boolean includeEmptyHeader = true)
        {
            using (ISession session = NHibernateHelper.OpenSession<WorkShift>())
            {
                var list = session.Query<WorkShift>().Select(x => x.WorkShiftTitle).Distinct().ToList();
                if (includeEmptyHeader)
                {
                    list.Insert(0, string.Empty);
                }
                return list;
            }
        }

        public static List<WorkShift> GetEmployeeWorkShift(int employee)
        {
            return new WorkShift().GetObjectsValueFromExpression(x => x.WorkShiftTitle.Equals(Employee.GetWorkShift(employee)));
        }

        public static WorkShift GetEmployeeWorkShiftOnDay(int employee, string dayOfWeek)
        {
            if(dayOfWeek.Length > 3)
            {
                dayOfWeek = dayOfWeek.Substring(0, 3);
            }
            return new WorkShift().GetObjectValueFromExpression(x => x.WorkShiftTitle.Equals(Employee.GetWorkShift(employee)) && x.WorkDays.Equals(dayOfWeek));
        }
    }
}
