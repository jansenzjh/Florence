using System; 
using System.Collections.Generic; 
using System.Text; 
using FluentNHibernate.Mapping;
using Florence; 

namespace Florence.Maps {
    
    
    public class CandidateskillMap : ClassMap<CandidateSkill> {
        
        public CandidateskillMap() {
			Table("CandidateSkill");
			LazyLoad();
			Id(x => x.id).GeneratedBy.Identity().Column("id");
			Map(x => x.LinkID).Column("LinkID").Not.Nullable();
			Map(x => x.SkillName).Column("SkillName").Not.Nullable();
			Map(x => x.SkillLevel).Column("SkillLevel").Not.Nullable();
        }
    }
}
