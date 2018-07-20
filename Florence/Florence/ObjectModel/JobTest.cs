using System;
using System.Text;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;


namespace Florence {
    
    public class JobTest : ObjectBase<JobTest> {
        public virtual int id { get; set; }
        [Required]
        public virtual string JobPost { get; set; }
        [Required]
        public virtual string TestTitle { get; set; }
        [Required]
        public virtual string TestDescription { get; set; }
        [Required]
        public virtual int CreateBy { get; set; }
        [Required]
        public virtual DateTime CreateAt { get; set; }
    }
}
