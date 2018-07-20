using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Florence.Models;

namespace Florence.Controllers
{
    public class DashboardsController : Controller
    {
        // GET: Dashboards
        public ActionResult EmploymentDashboard()
        {
            return View(new SPEmployeeDashboardModel().GetEmployeeDashboard());
        }
    }
}