using System; 
using System.Collections.Generic; 
using System.Text; 
using FluentNHibernate.Mapping;
using Florence; 

namespace Florence.Maps {
    
    
    public class PromotionMap : ClassMap<Promotion> {
        
        public PromotionMap() {
			Table("Promotion");
			LazyLoad();
			Id(x => x.id).GeneratedBy.Identity().Column("id");
			Map(x => x.PromotionFor).Column("PromotionFor").Not.Nullable();
			Map(x => x.ForwardApplicationTo).Column("ForwardApplicationTo").Not.Nullable();
			Map(x => x.PromotionDate).Column("PromotionDate").Not.Nullable();
			Map(x => x.PromotionDescription).Column("PromotionDescription").Not.Nullable();
			Map(x => x.CreatedBy).Column("CreatedBy").Not.Nullable();
			Map(x => x.CreatedAt).Column("CreatedAt").Not.Nullable();
        }
    }
}
