using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Florence.Controllers
{
    [Authorize]
    public class SalaryPayslipDetailController : Controller
    {
        // GET: SalaryPayslipDetail
        public ActionResult Index()
        {
            return View(SalaryPayslipDetail.GetAll());
        }

        // GET: SalaryPayslipDetail/Details/5
        public ActionResult Details(int id)
        {
            return View(SalaryPayslipDetail.GetById(id));
        }

        // GET: SalaryPayslipDetail/Create
        public ActionResult Create()
        {
            return View(new SalaryPayslip());
        }

        // POST: SalaryPayslipDetail/Create
        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here
				var model = new SalaryPayslipDetail();
                TryUpdateModel(model);
                model.Insert();
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: SalaryPayslipDetail/Edit/5
        public ActionResult Edit(int id)
        {
            return View(SalaryPayslipDetail.GetById(id));
        }

        // POST: SalaryPayslipDetail/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here
				var model = SalaryPayslipDetail.GetById(id);
				TryUpdateModel(model);
                model.SaveOrUpDate();
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: SalaryPayslipDetail/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: SalaryPayslipDetail/Delete/5
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
