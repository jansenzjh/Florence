using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Florence
{
    public class SPEmployeeDashboardModel: ObjectBase<SPEmployeeDashboardModel>
    {
        public virtual string Type { get; set; }
        public virtual string Category { get; set; }
        public virtual string DepartmentName { get; set; }
        public virtual string Designation { get; set; }
        public virtual string Gender { get; set; }
        public virtual string EmployeeName { get; set; }
        public virtual bool IsActive { get; set; }
        public virtual string WorkShift { get; set; }
        public virtual decimal MonthlyBasicSalary { get; set; }
        public virtual string SalaryType { get; set; }
        public virtual string TaxRule { get; set; }
        public virtual decimal Amount { get; set; }
        public virtual string SalaryItemType { get; set; }


        public virtual List<SPEmployeeDashboardModel> GetEmployeeDashboard()
        {
            return _GetEmployeeDashboard("exec SPEmploymentDashboard");
        }

        private List<SPEmployeeDashboardModel> _GetEmployeeDashboard(string sqlString)
        {
            var objs = new SPEmployeeDashboardModel().ExecStoreProcedure(sqlString);
            var returnList = new List<SPEmployeeDashboardModel>();
            if(objs != null && objs.Count > 0)
            {
                foreach (Object[] obj in objs)
                {
                    var ed = new SPEmployeeDashboardModel();
                    ed.Type = (string)obj[0];
                    ed.Category = (string)obj[1];
                    ed.DepartmentName = (string)obj[2];
                    ed.Designation = (string)obj[3];
                    ed.Gender = (string)obj[4];
                    ed.EmployeeName = (string)obj[5];
                    ed.IsActive = (bool)obj[6];
                    ed.WorkShift = (string)obj[7];
                    ed.MonthlyBasicSalary = (decimal)obj[8];
                    ed.SalaryType = (string)obj[9];
                    ed.TaxRule = (string)obj[10];
                    ed.Amount = (decimal)obj[11];
                    ed.SalaryItemType = (string)obj[12];
                    returnList.Add(ed);
                }
                return returnList;
            }
            else
            {
                return new List<SPEmployeeDashboardModel>();
            }

        }
        

    }

}