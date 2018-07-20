using System; 
using System.Collections.Generic; 
using System.Text; 
using FluentNHibernate.Mapping;
using Florence; 

namespace Florence.Maps {
    
    
    public class CandidatereferenceMap : ClassMap<CandidateReference> {
        
        public CandidatereferenceMap() {
			Table("CandidateReference");
			LazyLoad();
			Id(x => x.id).GeneratedBy.Identity().Column("id");
			Map(x => x.LinkID).Column("LinkID").Not.Nullable();
			Map(x => x.Name).Column("Name").Not.Nullable();
			Map(x => x.Organization).Column("Organization").Not.Nullable();
			Map(x => x.Phone).Column("Phone").Not.Nullable();
			Map(x => x.Email).Column("Email").Not.Nullable();
        }
    }
}
