using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Florence.Controllers
{
    [Authorize]
    public class JobPostRequisitionController : Controller
    {
        // GET: JobPostRequisition
        public ActionResult Index()
        {
            return View(JobPostRequisition.GetAll());
        }

        // GET: JobPostRequisition/Details/5
        public ActionResult Details(int id)
        {
            return View(JobPostRequisition.GetById(id));
        }

        // GET: JobPostRequisition/Create
        public ActionResult Create()
        {
            return View(new JobPostRequisition());
        }

        // POST: JobPostRequisition/Create
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here
				var model = new JobPostRequisition();
                TryUpdateModel(model);
                if (model.DepartmentSID > 0)
                {
                    model.Department = AdminDepartment.GetById(model.DepartmentSID);
                }
                model.CreatedAt = DateTime.Now;
                if (SessionItems.CurrentUser == null || SessionItems.CurrentUser.UserID <= 0)
                {
                    model.CreatedBy = 1;
                }
                else
                {
                    model.CreatedBy = SessionItems.CurrentUser.UserID;
                }
                model.Insert();
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: JobPostRequisition/Edit/5
        public ActionResult Edit(int id)
        {
            return View(JobPostRequisition.GetById(id));
        }

        // POST: JobPostRequisition/Edit/5
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here
				var model = JobPostRequisition.GetById(id);
                var dept = model.Department;
				TryUpdateModel(model);
                if(model.DepartmentSID > 0 && model.DepartmentSID != dept.id)
                {
                    model.Department = AdminDepartment.GetById(model.DepartmentSID);
                }
                model.CreatedAt = DateTime.Now;
                if (SessionItems.CurrentUser == null || SessionItems.CurrentUser.UserID <= 0)
                {
                    model.CreatedBy = 1;
                }
                else
                {
                    model.CreatedBy = SessionItems.CurrentUser.UserID;
                }
                model.SaveOrUpDate();
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: JobPostRequisition/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: JobPostRequisition/Delete/5
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
