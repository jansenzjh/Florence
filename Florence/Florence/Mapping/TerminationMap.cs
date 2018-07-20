using System; 
using System.Collections.Generic; 
using System.Text; 
using FluentNHibernate.Mapping;
using Florence; 

namespace Florence.Maps {
    
    
    public class TerminationMap : ClassMap<Termination> {
        
        public TerminationMap() {
			Table("Termination");
			LazyLoad();
			Id(x => x.id).GeneratedBy.Identity().Column("id");
			Map(x => x.TerminatedTo).Column("TerminatedTo").Not.Nullable();
			Map(x => x.ForwardApplicationTo).Column("ForwardApplicationTo").Not.Nullable();
			Map(x => x.TerminationDate).Column("TerminationDate").Not.Nullable();
			Map(x => x.Description).Column("Description").Not.Nullable();
			Map(x => x.CreatedBy).Column("CreatedBy").Not.Nullable();
			Map(x => x.CreatedAt).Column("CreatedAt").Not.Nullable();
        }
    }
}
