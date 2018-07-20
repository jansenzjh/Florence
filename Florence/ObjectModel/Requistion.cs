using System;
using System.Text;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;


namespace Florence {
    
    public class Requistion : ObjectBase<Requistion> {
        public virtual int id { get; set; }
        [Required]
        public virtual int RequistionBy { get; set; }
        [Required]
        public virtual string RequistionType { get; set; }
        [Required]
        public virtual string Title { get; set; }
        [Required]
        public virtual string Priority { get; set; }
        [Required]
        public virtual string RequistionDescription { get; set; }
        [Required]
        public virtual int CreatedBy { get; set; }
        [Required]
        public virtual DateTime CreatedAt { get; set; }
    }
}
