using System; 
using System.Collections.Generic; 
using System.Text; 
using FluentNHibernate.Mapping;
using Florence; 

namespace Florence.Maps {
    
    
    public class AchievementMap : ClassMap<Achievement> {
        
        public AchievementMap() {
			Table("Achievement");
			LazyLoad();
			Id(x => x.id).GeneratedBy.Identity().Column("id");
			Map(x => x.Employee).Column("Employee").Not.Nullable();
			Map(x => x.AchievementTitle).Column("AchievementTitle").Not.Nullable();
			Map(x => x.AchievementDate).Column("AchievementDate").Not.Nullable();
			Map(x => x.AchievementDescription).Column("AchievementDescription").Not.Nullable();
			Map(x => x.CreatedBy).Column("CreatedBy").Not.Nullable();
			Map(x => x.CreatedAt).Column("CreatedAt").Not.Nullable();
        }
    }
}
