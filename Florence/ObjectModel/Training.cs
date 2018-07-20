using System;
using System.Text;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;


namespace Florence {
    
    public class Training : ObjectBase<Training> {
        public virtual int id { get; set; }
        [Required]
        public virtual int Employee { get; set; }
        [Required]
        public virtual string Type { get; set; }
        [Required]
        public virtual string Subject { get; set; }
        [Required]
        public virtual string NatureOfTraining { get; set; }
        [Required]
        public virtual string Title { get; set; }
        [Required]
        public virtual string Trainer { get; set; }
        [Required]
        public virtual string Location { get; set; }
        [Required]
        public virtual string SponsoredBy { get; set; }
        [Required]
        public virtual string OrganizedBy { get; set; }
        [Required]
        public virtual DateTime StartDate { get; set; }
        [Required]
        public virtual DateTime EndDate { get; set; }
        [Required]
        public virtual string Description { get; set; }
        [Required]
        public virtual DateTime CreatedAt { get; set; }
        [Required]
        public virtual int CreatedBy { get; set; }
    }
}
