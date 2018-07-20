using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Florence.Controllers
{
    [Authorize]
    public class JobInterviewController : Controller
    {
        // GET: JobInterview
        public ActionResult Index()
        {
            return View(JobInterview.GetAll());
        }

        // GET: JobInterview/Details/5
        public ActionResult Details(int id)
        {
            return View(JobInterview.GetById(id));
        }

        // GET: JobInterview/Create
        public ActionResult Create()
        {
            return View(new JobInterview());
        }

        // POST: JobInterview/Create
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here
				var model = new JobInterview();
                TryUpdateModel(model);
                model.CreateBy = SessionItems.CurrentUser.UserID;
                model.CreateAt = DateTime.Now;
                model.Insert();
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: JobInterview/Edit/5
        public ActionResult Edit(int id)
        {
            return View(JobInterview.GetById(id));
        }

        // POST: JobInterview/Edit/5
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here
				var model = JobInterview.GetById(id);
				TryUpdateModel(model);
                model.SaveOrUpDate();
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: JobInterview/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: JobInterview/Delete/5
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
