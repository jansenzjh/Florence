using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Florence.Controllers
{
    [Authorize]
    public class ReimbursementDetailController : Controller
    {
        // GET: ReimbursementDetail
        public ActionResult Index()
        {
            return View(ReimbursementDetail.GetAll());
        }

        // GET: ReimbursementDetail/Details/5
        public ActionResult Details(int id)
        {
            return View(ReimbursementDetail.GetById(id));
        }

        // GET: ReimbursementDetail/Create
        public ActionResult Create()
        {
            return View(new Reimbursement());
        }

        // POST: ReimbursementDetail/Create
        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here
				var model = new ReimbursementDetail();
                TryUpdateModel(model);
                model.Insert();
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: ReimbursementDetail/Edit/5
        public ActionResult Edit(int id)
        {
            return View(ReimbursementDetail.GetById(id));
        }

        // POST: ReimbursementDetail/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here
				var model = ReimbursementDetail.GetById(id);
				TryUpdateModel(model);
                model.SaveOrUpDate();
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: ReimbursementDetail/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: ReimbursementDetail/Delete/5
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
