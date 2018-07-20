using System;
using System.Text;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;


namespace Florence {
    
    public class MenuItems : ObjectBase<MenuItems> {
        public virtual int id { get; set; }
        [Required]
        public virtual int ParentID { get; set; }
        [Required]
        public virtual string Name { get; set; }
        [Required]
        public virtual string Description { get; set; }
        [Required]
        public virtual string Controller { get; set; }
        [Required]
        public virtual string Action { get; set; }
        [Required]
        public virtual int Level { get; set; }
        [Required]
        public virtual string Icon { get; set; }
        [Required]
        public virtual string URL { get; set; }
        [Required]
        public virtual string Params { get; set; }
        public virtual int TaskID { get; set; }
    }
}
