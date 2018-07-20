using Florence.Models.Shared;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Florence.Controllers
{
    [Authorize]
    public class ExtraPayrollItemsController : Controller
    {
        public ActionResult SaveExtraItems(List<ExtraPayrollItems> objs)
        {
            if(objs != null && objs.Count > 0)
            {
                //delete all
                var all = ExtraPayrollItems.GetAll();
                if (all != null && all.Count > 0)
                {
                    foreach(var obj in all)
                    {
                        obj.Delete();
                    }
                }
                //add them back
                foreach(var obj in objs.Where(x=> x.Amount > 0 && !string.IsNullOrEmpty(x.PayrollItemName)).ToList())
                {
                    obj.Insert();
                }
            }
            return new JsonResult() { Data = ResultModel.SuccessResult() };
        }

        // GET: ExtraPayrollItems
        public ActionResult Index()
        {
            return PartialView(ExtraPayrollItems.GetAll());
        }

        // GET: ExtraPayrollItems/Details/5
        public ActionResult Details(int id)
        {
            return View(ExtraPayrollItems.GetById(id));
        }

        // GET: ExtraPayrollItems/Create
        public ActionResult Create()
        {
            return View(new ExtraPayrollItems());
        }

        // POST: ExtraPayrollItems/Create
        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here
				var model = new ExtraPayrollItems();
                TryUpdateModel(model);
                model.Insert();
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: ExtraPayrollItems/Edit/5
        public ActionResult Edit(int id)
        {
            return View(ExtraPayrollItems.GetById(id));
        }

        // POST: ExtraPayrollItems/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here
				var model = ExtraPayrollItems.GetById(id);
				TryUpdateModel(model);
                model.SaveOrUpDate();
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: ExtraPayrollItems/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: ExtraPayrollItems/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}
