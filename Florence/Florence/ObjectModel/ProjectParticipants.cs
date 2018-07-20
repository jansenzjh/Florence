using System;
using System.Text;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;


namespace Florence {
    
    public class ProjectParticipants : ObjectBase<ProjectParticipants> {
        public virtual int id { get; set; }
        [Required]
        public virtual int ProjectId { get; set; }
        [Required]
        public virtual int Participants { get; set; }
    }
}
