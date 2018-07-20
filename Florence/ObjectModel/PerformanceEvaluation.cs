using System;
using System.Text;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;


namespace Florence {
    
    public class PerformanceEvaluation : ObjectBase<PerformanceEvaluation> {
        public virtual int id { get; set; }
        [Required]
        public virtual string Title { get; set; }
        [Required]
        public virtual string Description { get; set; }
        [Required]
        public virtual int CreatedBy { get; set; }
        [Required]
        public virtual DateTime CreatedAt { get; set; }
    }
}
