using System; 
using System.Collections.Generic; 
using System.Text; 
using FluentNHibernate.Mapping;
using Florence; 

namespace Florence.Maps {
    
    
    public class CandidatetrainingMap : ClassMap<CandidateTraining> {
        
        public CandidatetrainingMap() {
			Table("CandidateTraining");
			LazyLoad();
			Id(x => x.id).GeneratedBy.Identity().Column("id");
			Map(x => x.LinkID).Column("LinkID").Not.Nullable();
			Map(x => x.Field).Column("Field").Not.Nullable();
			Map(x => x.OrganizationName).Column("OrganizationName").Not.Nullable();
			Map(x => x.TrainingTitle).Column("TrainingTitle").Not.Nullable();
			Map(x => x.Location).Column("Location").Not.Nullable();
        }
    }
}
