using System; 
using System.Collections.Generic; 
using System.Text; 
using FluentNHibernate.Mapping;
using Florence; 

namespace Florence.Maps {
    
    
    public class ProjectMap : ClassMap<Project> {
        
        public ProjectMap() {
			Table("Project");
			LazyLoad();
			Id(x => x.id).GeneratedBy.Identity().Column("id");
			Map(x => x.Name).Column("Name").Not.Nullable();
			Map(x => x.Description).Column("Description");
			Map(x => x.Status).Column("Status").Not.Nullable();
			Map(x => x.ClientID).Column("ClientID");
			Map(x => x.ClientSID).Column("ClientSID").Not.Nullable();
			Map(x => x.Version).Column("Version").Not.Nullable();
			Map(x => x.Completed).Column("Completed").Not.Nullable();
			Map(x => x.LastUpdated).Column("LastUpdated").Not.Nullable();
			Map(x => x.Priority).Column("Priority").Not.Nullable();
			Map(x => x.CreateBy).Column("CreateBy").Not.Nullable();
			Map(x => x.CreateAt).Column("CreateAt").Not.Nullable();
        }
    }
}
