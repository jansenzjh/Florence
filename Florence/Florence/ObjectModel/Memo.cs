using System;
using System.Text;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;


namespace Florence {
    
    public class Memo : ObjectBase<Memo> {
        public virtual int id { get; set; }
        [Required]
        public virtual int MemoFrom { get; set; }
        [Required]
        public virtual int MemoTo { get; set; }
        [Required]
        public virtual string Sbuject { get; set; }
        [Required]
        public virtual DateTime MemoDate { get; set; }
        [Required]
        public virtual string MemoDescription { get; set; }
    }
}
