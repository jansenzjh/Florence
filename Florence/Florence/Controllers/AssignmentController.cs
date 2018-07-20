using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Florence.Controllers
{
    [Authorize]
    public class AssignmentController : Controller
    {
        // GET: Assignment
        public ActionResult Index()
        {
            return View(Assignment.GetAll());
        }

        // GET: Assignment/Details/5
        public ActionResult Details(int id)
        {
            return View(Assignment.GetById(id));
        }

        // GET: Assignment/Create
        public ActionResult Create()
        {
            return View(new Assignment());
        }

        // POST: Assignment/Create
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here
				var model = new Assignment();
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

        // GET: Assignment/Edit/5
        public ActionResult Edit(int id)
        {
            return View(Assignment.GetById(id));
        }

        // POST: Assignment/Edit/5
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here
				var model = Assignment.GetById(id);
				TryUpdateModel(model);
                model.SaveOrUpDate();
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Assignment/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: Assignment/Delete/5
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
