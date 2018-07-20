using System;
using System.Text;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;


namespace Florence {
    
    public class CandidateReference : ObjectBase<CandidateReference> {
        public virtual int id { get; set; }
        [Required]
        public virtual System.Guid LinkID { get; set; }
        [Required]
        public virtual string Name { get; set; }
        [Required]
        public virtual string Organization { get; set; }
        [Required]
        public virtual string Phone { get; set; }
        [Required]
        public virtual string Email { get; set; }
    }
}
