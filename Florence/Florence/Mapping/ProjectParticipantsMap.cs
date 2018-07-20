using System; 
using System.Collections.Generic; 
using System.Text; 
using FluentNHibernate.Mapping;
using Florence; 

namespace Florence.Maps {
    
    
    public class ProjectparticipantsMap : ClassMap<ProjectParticipants> {
        
        public ProjectparticipantsMap() {
			Table("ProjectParticipants");
			LazyLoad();
			Id(x => x.id).GeneratedBy.Identity().Column("id");
			Map(x => x.ProjectId).Column("ProjectId").Not.Nullable();
			Map(x => x.Participants).Column("Participants").Not.Nullable();
        }
    }
}
