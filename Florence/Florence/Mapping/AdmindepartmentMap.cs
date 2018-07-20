using System; 
using System.Collections.Generic; 
using System.Text; 
using FluentNHibernate.Mapping;
using Florence; 

namespace Florence.Maps {
    
    
    public class AdminDepartmentMap : ClassMap<AdminDepartment> {
        
        public AdminDepartmentMap() {
			Table("AdminDepartment");
			LazyLoad();
			Id(x => x.id).GeneratedBy.Identity().Column("DeptID");
			References(x => x.ParentID).Column("ParentID").Not.Nullable().Not.LazyLoad();
			Map(x => x.DeptCode).Column("DeptCode").Not.Nullable();
			Map(x => x.Name).Column("Name").Not.Nullable();
			Map(x => x.Responsibility).Column("Responsibility").Not.Nullable();
			Map(x => x.Tel).Column("Tel");
			Map(x => x.Fax).Column("Fax");
			Map(x => x.Email).Column("Email");
			Map(x => x.Addr).Column("Addr");
			Map(x => x.PostCode).Column("PostCode");
			Map(x => x.BankName).Column("BankName");
			Map(x => x.BankAccount).Column("BankAccount");
			Map(x => x.UserName).Column("UserName");
			Map(x => x.AbsIndex).Column("AbsIndex");
			Map(x => x.ItemLevel).Column("ItemLevel").Not.Nullable();
			Map(x => x.IsActive).Column("IsActive").Not.Nullable();
			Map(x => x.IsDir).Column("IsDir").Not.Nullable();
			Map(x => x.Memo).Column("Memo");
        }
    }
}
