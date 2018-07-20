using System; 
using System.Collections.Generic; 
using System.Text; 
using FluentNHibernate.Mapping;
using Florence; 

namespace Florence.Maps {
    
    
    public class LoanMap : ClassMap<Loan> {
        
        public LoanMap() {
			Table("Loan");
			LazyLoad();
			Id(x => x.id).GeneratedBy.Identity().Column("id");
			Map(x => x.Employee).Column("Employee").Not.Nullable();
			Map(x => x.Title).Column("Title").Not.Nullable();
			Map(x => x.LoanAmount).Column("LoanAmount").Not.Nullable();
			Map(x => x.LoanBalance).Column("LoanBalance").Not.Nullable();
			Map(x => x.LoanDate).Column("LoanDate").Not.Nullable();
			Map(x => x.MonthlyRepaymentAmount).Column("MonthlyRepaymentAmount").Not.Nullable();
			Map(x => x.RepaymentStartDate).Column("RepaymentStartDate").Not.Nullable();
			Map(x => x.Description).Column("Description").Not.Nullable();
			Map(x => x.CreatedAt).Column("CreatedAt").Not.Nullable();
			Map(x => x.CreatedBy).Column("CreatedBy").Not.Nullable();
        }
    }
}
