using System; 
using System.Collections.Generic; 
using System.Text; 
using FluentNHibernate.Mapping;
using Florence; 

namespace Florence.Maps {
    
    
    public class CandidateEducationMap : ClassMap<CandidateEducation> {
        
        public CandidateEducationMap() {
			Table("CandidateEducation");
			LazyLoad();
			Id(x => x.id).GeneratedBy.Identity().Column("id");
			Map(x => x.LinkID).Column("LinkID").Not.Nullable();
			Map(x => x.Degree).Column("Degree").Not.Nullable();
			Map(x => x.Subject).Column("Subject").Not.Nullable();
			Map(x => x.Institute).Column("Institute").Not.Nullable();
			Map(x => x.Grade).Column("Grade").Not.Nullable();
			Map(x => x.GraduationYear).Column("GraduationYear").Not.Nullable();
        }
    }
}
