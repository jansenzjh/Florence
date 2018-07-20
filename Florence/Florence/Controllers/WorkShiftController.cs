using Florence.Models.Shared;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Florence.Controllers
{
    [Authorize]
    public class WorkShiftController : Controller
    {
        public ActionResult WorkShiftDetailView(string title)
        {
            var objs = new WorkShift().GetObjectsValueFromExpression(x => x.WorkShiftTitle.Equals(title));
            if (objs != null && objs.Count > 0)
            {
                return PartialView(objs);
            }
            return PartialView(new List<WorkShift>());
        }

        public ActionResult DeleteWorkShifts(string workshiftTitle)
        {
            var result = new ResultModel();
            var objs = new WorkShift().GetObjectsValueFromExpression(x => x.WorkShiftTitle.Equals(workshiftTitle));
            if (objs != null && objs.Count > 0)
            {
                foreach(var obj in objs)
                {
                    try
                    {
                        result = obj.Delete();
                    }
                    catch (Exception e)
                    {

                        throw e;
                    }
                    
                }
            }
            return new JsonResult() { Data = result };
        }

        public ActionResult SaveWorkShifts(List<WorkShift> Workshifts)
        {
            var result = new ResultModel();
            if(Workshifts != null && Workshifts.Count > 0)
            {
                foreach(var ws in Workshifts)
                {
                    result = ws.Insert();
                }
            }
            return new JsonResult() { Data = result };
        }

        // GET: WorkShift
        public ActionResult Index()
        {
            return View(WorkShift.GetAll());
        }

        // GET: WorkShift/Details/5
        public ActionResult Details(int id)
        {
            return View(WorkShift.GetById(id));
        }

        // GET: WorkShift/Create
        public ActionResult Create()
        {
            return View(new WorkShift());
        }

        // POST: WorkShift/Create
        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here
				var model = new WorkShift();
                TryUpdateModel(model);
                model.Insert();
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: WorkShift/Edit/5
        public ActionResult Edit(int id)
        {
            return View(WorkShift.GetById(id));
        }

        // POST: WorkShift/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here
				var model = WorkShift.GetById(id);
				TryUpdateModel(model);
                model.SaveOrUpDate();
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: WorkShift/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: WorkShift/Delete/5
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
