using System;
using System.Text;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;


namespace Florence {
    
    public class Designation : ObjectBase<Designation> {
        public virtual int id { get; set; }
        [Required]
        public virtual string DesignationName { get; set; }
        public virtual string ParentDesignation { get; set; }
        public virtual string JobDescription { get; set; }
    }
}
