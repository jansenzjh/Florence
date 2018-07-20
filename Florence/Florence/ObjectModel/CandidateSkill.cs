using System;
using System.Text;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;


namespace Florence {
    
    public class CandidateSkill : ObjectBase<CandidateSkill> {
        public virtual int id { get; set; }
        [Required]
        public virtual System.Guid LinkID { get; set; }
        [Required]
        public virtual string SkillName { get; set; }
        [Required]
        public virtual string SkillLevel { get; set; }
    }
}
