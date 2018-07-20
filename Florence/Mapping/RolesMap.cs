using System; 
using System.Collections.Generic; 
using System.Text; 
using FluentNHibernate.Mapping;
using Florence; 

namespace Florence.Maps {
    
    
    public class RolesMap : ClassMap<Roles> {
        
        public RolesMap() {
			Table("Roles");
			LazyLoad();
			Id(x => x.RoleId).GeneratedBy.Assigned().Column("RoleId");
			Map(x => x.RoleName).Column("RoleName").Not.Nullable();
			Map(x => x.RoleDescription).Column("RoleDescription").Not.Nullable();
        }
    }
}
