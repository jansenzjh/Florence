using Florence.Models.Shared;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Florence.Controllers
{
    [Authorize]
    public class SalaryController : Controller
    {
        // GET: Salary
        public ActionResult Index()
        {
            return View();
        }
        
        
        public ActionResult SalaryDetailView(int employeeID)
        {
            var obj = new Salary().GetObjectValueFromExpression(x => x.Employee == employeeID);
            if(obj == null || obj.id < 0)
            {
                obj = new Salary() { Employee = employeeID};
            }
            return PartialView(obj);
        }

        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here
                var result = new ResultModel();
                var model = new Salary();
                if (id > 0)
                {
                    model = Salary.GetById(id);
                    TryUpdateModel(model);
                    result = model.SaveOrUpDate();
                }
                else
                {
                    model = new Salary();
                    TryUpdateModel(model);
                    result = model.Insert();
                }
                
                return new JsonResult() { Data = model };
            }
            catch
            {
                return new JsonResult() { Data = ResultModel.FailResult() };
            }
        }
    }
}
