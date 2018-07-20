using System; 
using System.Collections.Generic; 
using System.Text; 
using FluentNHibernate.Mapping;
using Florence; 

namespace Florence.Maps {
    
    
    public class ModelTypesMap : ClassMap<ModelTypes> {
        
        public ModelTypesMap() {
			Table("ModelTypes");
			LazyLoad();
			Id(x => x.id).GeneratedBy.Identity().Column("id");
			Map(x => x.ModelName).Column("ModelName").Not.Nullable();
			Map(x => x.TypesArray).Column("TypesArray").Not.Nullable();
        }
    }
}
