using System; 
using System.Collections.Generic; 
using System.Text; 
using FluentNHibernate.Mapping;
using Florence; 

namespace Florence.Maps {
    
    
    public class SalaryCalculationMap : ClassMap<SalaryCalculation> {
        
        public SalaryCalculationMap() {
			Table("SalaryCalculation");
			LazyLoad();
			Id(x => x.id).GeneratedBy.Identity().Column("id");
			Map(x => x.IncludedBaseSalary).Column("IncludedBaseSalary").Not.Nullable();
			Map(x => x.IncludeDeduction).Column("IncludeDeduction").Not.Nullable();
			Map(x => x.IncludeBonus).Column("IncludeBonus").Not.Nullable();
			Map(x => x.IncludeCommission).Column("IncludeCommission").Not.Nullable();
			Map(x => x.IncludeAdjustment).Column("IncludeAdjustment").Not.Nullable();
			Map(x => x.IncludeReimbursement).Column("IncludeReimbursement").Not.Nullable();
			Map(x => x.IncludeOvertime).Column("IncludeOvertime").Not.Nullable();
			Map(x => x.IncludeProvidentFund).Column("IncludeProvidentFund").Not.Nullable();
			Map(x => x.IncludeAdvanceSalary).Column("IncludeAdvanceSalary").Not.Nullable();
			Map(x => x.IncludeLoan).Column("IncludeLoan").Not.Nullable();
			Map(x => x.IncludeInsurance).Column("IncludeInsurance").Not.Nullable();
        }
    }
}
