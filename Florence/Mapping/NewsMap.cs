using System; 
using System.Collections.Generic; 
using System.Text; 
using FluentNHibernate.Mapping;
using Florence; 

namespace Florence.Maps {
    
    
    public class NewsMap : ClassMap<News> {
        
        public NewsMap() {
			Table("News");
			LazyLoad();
			Id(x => x.id).GeneratedBy.Identity().Column("id");
			Map(x => x.Title).Column("Title").Not.Nullable();
			Map(x => x.Content).Column("Content").CustomType("StringClob").Not.Nullable();
			Map(x => x.PostedAt).Column("PostedAt").Not.Nullable();
			Map(x => x.PostUser).Column("PostUser").Not.Nullable();
        }
    }
}
