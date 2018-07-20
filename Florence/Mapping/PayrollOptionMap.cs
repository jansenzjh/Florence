using System; 
using System.Collections.Generic; 
using System.Text; 
using FluentNHibernate.Mapping;
using Florence; 

namespace Florence.Maps {
    
    
    public class PayrollOptionMap : ClassMap<PayrollOption> {
        
        public PayrollOptionMap() {
			Table("PayrollOption");
			LazyLoad();
			Id(x => x.id).GeneratedBy.Identity().Column("id");
			Map(x => x.PayrollMethod).Column("PayrollMethod").Not.Nullable();
			Map(x => x.AutoApprovePayroll).Column("AutoApprovePayroll").Not.Nullable();
			Map(x => x.PayrollApprovedBy).Column("PayrollApprovedBy").Not.Nullable();
			Map(x => x.AutoEmailPayslips).Column("AutoEmailPayslips").Not.Nullable();
			Map(x => x.PerDaySalaryCalculation).Column("PerDaySalaryCalculation").Not.Nullable();
			Map(x => x.NumberOfDayInMonth).Column("NumberOfDayInMonth").Not.Nullable();
            Map(x => x.PayrollCurrency).Column("PayrollCurrency");//.Not.Nullable();
			Map(x => x.PayslipTitle).Column("PayslipTitle").Not.Nullable();
			Map(x => x.PayslipFormat).Column("PayslipFormat").Not.Nullable();
			Map(x => x.BasicSalaryType).Column("BasicSalaryType").Not.Nullable();
			Map(x => x.BasicSalaryPercentage).Column("BasicSalaryPercentage").Not.Nullable();
        }
    }
}
