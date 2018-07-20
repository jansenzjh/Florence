using System;
using System.Text;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;


namespace Florence {
    
    public class Warning : ObjectBase<Warning> {
        public virtual int id { get; set; }
        [Required]
        public virtual int WarningTo { get; set; }
        [Required]
        public virtual string WarningBy { get; set; }
        [Required]
        public virtual DateTime WarningDate { get; set; }
        [Required]
        public virtual string Subject { get; set; }
        [Required]
        public virtual string Description { get; set; }
        [Required]
        public virtual int CreatedBy { get; set; }
        [Required]
        public virtual DateTime CreatedAt { get; set; }
    }
}
