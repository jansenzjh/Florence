using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Florence.Controllers
{
    [Authorize]
    public class TrainingEventController : Controller
    {
        // GET: TrainingEvent
        public ActionResult Index()
        {
            return View(TrainingEvent.GetAll());
        }

        // GET: TrainingEvent/Details/5
        public ActionResult Details(int id)
        {
            return View(TrainingEvent.GetById(id));
        }

        // GET: TrainingEvent/Create
        public ActionResult Create()
        {
            return View(new TrainingEvent());
        }

        // POST: TrainingEvent/Create
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here
				var model = new TrainingEvent();
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

        // GET: TrainingEvent/Edit/5
        public ActionResult Edit(int id)
        {
            return View(TrainingEvent.GetById(id));
        }

        // POST: TrainingEvent/Edit/5
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here
				var model = TrainingEvent.GetById(id);
				TryUpdateModel(model);
                model.SaveOrUpDate();
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: TrainingEvent/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: TrainingEvent/Delete/5
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
