using Florence.Models.Shared;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Florence.Controllers
{
    [Authorize]
    public class ProjectActivityController : Controller
    {
        // GET: ProjectActivity
        public ActionResult Index()
        {
            return View(ProjectActivity.GetAll());
        }

        // GET: ProjectActivity/Details/5
        public ActionResult Details(int id)
        {
            return View(ProjectActivity.GetById(id));
        }

        // GET: ProjectActivity/Create
        public ActionResult Create()
        {
            return PartialView(new ProjectActivity());
        }

        // POST: ProjectActivity/Create
        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here
				var model = new ProjectActivity();
                TryUpdateModel(model);
                
                model.Insert();
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        public ActionResult ProjectPunchOutView()
        {
            var project = new Project();
            var iswork = SessionItems.CurrentUser.IsWorkingOnProject(out project);
            if (iswork)
            {
                return PartialView("~/Views/Project/ProjectPunchOutView.cshtml", project);
            }
            else
            {
                return null;
            }
        }

        public ActionResult PunchOutProject(int projectID, string comment)
        {
            var rlt = new ResultModel();
            var currentDateTime = DateTime.Now;
            var userID = SessionItems.CurrentUser.UserID;
            var currentClockInProjectActivity = new ProjectActivity().GetObjectValueFromExpression(x => x.UserID == userID && x.ProjectID == projectID && x.StartTime == x.EndTime, y => y.StartTime);
            if(currentClockInProjectActivity == null || currentClockInProjectActivity.id == 0)
            {
                rlt.BooleanResult = false;
                rlt.StringResult = "Current user did not clock in to this project, please refresh the page!";
            }
            else
            {
                try
                {
                    currentClockInProjectActivity.EndTime = currentDateTime;
                    currentClockInProjectActivity.Comments = comment;
                    currentClockInProjectActivity.Status = ProjectActivityTypes.Close.ToString();
                    rlt = currentClockInProjectActivity.SaveOrUpDate();
                }
                catch (Exception)
                {
                    rlt.BooleanResult = false;
                    rlt.StringResult = "Fail to clock out of the project! Please refresh the page and try again!";
                }
            }
            return new JsonResult() { Data = rlt };
        }

        public ActionResult PunchIntoProject(int projectID)
        {
            var rlt = new ResultModel();
            var currentDateTime = DateTime.Now;
            var model = new ProjectActivity()
            {
                UserID = SessionItems.CurrentUser.UserID,
                StartTime = currentDateTime,
                EndTime = currentDateTime,
                Status = ProjectActivityTypes.Open.ToString(),
                ProjectID = projectID, 
                Title = new Project().GetStringValueFromExpression(x => x.id == projectID, x => x.Name)
            };
            try
            {
                rlt = model.Insert();
                rlt.ObjectResult = model;
            }
            catch (Exception e)
            {

                throw e;
            }
            return new JsonResult() { Data = rlt };
            
        }

        // GET: ProjectActivity/Edit/5
        public ActionResult Edit(int id)
        {
            return View(ProjectActivity.GetById(id));
        }

        // POST: ProjectActivity/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here
				var model = ProjectActivity.GetById(id);
				TryUpdateModel(model);
                model.SaveOrUpDate();
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: ProjectActivity/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: ProjectActivity/Delete/5
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
