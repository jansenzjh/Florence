using Florence.Models.Shared;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Florence.Controllers
{
    [Authorize]
    public class SalaryCalculationController : Controller
    {
        // GET: SalaryCalculation
        public ActionResult Index()
        {
            return PartialView(SalaryCalculation.GetAll().FirstOrDefault());
        }

        
        [HttpPost]
        public ActionResult Save(FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here
                var result = new ResultModel();
                var model = new SalaryCalculation();
                TryUpdateModel(model);

                //Delete them all then add new. Only allow one record for setting
                var objs = SalaryCalculation.GetAll();
                foreach(var obj in objs)
                {
                    obj.Delete();
                }
                result = model.Insert();
                return new JsonResult() { Data = result };
            }
            catch
            {
                return new JsonResult() { Data = ResultModel.FailResult() };
            }
        }
        
    }
}
