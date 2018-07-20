using System;
using System.Text;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;


namespace Florence {
    
    public class Holiday : ObjectBase<Holiday> {
        public virtual int id { get; set; }
        [Required]
        public virtual string Title { get; set; }
        [Required]
        public virtual DateTime HolidayStartDate { get; set; }
        [Required]
        public virtual DateTime HolidayEndDate { get; set; }
        [Required]
        public virtual string Description { get; set; }
    }
}
