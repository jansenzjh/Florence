using System;
using System.Text;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;


namespace Florence {
    public enum ProjectActivityTypes
    {
        Open = 1,
        Close = 2,
        Default = 0,
        Reviewing = 3,
        Deny = 4

    }
    public class ProjectActivity : ObjectBase<ProjectActivity> {
        public virtual int id { get; set; }
        [Required]
        public virtual int UserID { get; set; }
        [Required]
        public virtual string Status { get; set; }
        [Required]
        public virtual string Title { get; set; }
        [Required]
        public virtual DateTime StartTime { get; set; }
        [Required]
        public virtual DateTime EndTime { get; set; }
        [Required]
        public virtual string Comments { get; set; }
        [Required]
        public virtual int ProjectID { get; set; }
    }
}
