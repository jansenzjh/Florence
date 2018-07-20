using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Florence.Controllers
{
    [Authorize]
    public class WarningController : Controller
    {
        // GET: Warning
        public ActionResult Index()
        {
            return View(Warning.GetAll());
        }

        // GET: Warning/Details/5
        public ActionResult Details(int id)
        {
            return View(Warning.GetById(id));
        }

        // GET: Warning/Create
        public ActionResult Create()
        {
            return View(new Warning());
        }

        // POST: Warning/Create
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here
				var model = new Warning();
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

        // GET: Warning/Edit/5
        public ActionResult Edit(int id)
        {
            return View(Warning.GetById(id));
        }

        // POST: Warning/Edit/5
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here
				var model = Warning.GetById(id);
				TryUpdateModel(model);
                model.SaveOrUpDate();
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Warning/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: Warning/Delete/5
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
