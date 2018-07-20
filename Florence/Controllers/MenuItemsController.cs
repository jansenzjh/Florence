using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Florence.Controllers
{
    [Authorize]
    public class MenuItemsController : Controller
    {
        // GET: MenuItems
        public ActionResult Index()
        {
            return View(MenuItems.GetAll());
        }

        // GET: MenuItems/Details/5
        public ActionResult Details(int id)
        {
            return View(MenuItems.GetById(id));
        }

        // GET: MenuItems/Create
        public ActionResult Create()
        {
            return View(new MenuItems());
        }

        // POST: MenuItems/Create
        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here
				var model = new MenuItems();
                TryUpdateModel(model);
                model.Insert();
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: MenuItems/Edit/5
        public ActionResult Edit(int id)
        {
            return View(MenuItems.GetById(id));
        }

        // POST: MenuItems/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here
				var model = MenuItems.GetById(id);
				TryUpdateModel(model);
                model.SaveOrUpDate();
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: MenuItems/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: MenuItems/Delete/5
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
