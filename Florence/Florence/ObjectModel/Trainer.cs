using System;
using System.Text;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;


namespace Florence {
    
    public class Trainer : ObjectBase<Trainer> {
        public virtual int id { get; set; }
        [Required]
        public virtual string FirstName { get; set; }
        [Required]
        public virtual string LastName { get; set; }
        [Required]
        public virtual string Designation { get; set; }
        [Required]
        public virtual string Organization { get; set; }
        [Required]
        public virtual string Address { get; set; }
        [Required]
        public virtual string City { get; set; }
        [Required]
        public virtual string State { get; set; }
        [Required]
        public virtual string Zip { get; set; }
        [Required]
        public virtual string Country { get; set; }
        [Required]
        public virtual string TrainerEmail { get; set; }
        [Required]
        public virtual string TrainerPhone { get; set; }
        public virtual string TrainerPhone2 { get; set; }
        [Required]
        public virtual string TrainerExpertise { get; set; }
    }
}
