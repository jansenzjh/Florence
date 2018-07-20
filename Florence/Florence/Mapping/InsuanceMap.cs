using System; 
using System.Collections.Generic; 
using System.Text; 
using FluentNHibernate.Mapping;
using Florence; 

namespace Florence.Maps {
    
    
    public class InsuranceMap : ClassMap<Insurance> {
        
        public InsuranceMap() {
			Table("Insurance");
			LazyLoad();
			Id(x => x.id).GeneratedBy.Identity().Column("id");
			Map(x => x.Employee).Column("Employee").Not.Nullable();
			Map(x => x.InsuranceType).Column("InsuranceType").Not.Nullable();
			Map(x => x.Title).Column("Title").Not.Nullable();
			Map(x => x.EmployeeAmountPerMonth).Column("EmployeeAmountPerMonth").Not.Nullable();
			Map(x => x.OrganizationSharePerMonth).Column("OrganizationSharePerMonth").Not.Nullable();
			Map(x => x.CreatedAt).Column("CreatedAt").Not.Nullable();
			Map(x => x.CreatedBy).Column("CreatedBy").Not.Nullable();
        }
    }
}
