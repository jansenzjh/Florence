using System;
using System.Text;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;


namespace Florence {
    
    public class Policy : ObjectBase<Policy> {
        public virtual int id { get; set; }
        [Required]
        public virtual string Title { get; set; }
        [Required]
        public virtual string Content { get; set; }
        [Required]
        public virtual DateTime PostedAt { get; set; }
        [Required]
        public virtual int PostUser { get; set; }
        [Required]
        public virtual string PolicyType { get; set; }
        [Required]
        public virtual int Company { get; set; }
        [Required]
        public virtual int Department { get; set; }
    }
}
