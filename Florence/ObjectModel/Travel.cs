using System;
using System.Text;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;


namespace Florence {
    
    public class Travel : ObjectBase<Travel> {
        public virtual int id { get; set; }
        [Required]
        public virtual int Employee { get; set; }
        [Required]
        public virtual int ForwardApplicationTo { get; set; }
        [Required]
        public virtual string Purpose { get; set; }
        [Required]
        public virtual DateTime StartDate { get; set; }
        [Required]
        public virtual DateTime EndDate { get; set; }
        [Required]
        public virtual decimal ExpectedBudget { get; set; }
        [Required]
        public virtual decimal ActualBudget { get; set; }
        [Required]
        public virtual string TravelDescription { get; set; }
        [Required]
        public virtual int CreatedBy { get; set; }
        [Required]
        public virtual DateTime CreatedAt { get; set; }
    }
}
