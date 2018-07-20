using System;
using System.Text;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;


namespace Florence {
    
    public class Resignation : ObjectBase<Resignation> {
        public virtual int id { get; set; }
        [Required]
        public virtual int ResigningEmployee { get; set; }
        [Required]
        public virtual int ForwardApplicationTo { get; set; }
        [Required]
        public virtual DateTime NoticeDate { get; set; }
        [Required]
        public virtual DateTime ResignationDate { get; set; }
        [Required]
        public virtual int CreatedBy { get; set; }
        [Required]
        public virtual DateTime CreatedAt { get; set; }
    }
}
