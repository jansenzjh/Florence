using System; 
using System.Collections.Generic; 
using System.Text; 
using FluentNHibernate.Mapping;
using Florence; 

namespace Florence.Maps {
    
    
    public class ProvidentFundMap : ClassMap<ProvidentFund> {
        
        public ProvidentFundMap() {
			Table("ProvidentFund");
			LazyLoad();
			Id(x => x.id).GeneratedBy.Identity().Column("id");
			Map(x => x.Employee).Column("Employee").Not.Nullable();
			Map(x => x.EmployeeShareAmount).Column("EmployeeShareAmount").Not.Nullable();
			Map(x => x.EmployeeSharePersentage).Column("EmployeeSharePersentage").Not.Nullable();
			Map(x => x.OrganizationShareAmount).Column("OrganizationShareAmount").Not.Nullable();
			Map(x => x.OrganizationSharePersentage).Column("OrganizationSharePersentage").Not.Nullable();
			Map(x => x.Description).Column("Description").Not.Nullable();
        }
    }
}
