using System; 
using System.Collections.Generic; 
using System.Text; 
using FluentNHibernate.Mapping;
using Florence; 

namespace Florence.Maps {
    
    
    public class WarningMap : ClassMap<Warning> {
        
        public WarningMap() {
			Table("Warning");
			LazyLoad();
			Id(x => x.id).GeneratedBy.Identity().Column("id");
			Map(x => x.WarningTo).Column("WarningTo").Not.Nullable();
			Map(x => x.WarningBy).Column("WarningBy").Not.Nullable();
			Map(x => x.WarningDate).Column("WarningDate").Not.Nullable();
			Map(x => x.Subject).Column("Subject").Not.Nullable();
			Map(x => x.Description).Column("Description").Not.Nullable();
			Map(x => x.CreatedBy).Column("CreatedBy").Not.Nullable();
			Map(x => x.CreatedAt).Column("CreatedAt").Not.Nullable();
        }
    }
}
