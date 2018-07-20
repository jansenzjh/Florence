using System; 
using System.Collections.Generic; 
using System.Text; 
using FluentNHibernate.Mapping;
using Florence; 

namespace Florence.Maps {
    
    
    public class ComplaintMap : ClassMap<Complaint> {
        
        public ComplaintMap() {
			Table("Complaint");
			LazyLoad();
			Id(x => x.id).GeneratedBy.Identity().Column("id");
			Map(x => x.ComplaintFrom).Column("ComplaintFrom").Not.Nullable();
			Map(x => x.ComplaintTitle).Column("ComplaintTitle").Not.Nullable();
			Map(x => x.ComplaintDate).Column("ComplaintDate").Not.Nullable();
			Map(x => x.Description).Column("Description").Not.Nullable();
			Map(x => x.CreatedBy).Column("CreatedBy").Not.Nullable();
			Map(x => x.CreatedAt).Column("CreatedAt").Not.Nullable();
        }
    }
}
