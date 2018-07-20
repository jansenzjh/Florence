using System; 
using System.Collections.Generic; 
using System.Text; 
using FluentNHibernate.Mapping;
using Florence; 

namespace Florence.Maps {
    
    
    public class PayslipAllowanceMap : ClassMap<PayslipAllowance> {
        
        public PayslipAllowanceMap() {
			Table("PayslipAllowance");
			LazyLoad();
			Id(x => x.id).GeneratedBy.Identity().Column("id");
			Map(x => x.AllowanceTitle).Column("AllowanceTitle").Not.Nullable();
			Map(x => x.IsTaxable).Column("IsTaxable").Not.Nullable();
			Map(x => x.AllowanceType).Column("AllowanceType").Not.Nullable();
			Map(x => x.Amount).Column("Amount").Not.Nullable();
			Map(x => x.Percentage).Column("Percentage").Not.Nullable();
        }
    }
}
