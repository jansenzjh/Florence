using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Florence.Controllers
{
    [Authorize]
    public class TrainingNeedAssessmentController : Controller
    {
        // GET: TrainingNeedAssessment
        public ActionResult Index()
        {
            return View(TrainingNeedAssessment.GetAll());
        }

        // GET: TrainingNeedAssessment/Details/5
        public ActionResult Details(int id)
        {
            return View(TrainingNeedAssessment.GetById(id));
        }

        // GET: TrainingNeedAssessment/Create
        public ActionResult Create()
        {
            return View(new TrainingNeedAssessment());
        }

        // POST: TrainingNeedAssessment/Create
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here
				var model = new TrainingNeedAssessment();
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

        // GET: TrainingNeedAssessment/Edit/5
        public ActionResult Edit(int id)
        {
            return View(TrainingNeedAssessment.GetById(id));
        }

        // POST: TrainingNeedAssessment/Edit/5
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here
				var model = TrainingNeedAssessment.GetById(id);
				TryUpdateModel(model);
                model.SaveOrUpDate();
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: TrainingNeedAssessment/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: TrainingNeedAssessment/Delete/5
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
