using System; 
using System.Collections.Generic; 
using System.Text; 
using FluentNHibernate.Mapping;
using Florence; 

namespace Florence.Maps {
    
    
    public class RecruitmentcandidateMap : ClassMap<RecruitmentCandidate> {
        
        public RecruitmentcandidateMap() {
			Table("RecruitmentCandidate");
			LazyLoad();
			Id(x => x.id).GeneratedBy.Identity().Column("id");
			Map(x => x.LinkID).Column("LinkID").Not.Nullable();
			Map(x => x.Name).Column("Name").Not.Nullable();
			Map(x => x.Gender).Column("Gender").Not.Nullable();
			Map(x => x.DOB).Column("DOB").Not.Nullable();
			Map(x => x.Nationality).Column("Nationality").Not.Nullable();
			Map(x => x.JobField).Column("JobField").Not.Nullable();
			Map(x => x.HaveWorkingPermit).Column("HaveWorkingPermit");
			Map(x => x.Email).Column("Email").Not.Nullable();
			Map(x => x.Phone).Column("Phone").Not.Nullable();
			Map(x => x.Address).Column("Address").Not.Nullable();
			Map(x => x.City).Column("City").Not.Nullable();
			Map(x => x.State).Column("State").Not.Nullable();
			Map(x => x.Zip).Column("Zip").Not.Nullable();
			Map(x => x.Country).Column("Country").Not.Nullable();
			Map(x => x.Interests).Column("Interests").Not.Nullable();
			Map(x => x.Achievements).Column("Achievements").Not.Nullable();
        }
    }
}
