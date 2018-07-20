using Florence.Models.Shared;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Florence.Controllers
{
    [Authorize]
    public class TaxRuleController : Controller
    {
        public ActionResult TaxRuleDetailView(string title)
        {
            var objs = new TaxRule().GetObjectsValueFromExpression(x => x.RuleName.Equals(title));
            if (objs != null && objs.Count > 0)
            {
                return PartialView(objs);
            }
            return PartialView(new List<TaxRule>());
        }

        // GET: TaxRule
        public ActionResult Index()
        {
            return PartialView();
        }

        // GET: TaxRule/Details/5
        public ActionResult Details(int id)
        {
            return View(TaxRule.GetById(id));
        }

        // GET: TaxRule/Create
        public ActionResult Create()
        {
            
            return PartialView(new List<TaxRule>());
        }

        // POST: TaxRule/Create
        [HttpPost]
        public ActionResult Create(List<TaxRule> objs)
        {
            try
            {
                if(objs != null && objs.Count > 0)
                {
                    foreach(var obj in objs)
                    {
                        obj.Insert();
                    }
                }
                return new JsonResult() { Data = ResultModel.SuccessResult() };
            }
            catch
            {
                return PartialView();
            }
        }

        
        // POST: TaxRule/Edit/5
        [HttpPost]
        public ActionResult Edit(List<TaxRule> objs)
        {
            try
            {
                if(objs != null && objs.Count > 0)
                {
                    //Delete them all
                    var title = objs.FirstOrDefault().RuleName;
                    var deleteObjs = new TaxRule().GetObjectsValueFromExpression(x => x.RuleName.Equals(title));
                    if(deleteObjs != null && deleteObjs.Count > 0)
                    {
                        foreach(var obj in deleteObjs)
                        {
                            obj.Delete();
                        }
                    }
                    //Then add new one(faster than modified the old one because the id was unknown
                    foreach(var obj in objs)
                    {
                        obj.Insert();
                    }
                }
                return new JsonResult() { Data = ResultModel.SuccessResult() };
            }
            catch
            {
                return new JsonResult() { Data = ResultModel.FailResult() };
            }
        }

        
        // POST: TaxRule/Delete/5
        [HttpPost]
        public ActionResult Delete(string title)
        {
            try
            {
                var deleteObjs = new TaxRule().GetObjectsValueFromExpression(x => x.RuleName.Equals(title));
                if (deleteObjs != null && deleteObjs.Count > 0)
                {
                    foreach (var obj in deleteObjs)
                    {
                        obj.Delete();
                    }
                }
                
                return new JsonResult() { Data = ResultModel.SuccessResult() };
            }
            catch
            {
                return new JsonResult() { Data = ResultModel.FailResult() };
            }
        }
    }
}
