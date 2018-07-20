using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Florence.Controllers
{
    [Authorize]
    public class JobTestController : Controller
    {
        // GET: JobTest
        public ActionResult Index()
        {
            return View(JobTest.GetAll());
        }

        // GET: JobTest/Details/5
        public ActionResult Details(int id)
        {
            return View(JobTest.GetById(id));
        }

        // GET: JobTest/Create
        public ActionResult Create()
        {
            return View(new JobTest());
        }

        // POST: JobTest/Create
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here
				var model = new JobTest();
                TryUpdateModel(model);
                model.CreateAt = DateTime.Now;
                model.CreateBy = SessionItems.CurrentUser.UserID;
                model.Insert();
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: JobTest/Edit/5
        public ActionResult Edit(int id)
        {
            return View(JobTest.GetById(id));
        }

        // POST: JobTest/Edit/5
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here
				var model = JobTest.GetById(id);
				TryUpdateModel(model);
                model.SaveOrUpDate();
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: JobTest/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: JobTest/Delete/5
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
