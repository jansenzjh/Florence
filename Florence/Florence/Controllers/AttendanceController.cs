using Florence.Models.Shared;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Florence.Controllers
{
    [Authorize]
    public class AttendanceController : Controller
    {
        public ActionResult AttendanceUserDetail(int userID, DateTime startDate, DateTime endDate)
        {
            var objs = Attendance.GetAttendancesInRange(userID, startDate, endDate);
            return PartialView(objs);
        }
        public ActionResult InsertPunch(Attendance attendance)
        {
            var result = new ResultModel();
            if (attendance != null)
            {
                attendance.PunchDateTime = DateTime.Now;
                result = attendance.Insert();
            }
            return new JsonResult() { Data = result };
        }

        public ActionResult PunchView()
        {
            var currentUser = SessionItems.CurrentUser;
            var lastPunch = Attendance.GetLastPunch(currentUser.UserID);

            //Make sure it is not null or with id = 0
            //Make sure update guid if last time is clock out to update GUID
            if (lastPunch == null || lastPunch.id == 0 || lastPunch.CurrentPunchType.Equals(AttendanceTypes.ClockOut.ToString()))
            {
                lastPunch = new Attendance() {
                    LinkID = Guid.NewGuid(),
                    PunchDateTime = DateTime.Now,
                    UserID = SessionItems.CurrentUser.UserID,
                    CurrentPunchType = AttendanceTypes.ClockOut.ToString()
                };
            }
            return PartialView(lastPunch);
        }

        // GET: Attendance
        public ActionResult Index()
        {
            return View(Attendance.GetAll());
        }

        // GET: Attendance/Details/5
        public ActionResult Details(int id)
        {
            return View(Attendance.GetById(id));
        }

        // GET: Attendance/Create
        public ActionResult Create()
        {
            return View(new Attendance());
        }

        // POST: Attendance/Create
        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here
				var model = new Attendance();
                TryUpdateModel(model);
                model.Insert();
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Attendance/Edit/5
        public ActionResult Edit(int id)
        {
            return View(Attendance.GetById(id));
        }

        // POST: Attendance/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here
				var model = Attendance.GetById(id);
				TryUpdateModel(model);
                model.SaveOrUpDate();
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Attendance/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: Attendance/Delete/5
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
