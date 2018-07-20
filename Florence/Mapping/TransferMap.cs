using System; 
using System.Collections.Generic; 
using System.Text; 
using FluentNHibernate.Mapping;
using Florence; 

namespace Florence.Maps {
    
    
    public class TransferMap : ClassMap<Transfer> {
        
        public TransferMap() {
			Table("Transfer");
			LazyLoad();
			Id(x => x.id).GeneratedBy.Identity().Column("id");
			Map(x => x.EmployeeToTransfer).Column("EmployeeToTransfer").Not.Nullable();
			Map(x => x.ForwardApplicationTo).Column("ForwardApplicationTo").Not.Nullable();
			Map(x => x.TransferDate).Column("TransferDate").Not.Nullable();
			Map(x => x.TransferToDepartment).Column("TransferToDepartment").Not.Nullable();
            Map(x => x.TransferToStation).Column("TransferToStation");
			Map(x => x.TransferDescription).Column("TransferDescription").Not.Nullable();
			Map(x => x.CreatedBy).Column("CreatedBy").Not.Nullable();
			Map(x => x.CreatedAt).Column("CreatedAt").Not.Nullable();
        }
    }
}
