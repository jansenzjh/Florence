using System;
using System.Text;
using System.Collections.Generic;
using NHibernate.Identity;
using System.Security.Claims;
using System.Threading.Tasks;
using Microsoft.AspNet.Identity;
using NHibernate;
using Florence.Models;
using NHibernate.Linq;
using System.Linq;
using Florence.Models.Shared;

namespace Florence.Models
{

    public class AppUser : IdentityUser
    {
        public AppUser()
        {

        }
        public AppUser(string username)
        {
            var obj = getAppUser(username);
        }

        public static AppUser getAppUser(string username)
        {
            return new AppUser()._getAppUser(username);
        }

        public virtual ResultModel Insert()
        {
            try
            {
                using (ISession session = NHibernateHelper.OpenSession<AppUser>())
                {
                    using (ITransaction transaction = session.BeginTransaction())
                    {
                        session.Save(this);
                        transaction.Commit();
                    }
                }
                return new ResultModel { BooleanResult = true, StringResult = "Success!", ObjectResult = this };
            }
            catch (Exception)
            {

                return new ResultModel(false, "Object cannot be inserted");
            }
        }

        public virtual List<AppUser> GetAll()
        {
            using (ISession session = NHibernateHelper.OpenSession<AppUser>())
            {
                var objs = new List<AppUser>();
                objs = session.Query<AppUser>().ToList();
                if (objs == null || objs.Count == 0)
                {
                    return new List<AppUser>();
                }
                return objs;
            }
        }

        private AppUser _getAppUser(string username)
        {

            using (ISession session = NHibernateHelper.OpenSession<AppUser>())
            {
                var obj = session.Query<AppUser>().Where(x => x.UserName.Equals(username)).FirstOrDefault();
                if (obj != null)
                {
                    return (AppUser)obj.MemberwiseClone();
                }
                return new AppUser();
            }
        }

        public virtual int UserID { get; set; }
        public virtual string Email { get; set; }
        public virtual string FirstName { get; set; }
        public virtual string LastName { get; set; }
        public virtual bool IsActive { get; set; }
        public virtual DateTime UpdatedAt { get; set; }
        public virtual DateTime CreatedAt { get; set; }

        public virtual string FullName { get { return string.Format("{0} {1}", FirstName, LastName); } }
    }




}
