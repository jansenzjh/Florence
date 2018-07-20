using System; 
using System.Collections.Generic; 
using System.Text; 
using FluentNHibernate.Mapping;
using Florence; 

namespace Florence.Maps {
    
    
    public class EmployeeexitMap : ClassMap<EmployeeExit> {
        
        public EmployeeexitMap() {
			Table("EmployeeExit");
			LazyLoad();
			Id(x => x.id).GeneratedBy.Identity().Column("id");
			Map(x => x.Employee).Column("Employee").Not.Nullable();
			Map(x => x.ExitDate).Column("ExitDate").Not.Nullable();
			Map(x => x.TypeOfExit).Column("TypeOfExit").Not.Nullable();
			Map(x => x.ConductedExitInterview).Column("ConductedExitInterview").Not.Nullable();
			Map(x => x.Reason).Column("Reason").Not.Nullable();
			Map(x => x.CreatedBy).Column("CreatedBy").Not.Nullable();
			Map(x => x.CreatedAt).Column("CreatedAt").Not.Nullable();
        }
    }
}
