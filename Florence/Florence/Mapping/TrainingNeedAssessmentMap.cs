using System; 
using System.Collections.Generic; 
using System.Text; 
using FluentNHibernate.Mapping;
using Florence; 

namespace Florence.Maps {
    
    
    public class TrainingNeedAssessmentMap : ClassMap<TrainingNeedAssessment> {
        
        public TrainingNeedAssessmentMap() {
			Table("TrainingNeedAssessment");
			LazyLoad();
			Id(x => x.id).GeneratedBy.Identity().Column("id");
			Map(x => x.Department).Column("Department").Not.Nullable();
			Map(x => x.Type).Column("Type").Not.Nullable();
			Map(x => x.Subject).Column("Subject").Not.Nullable();
			Map(x => x.NatureOfTraining).Column("NatureOfTraining").Not.Nullable();
			Map(x => x.Title).Column("Title").Not.Nullable();
			Map(x => x.Employee).Column("Employee").Not.Nullable();
			Map(x => x.Reason).Column("Reason").Not.Nullable();
			Map(x => x.PreferredTrainer).Column("PreferredTrainer").Not.Nullable();
			Map(x => x.PreferredLocation).Column("PreferredLocation").Not.Nullable();
			Map(x => x.PreferredStartDate).Column("PreferredStartDate").Not.Nullable();
			Map(x => x.PreferredEndDate).Column("PreferredEndDate").Not.Nullable();
			Map(x => x.Description).Column("Description").Not.Nullable();
			Map(x => x.CreatedAt).Column("CreatedAt").Not.Nullable();
			Map(x => x.CreatedBy).Column("CreatedBy").Not.Nullable();
        }
    }
}
