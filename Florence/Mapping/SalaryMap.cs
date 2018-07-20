using System; 
using System.Collections.Generic; 
using System.Text; 
using FluentNHibernate.Mapping;
using Florence; 

namespace Florence.Maps {
    
    
    public class SalaryMap : ClassMap<Salary> {
        
        public SalaryMap() {
			Table("Salary");
			LazyLoad();
			Id(x => x.id).GeneratedBy.Identity().Column("id");
			Map(x => x.Employee).Column("Employee").Not.Nullable();
			Map(x => x.SalaryType).Column("SalaryType").Not.Nullable();
            Map(x => x.Currency).Column("Currency");
			Map(x => x.TaxRule).Column("TaxRule").Not.Nullable();
			Map(x => x.OvertimeRate).Column("OvertimeRate").Not.Nullable();
			Map(x => x.AnnualGrossSalary).Column("AnnualGrossSalary").Not.Nullable();
			Map(x => x.MonthlyBasicSalary).Column("MonthlyBasicSalary").Not.Nullable();
			Map(x => x.AllowanceID).Column("AllowanceID").Not.Nullable();
			Map(x => x.Claims).Column("Claims").Not.Nullable();
			Map(x => x.Commissions).Column("Commissions").Not.Nullable();
			Map(x => x.Deductions).Column("Deductions").Not.Nullable();
			Map(x => x.TaxDeductionAmount).Column("TaxDeductionAmount").Not.Nullable();
			Map(x => x.TaxDeductionPercentage).Column("TaxDeductionPercentage").Not.Nullable();
        }
    }
}
