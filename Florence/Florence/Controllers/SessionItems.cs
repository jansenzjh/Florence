using Florence;
using Florence.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;


public class SessionItems
{
    public static List<UserRoles> UserRoles
    {
        get
        {
            HttpContext context = HttpContext.Current;
            if (context.Application[ApplicationItems.UserRoles] == null)
            {
                var userId = SessionItems.CurrentUser.id;
                var roles = new UserRoles().GetObjectsValueFromExpression(x => x.UserId.id == userId);
                if (roles.Count() > 0)
                {
                    context.Application[ApplicationItems.UserRoles] = roles;
                    return roles;
                }
                return new List<UserRoles>();
            }
            else
            {
                return context.Application[ApplicationItems.UserRoles] as List<UserRoles>;
            }
        }
    }

    public static List<Employee> AllUsers
    {
        get
        {
            HttpContext context = HttpContext.Current;
            if (context.Application[ApplicationItems.AllUsers] == null)
            {
                var users = Employee.GetAll();
                if (users.Count() > 0)
                {
                    context.Application[ApplicationItems.AllUsers] = users;
                    return users;
                }
                return new List<Employee>();
            }
            else
            {
                return context.Application[ApplicationItems.AllUsers] as List<Employee>;
            }
        }
    }

    public static Employee CurrentUser
    {
        get
        {
            HttpContext context = HttpContext.Current;
            if (context.Application[ApplicationItems.CurrentUser] == null)
            {
                var userName = context.User.Identity.Name;
                if (!string.IsNullOrEmpty(userName))
                {
                    var emp = new Employee().GetObjectValueFromExpression(x => x.UserName.Equals(userName));
                    if (emp.id > 0)
                    {
                        context.Application[ApplicationItems.CurrentUser] = emp;
                        return emp;
                    }
                }
                return new Employee();
            }
            else
            {
                return context.Application[ApplicationItems.CurrentUser] as Employee;
            }
        }
    }

    //public static List<AppUser> AllUsers
    //{
    //    get
    //    {
    //        HttpContext context = HttpContext.Current;
    //        if (context.Application[ApplicationItems.AllUsers] == null)
    //        {
    //            var users = new AppUser().GetAll();
    //            if (users.Count() > 0)
    //            {
    //                context.Application[ApplicationItems.AllUsers] = users;
    //                return users;
    //            }
    //            return new List<AppUser>();
    //        }
    //        else
    //        {
    //            return context.Application[ApplicationItems.AllUsers] as List<AppUser>;
    //        }
    //    }
    //}

    //public static AppUser CurrentUser
    //{
    //    get
    //    {
    //        HttpContext context = HttpContext.Current;
    //        if (context.Application[ApplicationItems.CurrentUser] == null)
    //        {
    //            var userName = context.User.Identity.Name;
    //            if (!string.IsNullOrEmpty(userName))
    //            {
    //                var appUser = AppUser.getAppUser(userName);
    //                if (appUser.UserID > 0)
    //                {
    //                    context.Application[ApplicationItems.CurrentUser] = appUser;
    //                    return appUser;
    //                }
    //            }
    //            return new AppUser();
    //        }
    //        else
    //        {
    //            return context.Application[ApplicationItems.CurrentUser] as AppUser;
    //        }
    //    }
    //}


    public static List<MenuItems> MenuItems
    {
        get
        {
            HttpContext context = HttpContext.Current;
            if (context.Application[ApplicationItems.MenuItems] == null)
            {
                var menuItems = Florence.MenuItems.GetAll().Where(x => x.Level > 0).ToList();
                if (menuItems.Count() > 0)
                {
                    context.Application[ApplicationItems.MenuItems] = menuItems;
                    return menuItems;
                }
                return new List<MenuItems>();
            }
            else
            {
                return context.Application[ApplicationItems.MenuItems] as List<MenuItems>;
            }
        }
    }


    public static List<MenuItemsGroup> MenuItemsGroup
    {
        get
        {
            HttpContext context = HttpContext.Current;
            if (context.Application[ApplicationItems.MenuItemsGroup] == null)
            {
                var menuItemsGroup = Florence.MenuItemsGroup.GetAll();
                if (menuItemsGroup.Count() > 0)
                {
                    context.Application[ApplicationItems.MenuItemsGroup] = menuItemsGroup;
                    return menuItemsGroup;
                }
                return new List<MenuItemsGroup>();
            }
            else
            {
                return context.Application[ApplicationItems.MenuItemsGroup] as List<MenuItemsGroup>;
            }
        }
    }




}
