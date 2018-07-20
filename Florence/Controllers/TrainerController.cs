using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Florence.Controllers
{
    [Authorize]
    public class TrainerController : Controller
    {
        // GET: Trainer
        public ActionResult Index()
        {
            return View(Trainer.GetAll());
        }

        // GET: Trainer/Details/5
        public ActionResult Details(int id)
        {
            return View(Trainer.GetById(id));
        }

        // GET: Trainer/Create
        public ActionResult Create()
        {
            return View(new Trainer());
        }

        // POST: Trainer/Create
        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here
				var model = new Trainer();
                TryUpdateModel(model);
                model.Insert();
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Trainer/Edit/5
        public ActionResult Edit(int id)
        {
            return View(Trainer.GetById(id));
        }

        // POST: Trainer/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here
				var model = Trainer.GetById(id);
				TryUpdateModel(model);
                model.SaveOrUpDate();
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Trainer/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: Trainer/Delete/5
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
