using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Florence.Controllers
{
    [Authorize]
    public class ContractController : Controller
    {
        // GET: Contract
        public ActionResult Index()
        {
            return View(Contract.GetAll());
        }

        // GET: Contract/Details/5
        public ActionResult Details(int id)
        {
            return View(Contract.GetById(id));
        }

        // GET: Contract/Create
        public ActionResult Create()
        {
            return View(new Contract());
        }

        // POST: Contract/Create
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here
				var model = new Contract();
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

        // GET: Contract/Edit/5
        public ActionResult Edit(int id)
        {
            return View(Contract.GetById(id));
        }

        // POST: Contract/Edit/5
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here
				var model = Contract.GetById(id);
				TryUpdateModel(model);
                model.SaveOrUpDate();
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Contract/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: Contract/Delete/5
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
