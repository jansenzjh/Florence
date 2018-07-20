using System; 
using System.Collections.Generic; 
using System.Text; 
using FluentNHibernate.Mapping;
using Florence; 

namespace Florence.Maps {
    
    
    public class CandidatescoreMap : ClassMap<CandidateScore> {
        
        public CandidatescoreMap() {
			Table("CandidateScore");
			LazyLoad();
			Id(x => x.id).GeneratedBy.Identity().Column("id");
			Map(x => x.LinkID).Column("LinkID").Not.Nullable();
			Map(x => x.DressCode).Column("DressCode").Not.Nullable();
			Map(x => x.Attitude).Column("Attitude").Not.Nullable();
			Map(x => x.CommunicationSkills).Column("CommunicationSkills").Not.Nullable();
			Map(x => x.TechnicalKnowledge).Column("TechnicalKnowledge").Not.Nullable();
			Map(x => x.Confidence).Column("Confidence").Not.Nullable();
			Map(x => x.Potential).Column("Potential").Not.Nullable();
			Map(x => x.LearningAbility).Column("LearningAbility").Not.Nullable();
			Map(x => x.MentalCapacity).Column("MentalCapacity").Not.Nullable();
			Map(x => x.AnalytialApproach).Column("AnalytialApproach").Not.Nullable();
			Map(x => x.WillingnessToWork).Column("WillingnessToWork").Not.Nullable();
            Map(x => x.RatedBy).Column("RatedBy").Not.Nullable();
        }
    }
}
