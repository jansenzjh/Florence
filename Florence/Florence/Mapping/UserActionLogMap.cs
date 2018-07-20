using System; 
using System.Collections.Generic; 
using System.Text; 
using FluentNHibernate.Mapping;
using Florence; 

namespace Florence.Maps {
    
    
    public class UserActionLogMap : ClassMap<UserActionLog> {
        
        public UserActionLogMap() {
			Table("UserActionLog");
			LazyLoad();
			Id(x => x.id).GeneratedBy.Identity().Column("id");
			Map(x => x.UserName).Column("UserName").Not.Nullable();
			Map(x => x.UserRole).Column("UserRole").Not.Nullable();
			Map(x => x.Path).Column("Path");
			Map(x => x.PathParam).Column("PathParam");
			Map(x => x.IsAuth).Column("IsAuth");
			Map(x => x.LogTime).Column("LogTime").Not.Nullable();
        }
    }
}
