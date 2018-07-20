using System; 
using System.Collections.Generic; 
using System.Text; 
using FluentNHibernate.Mapping;
using Florence; 

namespace Florence.Maps {
    
    
    public class MenuItemsGroupMap : ClassMap<MenuItemsGroup> {
        
        public MenuItemsGroupMap() {
			Table("MenuItemsGroup");
			LazyLoad();
			Id(x => x.id).GeneratedBy.Identity().Column("id");
			Map(x => x.GroupID).Column("GroupID");
			Map(x => x.Name).Column("Name");
			Map(x => x.IsActive).Column("IsActive");
            Map(x => x.Icon).Column("Icon");
        }
    }
}
