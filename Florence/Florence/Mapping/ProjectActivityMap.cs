using System; 
using System.Collections.Generic; 
using System.Text; 
using FluentNHibernate.Mapping;
using Florence; 

namespace Florence.Maps {
    
    
    public class ProjectactivityMap : ClassMap<ProjectActivity> {
        
        public ProjectactivityMap() {
			Table("ProjectActivity");
			LazyLoad();
			Id(x => x.id).GeneratedBy.Identity().Column("id");
			Map(x => x.UserID).Column("UserID").Not.Nullable();
			Map(x => x.Status).Column("Status").Not.Nullable();
			Map(x => x.Title).Column("Title").Not.Nullable();
			Map(x => x.StartTime).Column("StartTime").Not.Nullable();
			Map(x => x.EndTime).Column("EndTime").Not.Nullable();
			Map(x => x.Comments).Column("Comments");
            Map(x => x.ProjectID).Column("ProjectID").Not.Nullable();

        }
    }
}
