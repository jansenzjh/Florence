using System;
using System.Text;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;


namespace Florence {
    
    public class UserActionLog : ObjectBase<UserActionLog> {
        public virtual int id { get; set; }
        [Required]
        public virtual string UserName { get; set; }
        [Required]
        public virtual string UserRole { get; set; }
        public virtual string Path { get; set; }
        public virtual string PathParam { get; set; }
        public virtual bool? IsAuth { get; set; }
        [Required]
        public virtual DateTime LogTime { get; set; }
    }
}
