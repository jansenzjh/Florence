using System; 
using System.Collections.Generic; 
using System.Text; 
using FluentNHibernate.Mapping;
using Florence; 

namespace Florence.Maps {
    
    
    public class OvertimeMap : ClassMap<Overtime> {
        
        public OvertimeMap() {
			Table("Overtime");
			LazyLoad();
			Id(x => x.id).GeneratedBy.Identity().Column("id");
			Map(x => x.Employee).Column("Employee").Not.Nullable();
			Map(x => x.Title).Column("Title").Not.Nullable();
			Map(x => x.OvertimeHours).Column("OvertimeHours").Not.Nullable();
			Map(x => x.TimeIn).Column("TimeIn");
			Map(x => x.TimeOut).Column("TimeOut");
			Map(x => x.Amount).Column("Amount").Not.Nullable();
			Map(x => x.Description).Column("Description").Not.Nullable();
			Map(x => x.CreatedAt).Column("CreatedAt").Not.Nullable();
			Map(x => x.CreatedBy).Column("CreatedBy").Not.Nullable();
			Map(x => x.IsRecurring).Column("IsRecurring").Not.Nullable();
			Map(x => x.RecurringCyclePerMonth).Column("RecurringCyclePerMonth").Not.Nullable();
        }
    }
}
