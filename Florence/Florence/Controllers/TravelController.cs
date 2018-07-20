using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Florence.Controllers
{
    [Authorize]
    public class TravelController : Controller
    {
        // GET: Travel
        public ActionResult Index()
        {
            return View(Travel.GetAll());
        }

        // GET: Travel/Details/5
        public ActionResult Details(int id)
        {
            return View(Travel.GetById(id));
        }

        // GET: Travel/Create
        public ActionResult Create()
        {
            return View(new Travel());
        }

        // POST: Travel/Create
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here
				var model = new Travel();
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

        // GET: Travel/Edit/5
        public ActionResult Edit(int id)
        {
            return View(Travel.GetById(id));
        }

        // POST: Travel/Edit/5
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here
				var model = Travel.GetById(id);
				TryUpdateModel(model);
                model.SaveOrUpDate();
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Travel/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: Travel/Delete/5
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
