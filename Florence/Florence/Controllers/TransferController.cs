using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Florence.Controllers
{
    [Authorize]
    public class TransferController : Controller
    {
        // GET: Transfer
        public ActionResult Index()
        {
            return View(Transfer.GetAll());
        }

        // GET: Transfer/Details/5
        public ActionResult Details(int id)
        {
            return View(Transfer.GetById(id));
        }

        // GET: Transfer/Create
        public ActionResult Create()
        {
            return View(new Transfer());
        }

        // POST: Transfer/Create
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here
				var model = new Transfer();
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

        // GET: Transfer/Edit/5
        public ActionResult Edit(int id)
        {
            return View(Transfer.GetById(id));
        }

        // POST: Transfer/Edit/5
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here
				var model = Transfer.GetById(id);
				TryUpdateModel(model);
                model.SaveOrUpDate();
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Transfer/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: Transfer/Delete/5
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
