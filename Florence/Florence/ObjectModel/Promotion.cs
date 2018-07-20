using System;
using System.Text;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;


namespace Florence {
    
    public class Promotion : ObjectBase<Promotion> {
        public virtual int id { get; set; }
        [Required]
        public virtual int PromotionFor { get; set; }
        [Required]
        public virtual int ForwardApplicationTo { get; set; }
        [Required]
        public virtual DateTime PromotionDate { get; set; }
        [Required]
        public virtual string PromotionDescription { get; set; }
        [Required]
        public virtual int CreatedBy { get; set; }
        [Required]
        public virtual DateTime CreatedAt { get; set; }
    }
}
