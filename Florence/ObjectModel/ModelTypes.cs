using System;
using System.Text;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;


namespace Florence {

    public enum ModelTypesKeys
    {
        PolicyTypes = 1,
        GenderTypes = 2,
        JobTypes = 3,
        EmployeeTypes = 4,
        EmployeeCategory = 5,
        SalutationTypes = 6,
        Priority = 7,
        ContractTypes = 8,
        EmployeeExitTypes = 9,
        PerDaySalaryCalculationTypes = 10,
        PayslipFormatTypes = 11,
        BasicSalaryTypes = 12,
        PayrollMethodTypes = 13,
        AutoApprovePayrollTypes = 14,
        SalaryTypes = 15,
        SalaryItemTypes = 16,
        InsuranceTypes = 17,
        LeaveTypes = 18,
        TrainingTypes = 19,
        NatureOfTrainingTypes = 20,
        ReimbursementCategory = 21
    }

    public class ModelTypes : ObjectBase<ModelTypes> {
        public virtual int id { get; set; }
        [Required]
        public virtual string ModelName { get; set; }
        [Required]
        public virtual string TypesArray { get; set; }
        

        public static List<string> GetTypes(ModelTypesKeys type, Boolean includeEmptyHeader = true)
        {
            var list = new List<string>();
            var rawString = ModelTypes.GetAll().Where(x => x.ModelName.Equals(Enum.GetName(typeof(ModelTypesKeys), type))).Select(x => x.TypesArray).FirstOrDefault();
            
            if (!string.IsNullOrEmpty(rawString))
            {
                list = rawString.Split(',').Where(x => x.Length > 0).ToList();
                if (includeEmptyHeader)
                {
                    list.Insert(0, string.Empty);
                }
                return list;
            }
            return list;
        }


    }
    

}
