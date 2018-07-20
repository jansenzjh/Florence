using Florence.Models.Shared;
//using FluentEmail;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Florence.Controllers
{
    public class EmailController : Controller
    {
        // GET: Email
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult ComposeEmail()
        {
            return PartialView();
        }

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult ComposeEmail(string From, string To, string Subject, string Content = "", string CC = "", string BCC = "")
        {
            //var email = Email.From(From)
            //    .To(To)
            //    .Subject(Subject)
            //    .Body(Content)
            //    .BodyAsHtml();
            //if (CC.Contains("@"))
            //{
            //    email = email.CC(CC);
            //}
            //if (BCC.Contains("@"))
            //{
            //    email = email.BCC(BCC);
            //}

            //email.Send();

            return new JsonResult() { Data = ResultModel.FailResult() };
        }
    }
}