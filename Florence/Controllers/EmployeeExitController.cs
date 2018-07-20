using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Florence.Controllers
{
    [Authorize]
    public class EmployeeExitController : Controller
    {
        // GET: EmployeeExit
        public ActionResult Index()
        {
            return View(EmployeeExit.GetAll());
        }

        // GET: EmployeeExit/Details/5
        public ActionResult Details(int id)
        {
            return View(EmployeeExit.GetById(id));
        }

        // GET: EmployeeExit/Create
        public ActionResult Create()
        {
            return View(new EmployeeExit());
        }

        // POST: EmployeeExit/Create
        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here
				var model = new EmployeeExit();
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

        // GET: EmployeeExit/Edit/5
        public ActionResult Edit(int id)
        {
            return View(EmployeeExit.GetById(id));
        }

        // POST: EmployeeExit/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here
				var model = EmployeeExit.GetById(id);
				TryUpdateModel(model);
                model.SaveOrUpDate();
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: EmployeeExit/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: EmployeeExit/Delete/5
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
