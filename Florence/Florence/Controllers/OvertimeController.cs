using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Florence.Controllers
{
    [Authorize]
    public class OvertimeController : Controller
    {
        // GET: Overtime
        public ActionResult Index()
        {
            return View(Overtime.GetAll());
        }

        // GET: Overtime/Details/5
        public ActionResult Details(int id)
        {
            return View(Overtime.GetById(id));
        }

        // GET: Overtime/Create
        public ActionResult Create()
        {
            return View(new Overtime());
        }

        // POST: Overtime/Create
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here
				var model = new Overtime();
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

        // GET: Overtime/Edit/5
        public ActionResult Edit(int id)
        {
            return View(Overtime.GetById(id));
        }

        // POST: Overtime/Edit/5
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here
				var model = Overtime.GetById(id);
				TryUpdateModel(model);
                model.SaveOrUpDate();
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Overtime/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: Overtime/Delete/5
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
