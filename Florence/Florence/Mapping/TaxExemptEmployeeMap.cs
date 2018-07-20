using System; 
using System.Collections.Generic; 
using System.Text; 
using FluentNHibernate.Mapping;
using Florence; 

namespace Florence.Maps {
    
    
    public class TaxExemptEmployeeMap : ClassMap<TaxExemptEmployee> {
        
        public TaxExemptEmployeeMap() {
			Table("TaxExemptEmployee");
			LazyLoad();
			Id(x => x.id).GeneratedBy.Identity().Column("id");
			Map(x => x.Employee).Column("Employee").Not.Nullable();
        }
    }
}
