using System;
using System.Text;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;


namespace Florence {
    
    public class Insurance : ObjectBase<Insurance> {
        public virtual int id { get; set; }
        [Required]
        public virtual int Employee { get; set; }
        [Required]
        public virtual string InsuranceType { get; set; }
        [Required]
        public virtual string Title { get; set; }
        [Required]
        public virtual decimal EmployeeAmountPerMonth { get; set; }
        [Required]
        public virtual decimal OrganizationSharePerMonth { get; set; }
        [Required]
        public virtual DateTime CreatedAt { get; set; }
        [Required]
        public virtual int CreatedBy { get; set; }
    }
}
