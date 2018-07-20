using System; 
using System.Collections.Generic; 
using System.Text; 
using FluentNHibernate.Mapping;
using Florence; 

namespace Florence.Maps {
    
    
    public class MemoMap : ClassMap<Memo> {
        
        public MemoMap() {
			Table("Memo");
			LazyLoad();
			Id(x => x.id).GeneratedBy.Identity().Column("id");
			Map(x => x.MemoFrom).Column("MemoFrom").Not.Nullable();
			Map(x => x.MemoTo).Column("MemoTo").Not.Nullable();
			Map(x => x.Sbuject).Column("Sbuject").Not.Nullable();
			Map(x => x.MemoDate).Column("MemoDate").Not.Nullable();
			Map(x => x.MemoDescription).Column("MemoDescription").Not.Nullable();
        }
    }
}
