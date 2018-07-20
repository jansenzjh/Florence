using Florence.Models.Shared;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Florence.Controllers
{
    [Authorize]
    public class TaxExemptEmployeeController : Controller
    {
        // GET: TaxExemptEmployee
        public ActionResult Index()
        {
            return View(TaxExemptEmployee.GetAll());
        }

        // GET: TaxExemptEmployee/Details/5
        public ActionResult Details(int id)
        {
            return View(TaxExemptEmployee.GetById(id));
        }

        // GET: TaxExemptEmployee/Create
        public ActionResult Create()
        {
            return View(new TaxExemptEmployee());
        }

        // POST: TaxExemptEmployee/Create
        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here
				var model = new TaxExemptEmployee();
                TryUpdateModel(model);
                model.Insert();
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: TaxExemptEmployee/Edit/5
        public ActionResult Edit(int id)
        {
            return View(TaxExemptEmployee.GetById(id));
        }

        // POST: TaxExemptEmployee/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here
				var model = TaxExemptEmployee.GetById(id);
				TryUpdateModel(model);
                model.SaveOrUpDate();
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: TaxExemptEmployee/Delete/5
        [HttpPost]
        public ActionResult Delete(int id)
        {
            var obj = TaxExemptEmployee.GetById(id);
            if (obj != null)
            {
                obj.Delete();
            }
            return new JsonResult() { Data = ResultModel.SuccessResult() };
        }
        
        
    }
}
