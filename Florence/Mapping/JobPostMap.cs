using System; 
using System.Collections.Generic; 
using System.Text; 
using FluentNHibernate.Mapping;
using Florence; 

namespace Florence.Maps {
    
    
    public class JobpostMap : ClassMap<JobPost> {
        
        public JobpostMap() {
			Table("JobPost");
			LazyLoad();
			Id(x => x.id).GeneratedBy.Identity().Column("id");
			References(x => x.Department).Column("Department").Not.Nullable().Not.LazyLoad();
			Map(x => x.JobTitle).Column("JobTitle").Not.Nullable();
			Map(x => x.JobType).Column("JobType").Not.Nullable();
			Map(x => x.NumberOfPositions).Column("NumberOfPositions").Not.Nullable();
			Map(x => x.CandidateAgeRangeStart).Column("CandidateAgeRangeStart").Not.Nullable();
			Map(x => x.CandidateAgeRangeEnd).Column("CandidateAgeRangeEnd").Not.Nullable();
			Map(x => x.JobLocation).Column("JobLocation").Not.Nullable();
			Map(x => x.SalaryStartRange).Column("SalaryStartRange").Not.Nullable();
			Map(x => x.SalaryEndRange).Column("SalaryEndRange").Not.Nullable();
			Map(x => x.CandidateQualification).Column("CandidateQualification").Not.Nullable();
			Map(x => x.CandidateExperience).Column("CandidateExperience").Not.Nullable();
			Map(x => x.JobPostDescription).Column("JobPostDescription").Not.Nullable();
			Map(x => x.CreatedBy).Column("CreatedBy").Not.Nullable();
			Map(x => x.CreatedAt).Column("CreatedAt").Not.Nullable();
			Map(x => x.CloseDate).Column("CloseDate").Not.Nullable();
        }
    }
}
