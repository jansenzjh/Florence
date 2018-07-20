using System; 
using System.Collections.Generic; 
using System.Text; 
using FluentNHibernate.Mapping;
using Florence; 

namespace Florence.Maps {
    
    
    public class StateMap : ClassMap<State> {
        
        public StateMap() {
			Table("State");
			LazyLoad();
			Id(x => x.StateID).GeneratedBy.Identity().Column("StateID");
			Map(x => x.StateCode).Column("StateCode").Not.Nullable();
			Map(x => x.StateName).Column("StateName").Not.Nullable();
        }
    }
}
