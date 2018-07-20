using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using FluentNHibernate.Mapping;
using Florence.Models;

namespace Florence.Mapping
{
    public class AppUserMap : ClassMap<AppUser>
    {
        public AppUserMap()
        {
            Table("AppUser");
            LazyLoad();

            Id(x => x.UserID, "id");
            Map(x => x.Id).Column("Gid");
            Map(x => x.UserName).Column("UserName").Not.Nullable().Length(50);
            Map(x => x.Email).Column("Email").Not.Nullable().Length(100);
            Map(x => x.PasswordHash).Column("PasswordHash").Not.Nullable().Length(250);
            Map(x => x.FirstName).Column("FirstName").Not.Nullable().Length(50);
            Map(x => x.LastName).Column("LastName").Not.Nullable().Length(50);
            Map(x => x.IsActive).Column("IsActive").Not.Nullable();
            Map(x => x.UpdatedAt).Column("UpdatedAt").Not.Nullable();
            Map(x => x.CreatedAt).Column("CreatedAt").Not.Nullable();
            Map(x => x.SecurityStamp).Column("SecurityStamp").Not.Nullable();

        }
    }
}