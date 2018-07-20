using System;
using System.Text;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;


namespace Florence {
    
    public class TaxExemptEmployee : ObjectBase<TaxExemptEmployee> {
        public virtual int id { get; set; }
        [Required]
        public virtual int Employee { get; set; }


        public static bool IsEmployeeExempt(int employee)
        {
            return (new TaxExemptEmployee().CountFromExpression(x => x.Employee == employee)) > 0;
        }

        public static List<Employee> UnexemptEmployeeList(List<Employee> employeeList = null)
        {
            if(employeeList == null)
            {
                employeeList = Florence.Employee.GetAll();
            }

            var exemptEmp = new TaxExemptEmployee().GetIntListFromExpression(x => x.id > 0, x => x.id);

            foreach (var exId in exemptEmp)
            {
                if (employeeList.Select(x => x.id).Contains(exId))
                {
                    employeeList = employeeList.Where(x => x.id != exId).ToList();
                }
            }
            return employeeList;
        }
    }

}
