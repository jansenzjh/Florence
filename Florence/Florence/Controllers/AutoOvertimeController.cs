using Florence.Models.Shared;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Florence.Controllers
{
    [Authorize]
    public class AutoOvertimeController : Controller
    {
        // GET: AutoOvertime
        public ActionResult Index()
        {
            return PartialView(AutoOvertime.GetAll());
        }
        

        // POST: AutoOvertime/Create
        [HttpPost]
        public ActionResult Save(List<AutoOvertime> objs)
        {
            try
            {
                // TODO: Add insert logic here
				if (objs!= null && objs.Count > 0)
                {
                    var deleteObjs = AutoOvertime.GetAll();
                    foreach (var d in deleteObjs)
                    {
                        d.Delete();
                    }
                    foreach (var obj in objs)
                    {
                        obj.Insert();
                    }

                }
                return new JsonResult() { Data = ResultModel.SuccessResult() };
            }
            catch
            {
                return new JsonResult() { Data = ResultModel.FailResult() };
            }
        }
        
    }
}
