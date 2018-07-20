using System;
using System.Text;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;


namespace Florence {
    
    public class JobInterview : ObjectBase<JobInterview> {
        public virtual int id { get; set; }
        [Required]
        public virtual string JobPost { get; set; }
        [Required]
        public virtual DateTime InterviewDate { get; set; }
        
        public virtual string Interviewer1 { get; set; }
        
        public virtual string Interviewer2 { get; set; }
        
        public virtual string Interviewee1 { get; set; }
        
        public virtual string Interviewee2 { get; set; }
        [Required]
        public virtual string PlaceOfInterview { get; set; }
        [Required]
        public virtual string InterviewDesc { get; set; }
        [Required]
        public virtual int CreateBy { get; set; }
        [Required]
        public virtual DateTime CreateAt { get; set; }
    }
}
