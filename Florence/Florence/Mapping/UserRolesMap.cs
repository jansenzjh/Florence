using System; 
using System.Collections.Generic; 
using System.Text; 
using FluentNHibernate.Mapping;
using Florence; 

namespace Florence.Maps {
    
    
    public class UserRolesMap : ClassMap<UserRoles> {
        
        public UserRolesMap() {
			Table("UserRoles");
			LazyLoad();
			Id(x => x.UserRoleId).GeneratedBy.Identity().Column("UserRoleId");
			References(x => x.UserId).Column("UserId").Not.Nullable().Not.LazyLoad();
			References(x => x.RoleId).Column("RoleId").Not.Nullable().Not.LazyLoad();
        }
    }
}
