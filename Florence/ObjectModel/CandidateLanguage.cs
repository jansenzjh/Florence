using System;
using System.Text;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;


namespace Florence {
    
    public class CandidateLanguage : ObjectBase<CandidateLanguage> {
        public virtual int id { get; set; }
        [Required]
        public virtual System.Guid LinkID { get; set; }
        [Required]
        public virtual string Language { get; set; }
        [Required]
        public virtual string ListeningLevel { get; set; }
        [Required]
        public virtual string SpeakingLevel { get; set; }
        [Required]
        public virtual string ReadingLevel { get; set; }
        [Required]
        public virtual string WritingLevel { get; set; }
    }
}
