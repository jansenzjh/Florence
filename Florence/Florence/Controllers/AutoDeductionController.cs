using Florence.Models.Shared;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Florence.Controllers
{
    [Authorize]
    public class AutoDeductionController : Controller
    {
        // GET: AutoDeduction
        public ActionResult Index()
        {
            return PartialView(AutoDeduction.GetAll());
        }

        
        // POST: AutoDeduction/Create
        [HttpPost]
        public ActionResult Save(List<AutoDeduction> objs)
        {
            try
            {
                if(objs != null && objs.Count > 0)
                {
                    var deleteObjs = AutoDeduction.GetAll();
                    foreach(var d in deleteObjs)
                    {
                        d.Delete();
                    }
                    foreach(var obj in objs)
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
