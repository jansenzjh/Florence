using System; 
using System.Collections.Generic; 
using System.Text; 
using FluentNHibernate.Mapping;
using Florence; 

namespace Florence.Maps {
    
    
    public class AutoOvertimeMap : ClassMap<AutoOvertime> {
        
        public AutoOvertimeMap() {
			Table("AutoOvertime");
			LazyLoad();
			Id(x => x.id).GeneratedBy.Identity().Column("id");
			Map(x => x.MinutesFrom).Column("MinutesFrom").Not.Nullable();
			Map(x => x.MinutesTo).Column("MinutesTo").Not.Nullable();
			Map(x => x.OvertimeAmountType).Column("OvertimeAmountType").Not.Nullable();
			Map(x => x.Amount).Column("Amount").Not.Nullable();
        }
    }
}
