using System; 
using System.Collections.Generic; 
using System.Text; 
using FluentNHibernate.Mapping;
using Florence; 

namespace Florence.Maps {
    
    
    public class ResignationMap : ClassMap<Resignation> {
        
        public ResignationMap() {
			Table("Resignation");
			LazyLoad();
			Id(x => x.id).GeneratedBy.Identity().Column("id");
			Map(x => x.ResigningEmployee).Column("ResigningEmployee").Not.Nullable();
			Map(x => x.ForwardApplicationTo).Column("ForwardApplicationTo").Not.Nullable();
			Map(x => x.NoticeDate).Column("NoticeDate").Not.Nullable();
			Map(x => x.ResignationDate).Column("ResignationDate").Not.Nullable();
			Map(x => x.CreatedBy).Column("CreatedBy").Not.Nullable();
			Map(x => x.CreatedAt).Column("CreatedAt").Not.Nullable();
        }
    }
}
