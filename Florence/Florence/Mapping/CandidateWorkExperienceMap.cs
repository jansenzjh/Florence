using System; 
using System.Collections.Generic; 
using System.Text; 
using FluentNHibernate.Mapping;
using Florence; 

namespace Florence.Maps {
    
    
    public class CandidateworkexperienceMap : ClassMap<CandidateWorkExperience> {
        
        public CandidateworkexperienceMap() {
			Table("CandidateWorkExperience");
			LazyLoad();
			Id(x => x.id).GeneratedBy.Identity().Column("id");
			Map(x => x.LinkID).Column("LinkID").Not.Nullable();
			Map(x => x.JobField).Column("JobField").Not.Nullable();
			Map(x => x.OrganizationName).Column("OrganizationName").Not.Nullable();
			Map(x => x.Designation).Column("Designation").Not.Nullable();
			Map(x => x.StartDate).Column("StartDate").Not.Nullable();
			Map(x => x.EndDate).Column("EndDate").Not.Nullable();
			Map(x => x.JobDescription).Column("JobDescription").Not.Nullable();
        }
    }
}
