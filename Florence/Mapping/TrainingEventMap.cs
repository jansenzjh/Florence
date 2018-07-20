using System; 
using System.Collections.Generic; 
using System.Text; 
using FluentNHibernate.Mapping;
using Florence; 

namespace Florence.Maps {
    
    
    public class TrainingEventMap : ClassMap<TrainingEvent> {
        
        public TrainingEventMap() {
			Table("TrainingEvent");
			LazyLoad();
			Id(x => x.id).GeneratedBy.Identity().Column("id");
			Map(x => x.Type).Column("Type").Not.Nullable();
			Map(x => x.Subject).Column("Subject").Not.Nullable();
			Map(x => x.NatureOfTraining).Column("NatureOfTraining").Not.Nullable();
			Map(x => x.Title).Column("Title").Not.Nullable();
			Map(x => x.Location).Column("Location").Not.Nullable();
			Map(x => x.SponsoredBy).Column("SponsoredBy").Not.Nullable();
			Map(x => x.OrganizedBy).Column("OrganizedBy").Not.Nullable();
			Map(x => x.StartDate).Column("StartDate").Not.Nullable();
			Map(x => x.EndDate).Column("EndDate").Not.Nullable();
			Map(x => x.Trainers).Column("Trainers").Not.Nullable();
			Map(x => x.Trainees).Column("Trainees").Not.Nullable();
			Map(x => x.Externals).Column("Externals");
			Map(x => x.Description).Column("Description");
			Map(x => x.CreatedAt).Column("CreatedAt").Not.Nullable();
			Map(x => x.CreatedBy).Column("CreatedBy").Not.Nullable();
        }
    }
}
