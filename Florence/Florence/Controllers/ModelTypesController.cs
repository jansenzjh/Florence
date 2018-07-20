using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Florence.Controllers
{
    [Authorize]
    public class ModelTypesController : Controller
    {
        // GET: ModelTypes
        public ActionResult Index()
        {
            return View(ModelTypes.GetAll());
        }

        // GET: ModelTypes/Details/5
        public ActionResult Details(int id)
        {
            return View(ModelTypes.GetById(id));
        }

        // GET: ModelTypes/Create
        public ActionResult Create()
        {
            return View(new ModelTypes());
        }

        // POST: ModelTypes/Create
        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here
				var model = new ModelTypes();
                TryUpdateModel(model);
                model.Insert();
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: ModelTypes/Edit/5
        public ActionResult Edit(int id)
        {
            return View(ModelTypes.GetById(id));
        }

        // POST: ModelTypes/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here
				var model = ModelTypes.GetById(id);
				TryUpdateModel(model);
                model.SaveOrUpDate();
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: ModelTypes/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: ModelTypes/Delete/5
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
