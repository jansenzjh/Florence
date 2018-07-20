using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Florence.Controllers
{
    public class UserActionLogController : Controller
    {
        // GET: UserActionLog
        public ActionResult Index()
        {
            return View(UserActionLog.GetAll());
        }

        // GET: UserActionLog/Details/5
        public ActionResult Details(int id)
        {
            return View(UserActionLog.GetById(id));
        }

        // GET: UserActionLog/Create
        public ActionResult Create()
        {
            return View(new UserActionLog());
        }

        // POST: UserActionLog/Create
        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here
				var model = new UserActionLog();
                TryUpdateModel(model);
                model.Insert();
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: UserActionLog/Edit/5
        public ActionResult Edit(int id)
        {
            return View(UserActionLog.GetById(id));
        }

        // POST: UserActionLog/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here
				var model = UserActionLog.GetById(id);
				TryUpdateModel(model);
                model.SaveOrUpDate();
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: UserActionLog/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: UserActionLog/Delete/5
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
