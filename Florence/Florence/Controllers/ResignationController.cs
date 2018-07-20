using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Florence.Controllers
{
    [Authorize]
    public class ResignationController : Controller
    {
        // GET: Resignation
        public ActionResult Index()
        {
            return View(Resignation.GetAll());
        }

        // GET: Resignation/Details/5
        public ActionResult Details(int id)
        {
            return View(Resignation.GetById(id));
        }

        // GET: Resignation/Create
        public ActionResult Create()
        {
            return View(new Resignation());
        }

        // POST: Resignation/Create
        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here
				var model = new Resignation();
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

        // GET: Resignation/Edit/5
        public ActionResult Edit(int id)
        {
            return View(Resignation.GetById(id));
        }

        // POST: Resignation/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here
				var model = Resignation.GetById(id);
				TryUpdateModel(model);
                model.SaveOrUpDate();
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Resignation/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: Resignation/Delete/5
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
