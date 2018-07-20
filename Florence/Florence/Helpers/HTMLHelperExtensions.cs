using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Florence
{
    public static class HTMLHelperExtensions
    {

        public static string IsGroupSelected(this HtmlHelper html, string controller = null, string action = null, int parentID = 0)
        {
            string cssClass = "active";
            string currentAction = (string)html.ViewContext.RouteData.Values["action"];
            string currentController = (string)html.ViewContext.RouteData.Values["controller"];
            var menu = SessionItems.MenuItems;
            if (menu.Where(x => x.Controller.Equals(currentController)).Select(y => y.ParentID).FirstOrDefault() == parentID)
            {
                return cssClass;
            }
            return string.Empty;
        }

        public static string IsSelected(this HtmlHelper html, string controller = null, string action = null)
        {
            string cssClass = "active";
            string currentAction = (string)html.ViewContext.RouteData.Values["action"];
            string currentController = (string)html.ViewContext.RouteData.Values["controller"];

            if (String.IsNullOrEmpty(controller))
                controller = currentController;

            if (String.IsNullOrEmpty(action))
                action = currentAction;

            return controller == currentController && action == currentAction ?
                cssClass : String.Empty;
        }

        public static string ControllerParameterBuilder(this HtmlHelper html, string[] key, string[] value)
        {
            if (key == null || value == null || key.Count() != value.Count())
            {
                return string.Empty;
            }
            List<string> param = new List<string>();
            for (int i = 0; i < key.Count(); i++)
            {
                string p = string.Format("{0}:{1}", key[i], key[i]);
                param.Add(p);
            }
            return string.Format("{{0}}", string.Join(",", param));
        }



        public static string PageClass(this HtmlHelper html)
        {
            string currentAction = (string)html.ViewContext.RouteData.Values["action"];
            return currentAction;
        }
    }
}