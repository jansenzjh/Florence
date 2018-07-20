using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Florence.Controllers
{
    public class ProjectParticipantsController : Controller
    {
        // GET: ProjectParticipants
        public ActionResult Index()
        {
            return View(ProjectParticipants.GetAll());
        }

        // GET: ProjectParticipants/Details/5
        public ActionResult Details(int id)
        {
            return View(ProjectParticipants.GetById(id));
        }

        // GET: ProjectParticipants/Create
        public ActionResult Create()
        {
            return View(new ProjectParticipants());
        }

        // POST: ProjectParticipants/Create
        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here
				var model = new ProjectParticipants();
                TryUpdateModel(model);
                model.Insert();
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: ProjectParticipants/Edit/5
        public ActionResult Edit(int id)
        {
            return View(ProjectParticipants.GetById(id));
        }

        // POST: ProjectParticipants/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here
				var model = ProjectParticipants.GetById(id);
				TryUpdateModel(model);
                model.SaveOrUpDate();
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: ProjectParticipants/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: ProjectParticipants/Delete/5
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
