using System;
using System.Text;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;


namespace Florence {
    
    public class MenuItemsGroup : ObjectBase<MenuItemsGroup> {
        public virtual int id { get; set; }
        public virtual int GroupID { get; set; }
        public virtual string Name { get; set; }
        public virtual bool IsActive { get; set; }
        public virtual string Icon { get; set; }
    }
}
