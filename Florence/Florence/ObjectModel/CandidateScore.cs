using System;
using System.Text;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;


namespace Florence {
    
    public class CandidateScore : ObjectBase<CandidateScore> {
        public virtual int id { get; set; }
        [Required]
        public virtual System.Guid LinkID { get; set; }
        [Required]
        public virtual int DressCode { get; set; }
        [Required]
        public virtual int Attitude { get; set; }
        [Required]
        public virtual int CommunicationSkills { get; set; }
        [Required]
        public virtual int TechnicalKnowledge { get; set; }
        [Required]
        public virtual int Confidence { get; set; }
        [Required]
        public virtual int Potential { get; set; }
        [Required]
        public virtual int LearningAbility { get; set; }
        [Required]
        public virtual int MentalCapacity { get; set; }
        [Required]
        public virtual int AnalytialApproach { get; set; }
        [Required]
        public virtual int WillingnessToWork { get; set; }
        [Required]
        public virtual int RatedBy { get; set; }
    }
}
