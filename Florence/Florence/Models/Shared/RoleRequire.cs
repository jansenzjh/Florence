using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

public class RoleRequire: ActionFilterAttribute
{
    public string RoleInAction;

    public override void OnActionExecuting(ActionExecutingContext filterContext)
    {
        if (!string.IsNullOrEmpty(RoleInAction))
        {
            //Start working on process
            //base.OnActionExecuting(filterContext);
            var originalPath = filterContext.HttpContext.Request.Url.AbsolutePath;
            var returnURL = string.Format("ReturnUrl={0}", originalPath);
            var loginPath = string.Format("{0}&{1}",System.Web.Security.FormsAuthentication.LoginUrl, returnURL);
            var isAuth = false;

            
            if (filterContext.HttpContext.User.Identity.IsAuthenticated && System.Web.Security.Roles.IsUserInRole(RoleInAction))
            {
                //Pass, auth and is in role
                isAuth = true;
            }
            else if (!filterContext.HttpContext.User.Identity.IsAuthenticated)
            {
                //Go to login
                filterContext.HttpContext.Response.Redirect(loginPath, true);
            }
            else
            {
                //Don't have the auth
                filterContext.HttpContext.Response.Redirect(string.Format("/Error/Unauthorized?calledString={0}/{1}", filterContext.ActionDescriptor.ControllerDescriptor.ControllerName, filterContext.ActionDescriptor.ActionName));
            }

            //Log the action
            var log = new Florence.UserActionLog()
            {
                UserName = filterContext.HttpContext.User.Identity.Name,
                IsAuth = isAuth,
                LogTime = DateTime.Now,
                Path = originalPath,
                PathParam = filterContext.HttpContext.Request.Url.Query,
                UserRole = RoleInAction
            };

            log.Insert();
        }
        else
        {
            //ERROR
            throw new Exception("Internal Error! Action without Role! Please contact Administrator");
        }
        
    }
}
