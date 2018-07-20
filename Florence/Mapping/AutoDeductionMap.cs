using System; 
using System.Collections.Generic; 
using System.Text; 
using FluentNHibernate.Mapping;
using Florence; 

namespace Florence.Maps {
    
    
    public class AutoDeductionMap : ClassMap<AutoDeduction> {
        
        public AutoDeductionMap() {
			Table("AutoDeduction");
			LazyLoad();
			Id(x => x.id).GeneratedBy.Identity().Column("id");
			Map(x => x.ForAbsence).Column("ForAbsence").Not.Nullable();
			Map(x => x.AbsenceAmount).Column("AbsenceAmount").Not.Nullable();
			Map(x => x.ForLeaveWithoutPay).Column("ForLeaveWithoutPay").Not.Nullable();
			Map(x => x.LeaveWithoutPayAmount).Column("LeaveWithoutPayAmount").Not.Nullable();
			Map(x => x.ForHalfDayLeave).Column("ForHalfDayLeave").Not.Nullable();
			Map(x => x.HalfDayLeaveAmount).Column("HalfDayLeaveAmount").Not.Nullable();
			Map(x => x.ForLateAttendance).Column("ForLateAttendance").Not.Nullable();
			Map(x => x.LateMinutesFrom).Column("LateMinutesFrom").Not.Nullable();
			Map(x => x.LateMinutesTo).Column("LateMinutesTo").Not.Nullable();
			Map(x => x.Amount).Column("Amount").Not.Nullable();

            Map(x => x.AbsenceAmountType).Column("AbsenceAmountType").Not.Nullable();
            Map(x => x.HalfDayLeaveAmountType).Column("HalfDayLeaveAmountType").Not.Nullable();
            Map(x => x.LateAmountType).Column("LateAmountType").Not.Nullable();
            Map(x => x.LeaveWithoutPayAmountType).Column("LeaveWithoutPayAmountType").Not.Nullable();
            Map(x => x.LinkID).Column("LinkID").Not.Nullable();

        }
    }
}
