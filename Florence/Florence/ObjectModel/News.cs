using System;
using System.Text;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;


namespace Florence {
    
    public class News : ObjectBase<News> {
        public virtual int id { get; set; }
        [Required]
        public virtual string Title { get; set; }
        [Required]
        public virtual string Content { get; set; }
        [Required]
        public virtual DateTime PostedAt { get; set; }
        [Required]
        public virtual int PostUser { get; set; }
    }
}
