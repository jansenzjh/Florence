using System;
using System.Collections.Generic;
using System.Text;
using FluentNHibernate.Mapping;
using Florence;

namespace Florence.Maps
{


    public class AttendanceMap : ClassMap<Attendance>
    {

        public AttendanceMap()
        {
            Table("Attendance");
            LazyLoad();
            Id(x => x.id).GeneratedBy.Identity().Column("id");
            Map(x => x.LinkID).Column("LinkID").Not.Nullable();
            Map(x => x.UserID).Column("UserID").Not.Nullable();
            Map(x => x.PunchDateTime).Column("PunchDateTime").Not.Nullable();
            Map(x => x.CurrentPunchType).Column("CurrentPunchType").Not.Nullable();
            Map(x => x.Notes).Column("Notes");
        }
    }
}
