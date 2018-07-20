using Florence.Models.Shared;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Florence.Controllers
{
    [Authorize]
    public class SalaryPayslipController : Controller
    {
        // GET: SalaryPayslip
        public ActionResult Index()
        {
            return View(SalaryPayslip.GetAll());
        }

        // GET: SalaryPayslip/Details/5
        public ActionResult Details(int id)
        {
            return View(SalaryPayslip.GetById(id));
        }

        // GET: SalaryPayslip/Create
        public ActionResult Create()
        {
            return View(new SalaryPayslip());
        }

        // POST: SalaryPayslip/Create
        [HttpPost]
        public ActionResult Create(SalaryPayslip model, List<SalaryPayslipDetail> details)
        {
            try
            {
                // TODO: Add insert logic here
                var result = new ResultModel();
                //var model = new Reimbursement();
                if (model != null)
                {
                    model.CreatedAt = DateTime.Now;
                    model.CreatedBy = SessionItems.CurrentUser.UserID;
                    result = model.Insert();
                }

                if (result.BooleanResult)
                {
                    foreach (var obj in details)
                    {
                        obj.Insert();
                    }
                }
                else
                {
                    //Bad result
                    result.StringResult += "Save Error";
                    return new JsonResult() { Data = result };
                }

                return new JsonResult() { Data = result };
            }
            catch
            {
                return new JsonResult() { Data = ResultModel.FailResult() };
            }
        }

        // GET: SalaryPayslip/Edit/5
        public ActionResult Edit(int id)
        {
            return View(SalaryPayslip.GetById(id));
        }

        // POST: SalaryPayslip/Edit/5
        [HttpPost]
        public ActionResult Edit(SalaryPayslip model, List<SalaryPayslipDetail> details)
        {
            try
            {
                var result = new ResultModel();
                if (model.id > 0)
                {
                    result = model.SaveOrUpDate();
                }

                if (result.BooleanResult)
                {
                    foreach (var obj in details)
                    {
                        if (obj.id > 0)
                        {
                            obj.SaveOrUpDate();
                        }
                        else
                        {
                            obj.Insert();
                        }

                    }
                }
                return new JsonResult() { Data = result };
            }
            catch
            {
                return new JsonResult() { Data = ResultModel.FailResult() };
            }
        }

        // GET: SalaryPayslip/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: SalaryPayslip/Delete/5
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
