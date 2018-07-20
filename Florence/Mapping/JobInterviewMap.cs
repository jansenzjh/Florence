using System; 
using System.Collections.Generic; 
using System.Text; 
using FluentNHibernate.Mapping;
using Florence; 

namespace Florence.Maps {
    
    
    public class JobinterviewMap : ClassMap<JobInterview> {
        
        public JobinterviewMap() {
			Table("JobInterview");
			LazyLoad();
			Id(x => x.id).GeneratedBy.Identity().Column("id");
			Map(x => x.JobPost).Column("JobPost").Not.Nullable();
			Map(x => x.InterviewDate).Column("InterviewDate").Not.Nullable();
            Map(x => x.Interviewer1).Column("Interviewer1");
			Map(x => x.Interviewer2).Column("Interviewer2");
			Map(x => x.Interviewee1).Column("Interviewee1");
			Map(x => x.Interviewee2).Column("Interviewee2");
			Map(x => x.PlaceOfInterview).Column("PlaceOfInterview").Not.Nullable();
			Map(x => x.InterviewDesc).Column("InterviewDesc").Not.Nullable();
			Map(x => x.CreateBy).Column("CreateBy").Not.Nullable();
			Map(x => x.CreateAt).Column("CreateAt").Not.Nullable();
        }
    }
}
