using System; 
using System.Collections.Generic; 
using System.Text; 
using FluentNHibernate.Mapping;
using Florence; 

namespace Florence.Maps {
    
    
    public class JobtestMap : ClassMap<JobTest> {
        
        public JobtestMap() {
			Table("JobTest");
			LazyLoad();
			Id(x => x.id).GeneratedBy.Identity().Column("id");
			Map(x => x.JobPost).Column("JobPost").Not.Nullable();
			Map(x => x.TestTitle).Column("TestTitle").Not.Nullable();
			Map(x => x.TestDescription).Column("TestDescription").Not.Nullable();
			Map(x => x.CreateBy).Column("CreateBy").Not.Nullable();
			Map(x => x.CreateAt).Column("CreateAt").Not.Nullable();
        }
    }
}
