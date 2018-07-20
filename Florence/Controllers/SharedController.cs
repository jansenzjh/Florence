using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Florence.Controllers
{
    [Authorize]
    public class SharedController : Controller
    {
        // GET: Shared
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult GetDetailsView(Object obj, string[] excludedProperties)
        {
            ViewData["DetailsViewModelExcludedProperties"] = excludedProperties;
            return PartialView("ModelPropertiesDetailView", obj);
        }

        public ActionResult GetEditView(Object obj, string[] excludedProperties)
        {
            ViewData["EditViewModelExcludedProperties"] = excludedProperties;
            return PartialView("ModelPropertiesEditView", obj);
        }
    }
}