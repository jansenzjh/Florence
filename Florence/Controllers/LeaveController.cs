using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Florence.Controllers
{
    [Authorize]
    public class LeaveController : Controller
    {
        // GET: Leave
        public ActionResult Index()
        {
            return View(Leave.GetAll());
        }

        // GET: Leave/Details/5
        public ActionResult Details(int id)
        {
            return View(Leave.GetById(id));
        }

        // GET: Leave/Create
        public ActionResult Create()
        {
            return View(new Leave());
        }

        // POST: Leave/Create
        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here
				var model = new Leave();
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

        // GET: Leave/Edit/5
        public ActionResult Edit(int id)
        {
            return View(Leave.GetById(id));
        }

        // POST: Leave/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here
				var model = Leave.GetById(id);
				TryUpdateModel(model);
                model.SaveOrUpDate();
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Leave/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: Leave/Delete/5
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
