using System; 
using System.Collections.Generic; 
using System.Text; 
using FluentNHibernate.Mapping;
using Florence; 

namespace Florence.Maps {
    
    
    public class ReimbursementMap : ClassMap<Reimbursement> {
        
        public ReimbursementMap() {
			Table("Reimbursement");
			LazyLoad();
			Id(x => x.id).GeneratedBy.Identity().Column("id");
			Map(x => x.InstanceID).Column("InstanceID").Not.Nullable();
			Map(x => x.Employee).Column("Employee").Not.Nullable();
			Map(x => x.Title).Column("Title").Not.Nullable();
			Map(x => x.Amount).Column("Amount").Not.Nullable();
			Map(x => x.Description).Column("Description").Not.Nullable();
			Map(x => x.CreatedAt).Column("CreatedAt").Not.Nullable();
			Map(x => x.CreatedBy).Column("CreatedBy").Not.Nullable();
			Map(x => x.IsApproved).Column("IsApproved").Not.Nullable();
        }
    }
}
