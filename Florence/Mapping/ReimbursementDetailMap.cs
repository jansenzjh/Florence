using System; 
using System.Collections.Generic; 
using System.Text; 
using FluentNHibernate.Mapping;
using Florence; 

namespace Florence.Maps {
    
    
    public class ReimbursementDetailMap : ClassMap<ReimbursementDetail> {
        
        public ReimbursementDetailMap() {
			Table("ReimbursementDetail");
			LazyLoad();
			Id(x => x.id).GeneratedBy.Identity().Column("id");
			Map(x => x.InstanceID).Column("InstanceID").Not.Nullable();
			Map(x => x.CreatedDate).Column("CreatedDate").Not.Nullable();
			Map(x => x.Category).Column("Category").Not.Nullable();
			Map(x => x.Item).Column("Item").Not.Nullable();
			Map(x => x.ReceiptNumber).Column("ReceiptNumber").Not.Nullable();
			Map(x => x.Location).Column("Location").Not.Nullable();
			Map(x => x.Amount).Column("Amount").Not.Nullable();
        }
    }
}
