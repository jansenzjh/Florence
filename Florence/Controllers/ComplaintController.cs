using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Florence.Controllers
{
    [Authorize]
    public class ComplaintController : Controller
    {
        // GET: Complaint
        public ActionResult Index()
        {
            return View(Complaint.GetAll());
        }

        // GET: Complaint/Details/5
        public ActionResult Details(int id)
        {
            return View(Complaint.GetById(id));
        }

        // GET: Complaint/Create
        public ActionResult Create()
        {
            return View(new Complaint());
        }

        // POST: Complaint/Create
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here
				var model = new Complaint();
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

        // GET: Complaint/Edit/5
        public ActionResult Edit(int id)
        {
            return View(Complaint.GetById(id));
        }

        // POST: Complaint/Edit/5
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here
				var model = Complaint.GetById(id);
				TryUpdateModel(model);
                model.SaveOrUpDate();
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Complaint/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: Complaint/Delete/5
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
