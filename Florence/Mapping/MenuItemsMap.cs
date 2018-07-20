using System; 
using System.Collections.Generic; 
using System.Text; 
using FluentNHibernate.Mapping;
using Florence; 

namespace Florence.Maps {
    
    
    public class MenuItemsMap : ClassMap<MenuItems> {
        
        public MenuItemsMap() {
			Table("MenuItems");
			LazyLoad();
			Id(x => x.id).GeneratedBy.Identity().Column("id");
			Map(x => x.ParentID).Column("ParentID").Not.Nullable();
			Map(x => x.Name).Column("Name").Not.Nullable();
			Map(x => x.Description).Column("Description").Not.Nullable();
			Map(x => x.Controller).Column("Controller").Not.Nullable();
			Map(x => x.Action).Column("Action").Not.Nullable();
			Map(x => x.Level).Column("Level").Not.Nullable();
			Map(x => x.Icon).Column("Icon").Not.Nullable();
			Map(x => x.URL).Column("URL").Not.Nullable();
            Map(x => x.Params).Column("Params").Not.Nullable();
            Map(x => x.TaskID).Column("TaskID").Not.Nullable();
        }
    }
}
