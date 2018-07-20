using System; 
using System.Collections.Generic; 
using System.Text; 
using FluentNHibernate.Mapping;
using Florence; 

namespace Florence.Maps {
    
    
    public class TravelMap : ClassMap<Travel> {
        
        public TravelMap() {
			Table("Travel");
			LazyLoad();
			Id(x => x.id).GeneratedBy.Identity().Column("id");
			Map(x => x.Employee).Column("Employee").Not.Nullable();
			Map(x => x.ForwardApplicationTo).Column("ForwardApplicationTo").Not.Nullable();
			Map(x => x.Purpose).Column("Purpose").Not.Nullable();
			Map(x => x.StartDate).Column("StartDate").Not.Nullable();
			Map(x => x.EndDate).Column("EndDate").Not.Nullable();
			Map(x => x.ExpectedBudget).Column("ExpectedBudget").Not.Nullable();
			Map(x => x.ActualBudget).Column("ActualBudget").Not.Nullable();
			Map(x => x.TravelDescription).Column("TravelDescription").Not.Nullable();
			Map(x => x.CreatedBy).Column("CreatedBy").Not.Nullable();
			Map(x => x.CreatedAt).Column("CreatedAt").Not.Nullable();
        }
    }
}
