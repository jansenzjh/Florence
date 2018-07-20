using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Florence.Controllers
{
    [Authorize]
    public class TerminationController : Controller
    {
        // GET: Termination
        public ActionResult Index()
        {
            return View(Termination.GetAll());
        }

        // GET: Termination/Details/5
        public ActionResult Details(int id)
        {
            return View(Termination.GetById(id));
        }

        // GET: Termination/Create
        public ActionResult Create()
        {
            return View(new Termination());
        }

        // POST: Termination/Create
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here
				var model = new Termination();
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

        // GET: Termination/Edit/5
        public ActionResult Edit(int id)
        {
            return View(Termination.GetById(id));
        }

        // POST: Termination/Edit/5
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here
				var model = Termination.GetById(id);
				TryUpdateModel(model);
                model.SaveOrUpDate();
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Termination/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: Termination/Delete/5
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
