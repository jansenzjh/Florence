using System;
using System.Text;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;


namespace Florence {
    
    public class Termination : ObjectBase<Termination> {
        public virtual int id { get; set; }
        [Required]
        public virtual int TerminatedTo { get; set; }
        [Required]
        public virtual int ForwardApplicationTo { get; set; }
        [Required]
        public virtual DateTime TerminationDate { get; set; }
        [Required]
        public virtual string Description { get; set; }
        [Required]
        public virtual int CreatedBy { get; set; }
        [Required]
        public virtual DateTime CreatedAt { get; set; }
    }
}
