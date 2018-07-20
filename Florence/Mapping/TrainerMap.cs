using System; 
using System.Collections.Generic; 
using System.Text; 
using FluentNHibernate.Mapping;
using Florence; 

namespace Florence.Maps {
    
    
    public class TrainerMap : ClassMap<Trainer> {
        
        public TrainerMap() {
			Table("Trainer");
			LazyLoad();
			Id(x => x.id).GeneratedBy.Identity().Column("id");
			Map(x => x.FirstName).Column("FirstName").Not.Nullable();
			Map(x => x.LastName).Column("LastName").Not.Nullable();
			Map(x => x.Designation).Column("Designation").Not.Nullable();
			Map(x => x.Organization).Column("Organization").Not.Nullable();
			Map(x => x.Address).Column("Address").Not.Nullable();
			Map(x => x.City).Column("City").Not.Nullable();
			Map(x => x.State).Column("State").Not.Nullable();
			Map(x => x.Zip).Column("Zip").Not.Nullable();
			Map(x => x.Country).Column("Country").Not.Nullable();
			Map(x => x.TrainerEmail).Column("TrainerEmail").Not.Nullable();
			Map(x => x.TrainerPhone).Column("TrainerPhone").Not.Nullable();
			Map(x => x.TrainerPhone2).Column("TrainerPhone2");
			Map(x => x.TrainerExpertise).Column("TrainerExpertise").Not.Nullable();
        }
    }
}
