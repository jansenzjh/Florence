using System; 
using System.Collections.Generic; 
using System.Text; 
using FluentNHibernate.Mapping;
using Florence; 

namespace Florence.Maps {
    
    
    public class SalaryPayslipMap : ClassMap<SalaryPayslip> {
        
        public SalaryPayslipMap() {
			Table("SalaryPayslip");
			LazyLoad();
			Id(x => x.id).GeneratedBy.Identity().Column("id");
			Map(x => x.InstanceID).Column("InstanceID").Not.Nullable();
			Map(x => x.Employee).Column("Employee").Not.Nullable();
			Map(x => x.SalaryDate).Column("SalaryDate").Not.Nullable();
			Map(x => x.StartDate).Column("StartDate").Not.Nullable();
			Map(x => x.EndDate).Column("EndDate").Not.Nullable();
			Map(x => x.Note).Column("Note").Not.Nullable();
			Map(x => x.CreatedAt).Column("CreatedAt").Not.Nullable();
			Map(x => x.CreatedBy).Column("CreatedBy").Not.Nullable();
        }
    }
}
