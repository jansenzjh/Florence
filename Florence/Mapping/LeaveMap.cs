using System; 
using System.Collections.Generic; 
using System.Text; 
using FluentNHibernate.Mapping;
using Florence; 

namespace Florence.Maps {
    
    
    public class LeaveMap : ClassMap<Leave> {
        
        public LeaveMap() {
			Table("Leave");
			LazyLoad();
			Id(x => x.id).GeneratedBy.Identity().Column("id");
			Map(x => x.Employee).Column("Employee").Not.Nullable();
			Map(x => x.LeaveType).Column("LeaveType").Not.Nullable();
			Map(x => x.Reason).Column("Reason").Not.Nullable();
			Map(x => x.LeaveDuration).Column("LeaveDuration");
			Map(x => x.LeaveFrom).Column("LeaveFrom").Not.Nullable();
			Map(x => x.LeaveTo).Column("LeaveTo").Not.Nullable();
			Map(x => x.AlternateContactNumber).Column("AlternateContactNumber").Not.Nullable();
			Map(x => x.AlternateEmployee).Column("AlternateEmployee").Not.Nullable();
			Map(x => x.LeaveDescription).Column("LeaveDescription").Not.Nullable();
			Map(x => x.CreatedBy).Column("CreatedBy").Not.Nullable();
			Map(x => x.CreatedAt).Column("CreatedAt").Not.Nullable();
        }
    }
}
