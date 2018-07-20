using System;
using System.Text;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using NHibernate;
using Florence.Models;
using NHibernate.Linq;
using System.Linq;

namespace Florence
{
    public enum AttendanceTypes
    {
        ClockIn = 1,
        ClockOut = 2,
        BreakIn = 3,
        BreakOut = 4
    }

    public class Attendance : ObjectBase<Attendance>
    {
        public virtual int id { get; set; }
        [Required]
        public virtual System.Guid LinkID { get; set; }
        [Required]
        public virtual int UserID { get; set; }
        [Required]
        public virtual DateTime PunchDateTime { get; set; }
        [Required]
        public virtual string CurrentPunchType { get; set; }
        public virtual string Notes { get; set; }


        /// <summary>
        /// Get the overtime minutes based on the clock out time on given date
        /// </summary>
        /// <param name="employee"></param>
        /// <param name="date"></param>
        /// <returns></returns>
        public static int GetOvertimeMinutes(int employee, DateTime date, ref DateTime punchOut)
        {
            var dayofweek = date.DayOfWeek.ToString().Substring(0, 3);
            var wsClockOut = WorkShift.GetEmployeeWorkShiftOnDay(employee, dayofweek);

            if (wsClockOut != null && wsClockOut.id > 0)
            {
                var clockOut = new Attendance().GetObjectValueFromExpression(x => x.PunchDateTime.Date == date
                                                                                && x.UserID == employee
                                                                                && x.CurrentPunchType.Equals("ClockOut"));
                punchOut = clockOut.PunchDateTime;
                var diff = clockOut.PunchDateTime.TimeOfDay - wsClockOut.RegularWorkHoursTo.TimeOfDay;
                if (diff.Hours > 0)
                {
                    return diff.Hours * 60;
                }
                else
                {
                    return 0;
                }
            }
            else
            {
                return 0;
            }
        }

        /// <summary>
        /// Get the late minutes based on the clock in time on given date
        /// </summary>
        /// <param name="employee"></param>
        /// <param name="date"></param>
        /// <returns></returns>
        public static int GetLateMinutes(int employee, DateTime date)
        {
            var dayofweek = date.DayOfWeek.ToString().Substring(0, 3);
            var wsClockIn = WorkShift.GetEmployeeWorkShiftOnDay(employee, dayofweek);

            if (wsClockIn != null && wsClockIn.id > 0)
            {
                var clockIn = new Attendance().GetObjectValueFromExpression(x => x.PunchDateTime.Date == date 
                                                                                && x.UserID == employee 
                                                                                && x.CurrentPunchType.Equals("ClockIn"));
                
                var diff = wsClockIn.RegularWorkHoursFrom.TimeOfDay - clockIn.PunchDateTime.TimeOfDay;
                if (diff.Hours > 0)
                {
                    return diff.Hours * 60;
                }
                else
                {
                    return 0;
                }
            }
            else
            {
                return 0;
            }
        }


        public static List<Attendance> GetAttendanceByDate(int employee, DateTime date)
        {
            return new Attendance().GetObjectsValueFromExpression(x => x.PunchDateTime.Date == date && x.UserID == employee);
        }

        public static Attendance GetLastPunch(int userID)
        {
            using (ISession session = NHibernateHelper.OpenSession<Attendance>())
            {
                var obj = session.Query<Attendance>().Where(x => x.UserID == userID).OrderByDescending(y => y.PunchDateTime).FirstOrDefault();
                return obj;
            }
        }
        public static Attendance GetLastPunchByType(int userID, AttendanceTypes type)
        {
            using (ISession session = NHibernateHelper.OpenSession<Attendance>())
            {
                var obj = session.Query<Attendance>().Where(x => x.UserID == userID && x.CurrentPunchType.Equals(type.ToString())).OrderByDescending(y => y.PunchDateTime).FirstOrDefault();
                if (obj == null)
                {
                    obj = new Attendance();
                }
                return obj;
            }
        }
        public static List<Attendance> GetAttendancesInRange(int userID, DateTime startDate, DateTime endDate)
        {
            return new Attendance().GetObjectsValueFromExpression(x => x.UserID == userID && x.PunchDateTime >= startDate && x.PunchDateTime <= endDate.AddDays(1));
        }
    }
}
