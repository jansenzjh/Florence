using System; 
using System.Collections.Generic; 
using System.Text; 
using FluentNHibernate.Mapping;
using Florence; 

namespace Florence.Maps {
    
    
    public class ContractMap : ClassMap<Contract> {
        
        public ContractMap() {
			Table("Contract");
			LazyLoad();
			Id(x => x.id).GeneratedBy.Identity().Column("id");
			Map(x => x.EmployeeID).Column("EmployeeID").Not.Nullable();
			Map(x => x.ContractType).Column("ContractType").Not.Nullable();
			Map(x => x.Title).Column("Title").Not.Nullable();
			Map(x => x.StartDate).Column("StartDate").Not.Nullable();
			Map(x => x.EndDate).Column("EndDate").Not.Nullable();
			Map(x => x.Designation).Column("Designation").Not.Nullable();
			Map(x => x.EmployeeType).Column("EmployeeType").Not.Nullable();
			Map(x => x.EmployeeCategory).Column("EmployeeCategory").Not.Nullable();
			Map(x => x.EmployeeGrade).Column("EmployeeGrade").Not.Nullable();
			Map(x => x.Station).Column("Station");
			Map(x => x.Department).Column("Department").Not.Nullable();
			Map(x => x.ContactDesc).Column("ContactDesc").Not.Nullable();
			Map(x => x.CreatedBy).Column("CreatedBy").Not.Nullable();
			Map(x => x.CreatedAt).Column("CreatedAt").Not.Nullable();
			Map(x => x.ContractFilePath).Column("ContractFilePath").Not.Nullable();
        }
    }
}
