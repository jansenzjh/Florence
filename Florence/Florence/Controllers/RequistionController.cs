using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Florence.Controllers
{
    [Authorize]
    public class RequistionController : Controller
    {
        // GET: Requistion
        public ActionResult Index()
        {
            return View(Requistion.GetAll());
        }

        // GET: Requistion/Details/5
        public ActionResult Details(int id)
        {
            return View(Requistion.GetById(id));
        }

        // GET: Requistion/Create
        public ActionResult Create()
        {
            return View(new Requistion());
        }

        // POST: Requistion/Create
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here
				var model = new Requistion();
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

        // GET: Requistion/Edit/5
        public ActionResult Edit(int id)
        {
            return View(Requistion.GetById(id));
        }

        // POST: Requistion/Edit/5
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here
				var model = Requistion.GetById(id);
				TryUpdateModel(model);
                model.SaveOrUpDate();
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Requistion/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: Requistion/Delete/5
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
