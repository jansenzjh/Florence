using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Florence.Controllers
{
    [Authorize]
    public class EmployeeJoiningController : Controller
    {
        // GET: EmployeeJoining
        public ActionResult Index()
        {
            return View(EmployeeJoining.GetAll());
        }

        // GET: EmployeeJoining/Details/5
        public ActionResult Details(int id)
        {
            return View(EmployeeJoining.GetById(id));
        }

        // GET: EmployeeJoining/Create
        public ActionResult Create()
        {
            return View(new EmployeeJoining());
        }

        // POST: EmployeeJoining/Create
        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here
				var model = new EmployeeJoining();
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

        // GET: EmployeeJoining/Edit/5
        public ActionResult Edit(int id)
        {
            return View(EmployeeJoining.GetById(id));
        }

        // POST: EmployeeJoining/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here
				var model = EmployeeJoining.GetById(id);
				TryUpdateModel(model);
                model.SaveOrUpDate();
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: EmployeeJoining/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: EmployeeJoining/Delete/5
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
