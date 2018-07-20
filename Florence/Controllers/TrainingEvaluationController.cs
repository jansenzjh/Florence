using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Florence.Controllers
{
    [Authorize]
    public class TrainingEvaluationController : Controller
    {
        // GET: TrainingEvaluation
        public ActionResult Index()
        {
            return View(TrainingEvaluation.GetAll());
        }

        // GET: TrainingEvaluation/Details/5
        public ActionResult Details(int id)
        {
            return View(TrainingEvaluation.GetById(id));
        }

        // GET: TrainingEvaluation/Create
        public ActionResult Create()
        {
            return View(new TrainingEvaluation());
        }

        // POST: TrainingEvaluation/Create
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here
				var model = new TrainingEvaluation();
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

        // GET: TrainingEvaluation/Edit/5
        public ActionResult Edit(int id)
        {
            return View(TrainingEvaluation.GetById(id));
        }

        // POST: TrainingEvaluation/Edit/5
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here
				var model = TrainingEvaluation.GetById(id);
				TryUpdateModel(model);
                model.SaveOrUpDate();
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: TrainingEvaluation/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: TrainingEvaluation/Delete/5
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
