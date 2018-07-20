using Florence;
using Florence.Models;
using NHibernate;
using NHibernate.Linq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;

public class CustomRoleProvider : RoleProvider
{
    public override string ApplicationName
    {
        get
        {
            throw new NotImplementedException();
        }

        set
        {
            throw new NotImplementedException();
        }
    }

    public override bool IsUserInRole(string username, string roleName)
    {
        using (ISession session = NHibernateHelper.OpenSession<UserRoles>())
        {
            return session.Query<UserRoles>().Any(x => x.UserId != null 
                                                && x.UserId.UserName.Equals(username) 
                                                && x.RoleId != null 
                                                && x.RoleId.RoleName.Equals(roleName));
        }
    }

    public override string[] GetRolesForUser(string username)
    {
        
        using (ISession session = NHibernateHelper.OpenSession<UserRoles>())
        {
            return session.Query<UserRoles>().Where(x => x.UserId.UserName.Equals(username) && x.RoleId != null).Select(y => y.RoleId.RoleName).ToArray();
        }

    }

    // -- Snip --

    public override string[] GetAllRoles()
    {   
        return Florence.Roles.GetAll().Select(x => x.RoleName).ToArray();
    }

    public override void CreateRole(string roleName)
    {
        throw new NotImplementedException();
    }

    public override bool DeleteRole(string roleName, bool throwOnPopulatedRole)
    {
        throw new NotImplementedException();
    }

    public override bool RoleExists(string roleName)
    {
        throw new NotImplementedException();
    }

    public override void AddUsersToRoles(string[] usernames, string[] roleNames)
    {
        throw new NotImplementedException();
    }

    public override void RemoveUsersFromRoles(string[] usernames, string[] roleNames)
    {
        throw new NotImplementedException();
    }

    public override string[] GetUsersInRole(string roleName)
    {
        throw new NotImplementedException();
    }

    public override string[] FindUsersInRole(string roleName, string usernameToMatch)
    {
        throw new NotImplementedException();
    }

    // -- Snip --
}