using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Florence.Controllers
{
    [Authorize]
    public class SalaryItemController : Controller
    {
        // GET: SalaryItem
        public ActionResult Index()
        {
            return View(SalaryItem.GetAll());
        }

        // GET: SalaryItem/Details/5
        public ActionResult Details(int id)
        {
            return View(SalaryItem.GetById(id));
        }

        // GET: SalaryItem/Create
        public ActionResult Create()
        {
            return View(new SalaryItem());
        }

        // POST: SalaryItem/Create
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here
				var model = new SalaryItem();
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

        // GET: SalaryItem/Edit/5
        public ActionResult Edit(int id)
        {
            return View(SalaryItem.GetById(id));
        }

        // POST: SalaryItem/Edit/5
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here
				var model = SalaryItem.GetById(id);
				TryUpdateModel(model);
                model.SaveOrUpDate();
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: SalaryItem/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: SalaryItem/Delete/5
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
