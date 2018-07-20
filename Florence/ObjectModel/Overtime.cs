using System;
using System.Text;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;


namespace Florence {
    
    public class Overtime : ObjectBase<Overtime> {
        public virtual int id { get; set; }
        [Required]
        public virtual int Employee { get; set; }

        [Required]
        public virtual string Title { get; set; }
        [Required]
        public virtual decimal OvertimeHours { get; set; }
        public virtual DateTime? TimeIn { get; set; }
        public virtual DateTime? TimeOut { get; set; }
        [Required]
        public virtual decimal Amount { get; set; }
        [Required]
        public virtual string Description { get; set; }
        [Required]
        public virtual DateTime CreatedAt { get; set; }
        [Required]
        public virtual int CreatedBy { get; set; }
        [Required]
        public virtual bool IsRecurring { get; set; }
        [Required]
        public virtual int RecurringCyclePerMonth { get; set; }
    }
}
