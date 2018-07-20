using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;
using Microsoft.AspNet.Identity;
using Microsoft.Owin.Security;
using Florence.Models;
using NHibernate.Identity;
using Recaptcha.Web;
using Recaptcha.Web.Mvc;
using Florence.Models.Shared;

namespace Florence.Controllers
{
    [Authorize]
    public class EmployeeController : Controller
    {
        #region Role

        public ActionResult Role()
        {
            return View();
        }

        public ActionResult SaveRoles(int employee, List<int> empRoles)
        {
            var emp = Employee.GetById(employee);
            if (emp == null)
            {
                return new JsonResult() { Data = new ResultModel() { BooleanResult = false, StringResult = "Employee does not exist!" } };
            }
            //delete emp role
            Florence.Roles.DeleteRoles(employee);
            //add emp role back
            foreach(var er in empRoles)
            {
                var newUR = new UserRoles() { UserId = emp, RoleId = new Florence.Roles().GetObjectValueFromExpression(x => x.RoleId == er) };
                newUR.Insert();
            }

            return new JsonResult() { Data = new ResultModel() { IntegerResult = employee, IntegerList = empRoles } };
        }

        public ActionResult GetUserRoles(int employee)
        {
            var emp = Employee.GetById(employee);
            var roles = UserRoles.GetUserRoles(employee);
            return new JsonResult() { Data = roles };
        }

        #endregion


        // GET: Employee
        public ActionResult Index()
        {
            return View(Employee.GetAll());
        }

        // GET: Employee/Details/5
        public ActionResult Details(int id)
        {
            return View(Employee.GetById(id));
        }

        // GET: Employee/Create
        public ActionResult Create()
        {
            return View(new Employee());
        }

        // POST: Employee/Create
        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here
				var model = new Employee();
                TryUpdateModel(model);
                model.CreatedAt = DateTime.Now;
                model.CreatedBy = SessionItems.CurrentUser.UserID;
                model.Password = PasswordHash.CreateHash(model.Password);
                var result = model.Insert();

                if (result != null && result.BooleanResult)
                {
                    //Create login for employee
                    var user = model.CreateAppUser();
                    user.Insert();
                }
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Employee/Edit/5
        public ActionResult Edit(int id)
        {
            return View(Employee.GetById(id));
        }

        // POST: Employee/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here
				var model = Employee.GetById(id);
				TryUpdateModel(model);
                model.SaveOrUpDate();
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Employee/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: Employee/Delete/5
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
