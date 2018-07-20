using System; 
using System.Collections.Generic; 
using System.Text; 
using FluentNHibernate.Mapping;
using Florence; 

namespace Florence.Maps {
    
    
    public class ExtraPayrollItemsMap : ClassMap<ExtraPayrollItems> {
        
        public ExtraPayrollItemsMap() {
			Table("ExtraPayrollItems");
			LazyLoad();
			Id(x => x.id).GeneratedBy.Identity().Column("id");
			Map(x => x.PayrollItemName).Column("PayrollItemName").Not.Nullable();
			Map(x => x.Amount).Column("Amount").Not.Nullable();
        }
    }
}
