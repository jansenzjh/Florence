using System; 
using System.Collections.Generic; 
using System.Text; 
using FluentNHibernate.Mapping;
using Florence; 

namespace Florence.Maps {
    
    
    public class CompanyMap : ClassMap<Company> {
        
        public CompanyMap() {
			Table("Company");
			LazyLoad();
			Id(x => x.id).GeneratedBy.Identity().Column("id");
			Map(x => x.Name).Column("Name").Not.Nullable();
			Map(x => x.Address1).Column("Address1").Not.Nullable();
			Map(x => x.Address2).Column("Address2");
			Map(x => x.City).Column("City").Not.Nullable();
			Map(x => x.State).Column("State").Not.Nullable();
			Map(x => x.Country).Column("Country").Not.Nullable();
			Map(x => x.Zip).Column("Zip").Not.Nullable();
			Map(x => x.Phone).Column("Phone").Not.Nullable();
			Map(x => x.Email).Column("Email").Not.Nullable();
			Map(x => x.Fax).Column("Fax").Not.Nullable();
			Map(x => x.Logo).Column("Logo").Not.Nullable();
			Map(x => x.URL).Column("URL").Not.Nullable();
        }
    }
}
