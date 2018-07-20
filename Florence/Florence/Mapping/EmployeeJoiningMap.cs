using System; 
using System.Collections.Generic; 
using System.Text; 
using FluentNHibernate.Mapping;
using Florence; 

namespace Florence.Maps {
    
    
    public class EmployeejoiningMap : ClassMap<EmployeeJoining> {
        
        public EmployeejoiningMap() {
			Table("EmployeeJoining");
			LazyLoad();
			Id(x => x.id).GeneratedBy.Identity().Column("id");
			Map(x => x.EmployeeID).Column("EmployeeID").Not.Nullable();
			Map(x => x.JoiningDate).Column("JoiningDate").Not.Nullable();
			Map(x => x.Type).Column("Type").Not.Nullable();
			Map(x => x.Category).Column("Category").Not.Nullable();
			Map(x => x.Designation).Column("Designation").Not.Nullable();
			Map(x => x.Station).Column("Station");
			Map(x => x.Department).Column("Department").Not.Nullable();
			Map(x => x.Note).Column("Note").Not.Nullable();
			Map(x => x.CreatedBy).Column("CreatedBy").Not.Nullable();
			Map(x => x.CreatedAt).Column("CreatedAt").Not.Nullable();
        }
    }
}
