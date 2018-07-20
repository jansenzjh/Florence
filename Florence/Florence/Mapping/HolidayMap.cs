using System; 
using System.Collections.Generic; 
using System.Text; 
using FluentNHibernate.Mapping;
using Florence; 

namespace Florence.Maps {
    
    
    public class HolidayMap : ClassMap<Holiday> {
        
        public HolidayMap() {
			Table("Holiday");
			LazyLoad();
			Id(x => x.id).GeneratedBy.Identity().Column("id");
			Map(x => x.Title).Column("Title").Not.Nullable();
			Map(x => x.HolidayStartDate).Column("HolidayStartDate").Not.Nullable();
			Map(x => x.HolidayEndDate).Column("HolidayEndDate").Not.Nullable();
			Map(x => x.Description).Column("Description").Not.Nullable();
        }
    }
}
