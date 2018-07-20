using Florence.Models.Shared;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Florence.Controllers
{
    [Authorize]
    public class PayrollOptionController : Controller
    {
        [HttpPost]
        public ActionResult SavePayrollOption(FormCollection collection)
        {
            var result = new ResultModel();
            var model = new PayrollOption();
            TryUpdateModel(model);
            if(model.id > 0)
            {
                result = model.SaveOrUpDate();
            }
            else
            {
                result = model.Insert();
            }
            result.ObjectResult = model;

            return new JsonResult() { Data = result };
        }

        public ActionResult PayrollStructure()
        {
            return View();
        }

        // GET: PayrollOption
        public ActionResult Index()
        {
            var objs = PayrollOption.GetAll();
            var obj = new PayrollOption();
            if(objs != null && objs.Count > 0)
            {
                obj = objs.FirstOrDefault();
            }
            return PartialView(obj);
        }

        
        // POST: PayrollOption/Create
        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here
				var model = new PayrollOption();
                TryUpdateModel(model);
                model.Insert();
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: PayrollOption/Edit/5
        public ActionResult Edit(int id)
        {
            return View(PayrollOption.GetById(id));
        }

        // POST: PayrollOption/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here
				var model = PayrollOption.GetById(id);
				TryUpdateModel(model);
                model.SaveOrUpDate();
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

       
    }
}
