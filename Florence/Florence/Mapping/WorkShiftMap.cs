using System; 
using System.Collections.Generic; 
using System.Text; 
using FluentNHibernate.Mapping;
using Florence; 

namespace Florence.Maps {
    
    
    public class WorkShiftMap : ClassMap<WorkShift> {
        
        public WorkShiftMap() {
			Table("WorkShift");
			LazyLoad();
			Id(x => x.id).GeneratedBy.Identity().Column("id");
			Map(x => x.InstanceID).Column("InstanceID").Not.Nullable();
			Map(x => x.WorkShiftTitle).Column("WorkShiftTitle");
			Map(x => x.WorkDays).Column("WorkDays").Not.Nullable();
			Map(x => x.RegularWorkHoursFrom).Column("RegularWorkHoursFrom").Not.Nullable().CustomType("time");
			Map(x => x.RegularWorkHoursTo).Column("RegularWorkHoursTo").Not.Nullable().CustomType("time");
			Map(x => x.LunchBreakHoursFrom).Column("LunchBreakHoursFrom").Not.Nullable().CustomType("time");
			Map(x => x.LunchBreakHoursTo).Column("LunchBreakHoursTo").Not.Nullable().CustomType("time");
			Map(x => x.AdditionalBreakHoursFrom).Column("AdditionalBreakHoursFrom").Not.Nullable().CustomType("time");
			Map(x => x.AdditionalBreakHoursTo).Column("AdditionalBreakHoursTo").Not.Nullable().CustomType("time");
        }
    }
}
