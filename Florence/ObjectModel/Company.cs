using System;
using System.Text;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;


namespace Florence {
    
    public class Company : ObjectBase<Company> {
        public virtual int id { get; set; }
        [Required]
        public virtual string Name { get; set; }
        [Required]
        public virtual string Address1 { get; set; }
        
        public virtual string Address2 { get; set; }
        [Required]
        public virtual string City { get; set; }
        [Required]
        public virtual string State { get; set; }
        [Required]
        public virtual string Country { get; set; }
        [Required]
        public virtual string Zip { get; set; }
        [Phone]
        [Required]
        public virtual string Phone { get; set; }
        [EmailAddress]
        [Required]
        public virtual string Email { get; set; }
        
        [Required]
        public virtual string Fax { get; set; }
        [Required]
        public virtual string Logo { get; set; }
        [Url]
        [Required]
        public virtual string URL { get; set; }
    }
}
