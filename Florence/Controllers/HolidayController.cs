﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Florence.Controllers
{
    [Authorize]
    public class HolidayController : Controller
    {
        // GET: Holiday
        public ActionResult Index()
        {
            return View(Holiday.GetAll());
        }

        // GET: Holiday/Details/5
        public ActionResult Details(int id)
        {
            return View(Holiday.GetById(id));
        }

        // GET: Holiday/Create
        public ActionResult Create()
        {
            return View(new Holiday());
        }

        // POST: Holiday/Create
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here
				var model = new Holiday();
                TryUpdateModel(model);
                model.Insert();
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Holiday/Edit/5
        public ActionResult Edit(int id)
        {
            return View(Holiday.GetById(id));
        }

        // POST: Holiday/Edit/5
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here
				var model = Holiday.GetById(id);
				TryUpdateModel(model);
                model.SaveOrUpDate();
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Holiday/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: Holiday/Delete/5
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
