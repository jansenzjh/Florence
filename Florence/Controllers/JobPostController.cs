using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Florence.Controllers
{
    [Authorize]
    public class JobPostController : Controller
    {
        // GET: JobPost
        [RoleRequire(RoleInAction = RoleItems.Admin)]
        public ActionResult Index()
        {
            //var um = SessionItems.CurrentUser;
            //if(System.Web.Security.Roles.IsUserInRole("Admin")){
            //    return RedirectToAction("Index", "Home");
            //}
            return View(JobPost.GetAll());
        }

        // GET: JobPost/Details/5
        public ActionResult Details(int id)
        {
            return View(JobPost.GetById(id));
        }

        // GET: JobPost/Create
        public ActionResult Create()
        {
            return View(new JobPost());
        }

        // POST: JobPost/Create
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here
				var model = new JobPost();
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

        // GET: JobPost/Edit/5
        public ActionResult Edit(int id)
        {
            return View(JobPost.GetById(id));
        }

        // POST: JobPost/Edit/5
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here
				var model = JobPost.GetById(id);
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

        // GET: JobPost/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: JobPost/Delete/5
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
