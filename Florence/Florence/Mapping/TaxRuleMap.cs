using System; 
using System.Collections.Generic; 
using System.Text; 
using FluentNHibernate.Mapping;
using Florence; 

namespace Florence.Maps {
    
    
    public class TaxRuleMap : ClassMap<TaxRule> {
        
        public TaxRuleMap() {
			Table("TaxRule");
			LazyLoad();
			Id(x => x.id).GeneratedBy.Identity().Column("id");
			Map(x => x.RuleName).Column("RuleName").Not.Nullable();
			Map(x => x.TaxFormat).Column("TaxFormat").Not.Nullable();
			Map(x => x.SalaryFrom).Column("SalaryFrom").Not.Nullable();
			Map(x => x.SalaryTo).Column("SalaryTo").Not.Nullable();
			Map(x => x.TaxPercentage).Column("TaxPercentage").Not.Nullable();
			Map(x => x.ExemptedTaxAmount).Column("ExemptedTaxAmount").Not.Nullable();
			Map(x => x.AdditionalTaxAmount).Column("AdditionalTaxAmount").Not.Nullable();
            Map(x => x.LinkID).Column("LinkID").Not.Nullable();
        }
    }
}
