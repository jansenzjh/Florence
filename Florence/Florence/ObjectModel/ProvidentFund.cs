using System;
using System.Text;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;


namespace Florence {
    
    public class ProvidentFund : ObjectBase<ProvidentFund> {
        public virtual int id { get; set; }
        [Required]
        public virtual int Employee { get; set; }
        [Required]
        public virtual decimal EmployeeShareAmount { get; set; }
        [Required]
        public virtual decimal EmployeeSharePersentage { get; set; }
        [Required]
        public virtual decimal OrganizationShareAmount { get; set; }
        [Required]
        public virtual decimal OrganizationSharePersentage { get; set; }
        [Required]
        public virtual string Description { get; set; }
    }
}
