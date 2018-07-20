using System; 
using System.Collections.Generic; 
using System.Text; 
using FluentNHibernate.Mapping;
using Florence; 

namespace Florence.Maps {
    
    
    public class AssignmentMap : ClassMap<Assignment> {
        
        public AssignmentMap() {
			Table("Assignment");
			LazyLoad();
			Id(x => x.id).GeneratedBy.Identity().Column("id");
			Map(x => x.AssignTo).Column("AssignTo").Not.Nullable();
			Map(x => x.AssignmentName).Column("AssignmentName").Not.Nullable();
			Map(x => x.StartDate).Column("StartDate").Not.Nullable();
			Map(x => x.EndDate).Column("EndDate").Not.Nullable();
			Map(x => x.Priority).Column("Priority").Not.Nullable();
			Map(x => x.AssignmentDescription).Column("AssignmentDescription").Not.Nullable();
			Map(x => x.CreatedBy).Column("CreatedBy").Not.Nullable();
			Map(x => x.CreatedAt).Column("CreatedAt").Not.Nullable();
        }
    }
}
