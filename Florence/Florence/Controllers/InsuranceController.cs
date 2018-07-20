using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Florence.Controllers
{
    [Authorize]
    public class InsuranceController : Controller
    {
        // GET: Insurance
        public ActionResult Index()
        {
            return View(Insurance.GetAll());
        }

        // GET: Insurance/Details/5
        public ActionResult Details(int id)
        {
            return View(Insurance.GetById(id));
        }

        // GET: Insurance/Create
        public ActionResult Create()
        {
            return View(new Insurance());
        }

        // POST: Insurance/Create
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here
				var model = new Insurance();
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

        // GET: Insurance/Edit/5
        public ActionResult Edit(int id)
        {
            return View(Insurance.GetById(id));
        }

        // POST: Insurance/Edit/5
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here
				var model = Insurance.GetById(id);
				TryUpdateModel(model);
                model.SaveOrUpDate();
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Insurance/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: Insurance/Delete/5
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
