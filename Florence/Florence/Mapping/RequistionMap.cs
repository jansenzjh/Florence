using System; 
using System.Collections.Generic; 
using System.Text; 
using FluentNHibernate.Mapping;
using Florence; 

namespace Florence.Maps {
    
    
    public class RequistionMap : ClassMap<Requistion> {
        
        public RequistionMap() {
			Table("Requistion");
			LazyLoad();
			Id(x => x.id).GeneratedBy.Identity().Column("id");
			Map(x => x.RequistionBy).Column("RequistionBy").Not.Nullable();
			Map(x => x.RequistionType).Column("RequistionType").Not.Nullable();
			Map(x => x.Title).Column("Title").Not.Nullable();
			Map(x => x.Priority).Column("Priority").Not.Nullable();
			Map(x => x.RequistionDescription).Column("RequistionDescription").Not.Nullable();
			Map(x => x.CreatedBy).Column("CreatedBy").Not.Nullable();
			Map(x => x.CreatedAt).Column("CreatedAt").Not.Nullable();
        }
    }
}
