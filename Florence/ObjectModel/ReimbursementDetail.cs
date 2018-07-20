using System;
using System.Text;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;


namespace Florence {
    
    public class ReimbursementDetail : ObjectBase<ReimbursementDetail> {
        public virtual int id { get; set; }
        [Required]
        public virtual System.Guid InstanceID { get; set; }
        [Required]
        public virtual DateTime CreatedDate { get; set; }
        [Required]
        public virtual string Category { get; set; }
        [Required]
        public virtual string Item { get; set; }
        [Required]
        public virtual string ReceiptNumber { get; set; }
        [Required]
        public virtual string Location { get; set; }
        [Required]
        public virtual decimal Amount { get; set; }
    }
}
