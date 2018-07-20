using System; 
using System.Collections.Generic; 
using System.Text; 
using FluentNHibernate.Mapping;
using Florence; 

namespace Florence.Maps {
    
    
    public class SalaryPayslipDetailMap : ClassMap<SalaryPayslipDetail> {
        
        public SalaryPayslipDetailMap() {
			Table("SalaryPayslipDetail");
			LazyLoad();
			Id(x => x.id).GeneratedBy.Identity().Column("id");
			Map(x => x.InstanceID).Column("InstanceID").Not.Nullable();
			Map(x => x.SalaryItem).Column("SalaryItem").Not.Nullable();
			Map(x => x.Amount).Column("Amount").Not.Nullable();
        }
    }
}
