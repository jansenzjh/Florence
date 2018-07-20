using System;
using System.Text;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;


namespace Florence {
    
    public class Project : ObjectBase<Project> {
        public virtual int id { get; set; }
        [Required]
        public virtual string Name { get; set; }
        public virtual string Description { get; set; }
        [Required]
        public virtual string Status { get; set; }
        public virtual string ClientID { get; set; }
        [Required]
        public virtual int ClientSID { get; set; }
        [Required]
        public virtual string Version { get; set; }
        [Required]
        public virtual decimal Completed { get; set; }
        [Required]
        public virtual DateTime LastUpdated { get; set; }
        [Required]
        public virtual string Priority { get; set; }
        [Required]
        public virtual int CreateBy { get; set; }
        [Required]
        public virtual DateTime CreateAt { get; set; }
    }
}
