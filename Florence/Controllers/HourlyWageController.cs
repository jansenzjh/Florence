using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Florence.Controllers
{
    [Authorize]
    public class HourlyWageController : Controller
    {
        // GET: HourlyWage
        public ActionResult Index()
        {
            return View(HourlyWage.GetAll());
        }

        // GET: HourlyWage/Details/5
        public ActionResult Details(int id)
        {
            return View(HourlyWage.GetById(id));
        }

        // GET: HourlyWage/Create
        public ActionResult Create()
        {
            return View(new HourlyWage());
        }

        // POST: HourlyWage/Create
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here
				var model = new HourlyWage();
                TryUpdateModel(model);
                model.CreatedAt = DateTime.Now;
                model.CreatedBy = SessionItems.CurrentUser.UserID;
                model.Insert();
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: HourlyWage/Edit/5
        public ActionResult Edit(int id)
        {
            return View(HourlyWage.GetById(id));
        }

        // POST: HourlyWage/Edit/5
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here
				var model = HourlyWage.GetById(id);
				TryUpdateModel(model);
                model.SaveOrUpDate();
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: HourlyWage/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: HourlyWage/Delete/5
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
