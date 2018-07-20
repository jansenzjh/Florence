using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Florence.Controllers
{
    [Authorize]
    public class CompanyController : Controller
    {
        // GET: Company
        public ActionResult Index()
        {
            var models = Company.GetAll();
            return View(models);
        }

        // GET: Company/Details/5
        public ActionResult Details(int id)
        {
            var model = Company.GetById(id);
            return View(model);
        }

        // GET: Company/Create
        public ActionResult Create()
        {
            return View(new Attendance());
        }

        // POST: Company/Create
        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here
                var model = new Company();
                TryUpdateModel(model);

                //Logo
                model.Logo = UploadLogoImage(model.Logo);
                //End of logo

                model.Insert();
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        private string UploadLogoImage(string oldLogoName)
        {
            if (Request.Files.Count > 0)
            {
                var file = Request.Files[0];

                if (file != null && file.ContentLength > 0)
                {
                    var fileName = Path.GetFileName(file.FileName);
                    var path = Path.Combine(Server.MapPath("~/Images/"), fileName);
                    file.SaveAs(path);
                    return fileName;
                }
            }
            return oldLogoName;
        }

        // GET: Company/Edit/5
        public ActionResult Edit(int id)
        {
            var model = Company.GetById(id);
            return View(model);
        }

        // POST: Company/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here
                var model = Company.GetById(id);
                TryUpdateModel(model);
                //Logo
                model.Logo = UploadLogoImage(model.Logo);
                //End of logo
                model.SaveOrUpDate();
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Company/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: Company/Delete/5
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
