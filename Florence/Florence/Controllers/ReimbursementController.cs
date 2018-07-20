using Florence.Models.Shared;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Florence.Controllers
{
    [Authorize]
    public class ReimbursementController : Controller
    {
        // GET: Reimbursement
        public ActionResult Index()
        {
            return View(Reimbursement.GetAll());
        }

        // GET: Reimbursement/Details/5
        public ActionResult Details(int id)
        {
            return View(Reimbursement.GetById(id));
        }

        // GET: Reimbursement/Create
        public ActionResult Create()
        {
            return View(new Reimbursement());
        }

        // POST: Reimbursement/Create
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Create(Reimbursement model, List<ReimbursementDetail> details)
        {
            try
            {
                // TODO: Add insert logic here
                var result = new ResultModel();
				//var model = new Reimbursement();
                if(model != null)
                {
                    model.CreatedAt = DateTime.Now;
                    model.CreatedBy = SessionItems.CurrentUser.UserID;
                    result = model.Insert();
                }

                if (result.BooleanResult)
                {
                    foreach(var obj in details)
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
                return new JsonResult() { Data =  ResultModel.FailResult() };
            }
        }

        // GET: Reimbursement/Edit/5
        public ActionResult Edit(int id)
        {
            return View(Reimbursement.GetById(id));
        }

        // POST: Reimbursement/Edit/5
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Edit(Reimbursement model, List<ReimbursementDetail> details)
        {
            try
            {
                // TODO: Add update logic here
                var result = new ResultModel();
                if(model.id > 0)
                {
                    result = model.SaveOrUpDate();
                }

                if (result.BooleanResult)
                {
                    foreach (var obj in details)
                    {
                        if(obj.id > 0)
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

        // GET: Reimbursement/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: Reimbursement/Delete/5
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
