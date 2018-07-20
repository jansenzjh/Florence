using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Florence.Controllers
{
    [Authorize]
    public class PolicyController : Controller
    {
        // GET: Policy
        public ActionResult Index()
        {
            return View(Policy.GetAll());
        }

        // GET: Policy/Details/5
        public ActionResult Details(int id)
        {
            return View(Policy.GetById(id));
        }

        // GET: Policy/Create
        public ActionResult Create()
        {
            return View(new Policy());
        }

        // POST: Policy/Create
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here
				var model = new Policy();
                TryUpdateModel(model);
                model.PostedAt = DateTime.Now;
                if (string.IsNullOrEmpty(model.PolicyType))
                {
                    model.PolicyType = "General Policies";
                }
                
                if (SessionItems.CurrentUser == null || SessionItems.CurrentUser.UserID <= 0)
                {
                    model.PostUser = 1;
                }
                else
                {
                    model.PostUser = SessionItems.CurrentUser.UserID;
                }
                model.Insert();
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Policy/Edit/5
        public ActionResult Edit(int id)
        {
            return View(Policy.GetById(id));
        }

        // POST: Policy/Edit/5
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here
				var model = Policy.GetById(id);
				TryUpdateModel(model);
                model.PostedAt = DateTime.Now;
                if (SessionItems.CurrentUser == null || SessionItems.CurrentUser.UserID <= 0)
                {
                    model.PostUser = 1;
                }
                else
                {
                    model.PostUser = SessionItems.CurrentUser.UserID;
                }
                model.SaveOrUpDate();
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Policy/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: Policy/Delete/5
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
