using System; 
using System.Collections.Generic; 
using System.Text; 
using FluentNHibernate.Mapping;
using Florence; 

namespace Florence.Maps {
    
    
    public class HourlyWageMap : ClassMap<HourlyWage> {
        
        public HourlyWageMap() {
			Table("HourlyWage");
			LazyLoad();
			Id(x => x.id).GeneratedBy.Identity().Column("id");
			Map(x => x.Employee).Column("Employee").Not.Nullable();
			Map(x => x.Title).Column("Title").Not.Nullable();
			Map(x => x.RegularHoursRate).Column("RegularHoursRate").Not.Nullable();
			Map(x => x.OvertimeHoursRate).Column("OvertimeHoursRate").Not.Nullable();
			Map(x => x.Description).Column("Description").Not.Nullable();
			Map(x => x.CreatedAt).Column("CreatedAt").Not.Nullable();
			Map(x => x.CreatedBy).Column("CreatedBy").Not.Nullable();
        }
    }
}
