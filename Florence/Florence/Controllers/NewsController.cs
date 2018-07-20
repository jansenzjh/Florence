using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Florence.Controllers
{
    [Authorize]
    public class NewsController : Controller
    {
        // GET: News
        public ActionResult Index()
        {
            return View(News.GetAll());
        }

        // GET: News/Details/5
        public ActionResult Details(int id)
        {
            return View(News.GetById(id));
        }

        // GET: News/Create
        public ActionResult Create()
        {
            return View(new News());
        }

        // POST: News/Create
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here
				var model = new News();
                TryUpdateModel(model);
                model.PostedAt = DateTime.Now;
                if(SessionItems.CurrentUser == null || SessionItems.CurrentUser.UserID <= 0)
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

        // GET: News/Edit/5
        public ActionResult Edit(int id)
        {
            return View(News.GetById(id));
        }

        // POST: News/Edit/5
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here
				var model = News.GetById(id);
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

        // GET: News/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: News/Delete/5
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
