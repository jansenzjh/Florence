using System; 
using System.Collections.Generic; 
using System.Text; 
using FluentNHibernate.Mapping;
using Florence; 

namespace Florence.Maps {
    
    
    public class CandidatelanguageMap : ClassMap<CandidateLanguage> {
        
        public CandidatelanguageMap() {
			Table("CandidateLanguage");
			LazyLoad();
			Id(x => x.id).GeneratedBy.Identity().Column("id");
			Map(x => x.LinkID).Column("LinkID").Not.Nullable();
			Map(x => x.Language).Column("Language").Not.Nullable();
			Map(x => x.ListeningLevel).Column("ListeningLevel").Not.Nullable();
			Map(x => x.SpeakingLevel).Column("SpeakingLevel").Not.Nullable();
			Map(x => x.ReadingLevel).Column("ReadingLevel").Not.Nullable();
			Map(x => x.WritingLevel).Column("WritingLevel").Not.Nullable();
        }
    }
}
