using System; 
using System.Collections.Generic; 
using System.Text; 
using FluentNHibernate.Mapping;
using Florence; 

namespace Florence.Maps {
    
    
    public class DesignationMap : ClassMap<Designation> {
        
        public DesignationMap() {
			Table("Designation");
			LazyLoad();
			Id(x => x.id).GeneratedBy.Identity().Column("id");
			Map(x => x.DesignationName).Column("DesignationName").Not.Nullable();
			Map(x => x.ParentDesignation).Column("ParentDesignation");
			Map(x => x.JobDescription).Column("JobDescription");
        }
    }
}
