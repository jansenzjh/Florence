using System;
using System.Text;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;


namespace Florence {
    
    public class HourlyWage : ObjectBase<HourlyWage> {
        public virtual int id { get; set; }
        [Required]
        public virtual int Employee { get; set; }
        [Required]
        public virtual string Title { get; set; }
        [Required]
        public virtual decimal RegularHoursRate { get; set; }
        [Required]
        public virtual decimal OvertimeHoursRate { get; set; }
        [Required]
        public virtual string Description { get; set; }
        [Required]
        public virtual DateTime CreatedAt { get; set; }
        [Required]
        public virtual int CreatedBy { get; set; }
    }
}
