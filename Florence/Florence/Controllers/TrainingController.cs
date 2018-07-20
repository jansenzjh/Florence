using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Florence.Controllers
{
    [Authorize]
    public class TrainingController : Controller
    {
        // GET: Training
        public ActionResult Index()
        {
            return View(Training.GetAll());
        }

        // GET: Training/Details/5
        public ActionResult Details(int id)
        {
            return View(Training.GetById(id));
        }

        // GET: Training/Create
        public ActionResult Create()
        {
            return View(new Training());
        }

        // POST: Training/Create
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here
				var model = new Training();
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

        // GET: Training/Edit/5
        public ActionResult Edit(int id)
        {
            return View(Training.GetById(id));
        }

        // POST: Training/Edit/5
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here
				var model = Training.GetById(id);
				TryUpdateModel(model);
                model.SaveOrUpDate();
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Training/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: Training/Delete/5
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
