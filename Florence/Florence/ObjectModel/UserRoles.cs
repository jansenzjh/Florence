using System;
using System.Text;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using NHibernate;
using Florence.Models;
using NHibernate.Linq;
using System.Linq;

namespace Florence {
    
    public class UserRoles : ObjectBase<UserRoles> {
        public virtual int UserRoleId { get; set; }
        [Required]
        public virtual Employee UserId { get; set; }
        [Required]
        public virtual Roles RoleId { get; set; }

        public static List<int> GetUserRoles(int employee)
        {
            using (ISession session = NHibernateHelper.OpenSession<UserRoles>())
            {
                var objs = new UserRoles().GetObjectsValueFromExpression(x => x.UserId.id == employee);

                if (objs != null && objs.Count > 0)
                {
                    return objs.Select(x => (int)x.RoleId.RoleId).ToList();
                }
                else
                {
                    return new List<int>();
                }
            }
        }
    }
}
