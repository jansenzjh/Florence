using Florence.Models.Shared;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Florence.Controllers
{
    [Authorize]
    public class PayslipAllowanceController : Controller
    {
        // GET: PayslipAllowance
        public ActionResult Index()
        {
            return PartialView(PayslipAllowance.GetAll());
        }

        // GET: PayslipAllowance/Details/5
        public ActionResult Details(int id)
        {
            return View(PayslipAllowance.GetById(id));
        }

        // GET: PayslipAllowance/Create
        public ActionResult Create()
        {
            return PartialView(new PayslipAllowance());
        }

        // POST: PayslipAllowance/Create
        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here
				var model = new PayslipAllowance();
                var result = new ResultModel();
                TryUpdateModel(model);
                result = model.Insert();
                result.ObjectResult = model;
                return new JsonResult() { Data = result };
            }
            catch
            {
                return new JsonResult() { Data =  ResultModel.FailResult() };
            }
        }

        // GET: PayslipAllowance/Edit/5
        public ActionResult Edit(int id)
        {
            return PartialView(PayslipAllowance.GetById(id));
        }

        // POST: PayslipAllowance/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here
				var model = PayslipAllowance.GetById(id);
				TryUpdateModel(model);
                model.SaveOrUpDate();
                return new JsonResult() { Data = model };
            }
            catch
            {
                return View();
            }
        }

        // GET: PayslipAllowance/Delete/5
        [HttpPost]
        public ActionResult Delete(int id)
        {
            var obj = PayslipAllowance.GetById(id);
            if(obj != null)
            {
                obj.Delete();
            }
            return new JsonResult() { Data =  ResultModel.SuccessResult() };
        }

        // POST: PayslipAllowance/Delete/5
        //[HttpPost]
        //public ActionResult Delete(int id, FormCollection collection)
        //{
        //    try
        //    {
        //        // TODO: Add delete logic here

        //        return RedirectToAction("Index");
        //    }
        //    catch
        //    {
        //        return View();
        //    }
        //}
    }
}
