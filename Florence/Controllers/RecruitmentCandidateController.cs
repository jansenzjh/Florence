using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Florence.Models.Shared;

namespace Florence.Controllers
{
    [Authorize]
    public class RecruitmentCandidateController : Controller
    {
        public ActionResult AddCandidateScore(Guid linkID)
        {
            return PartialView(new CandidateScore() { LinkID = linkID});
        }

        public ActionResult SaveCandidateScore(CandidateScore score)
        {
            var result = new ResultModel();
            if(score != null)
            {
                score.RatedBy = SessionItems.CurrentUser.UserID;
                result = score.Insert();
            }
            return new JsonResult() { Data = result };
        }

        public ActionResult CandidateListPreview(string jobPostId)
        {
            var models = new RecruitmentCandidate().GetObjectsValueFromExpression(x => x.JobField == jobPostId).ToList();
            return PartialView("CandidateListPreview", models);
        }

        public ActionResult RecruitmentDashBoard()
        {
            return View();
        }

        public ActionResult saveRecruitmentData(List<CandidateWorkExperience> work,
                                                List<CandidateTraining> train,
                                                List<CandidateEducation> edu,
                                                List<CandidateLanguage> lang,
                                                List<CandidateSkill> skill,
                                                List<CandidateReference> reference,
                                                RecruitmentCandidate candidate)
        {
            try
            {
                if(work != null && work.Count > 0)
                {
                    foreach (CandidateWorkExperience w in work)
                    {
                        w.Insert();
                    }
                }
                if(train != null && train.Count > 0)
                {
                    foreach (CandidateTraining t in train)
                    {
                        t.Insert();
                    }
                }
                if(edu != null && edu.Count > 0)
                {
                    foreach (CandidateEducation e in edu)
                    {
                        e.Insert();
                    }
                }
                if(lang != null && lang.Count > 0)
                {
                    foreach (CandidateLanguage l in lang)
                    {
                        l.Insert();
                    }
                }
                if(skill != null && skill.Count > 0)
                {
                    foreach (CandidateSkill s in skill)
                    {
                        s.Insert();
                    }
                }
                if(reference != null && reference.Count > 0)
                {
                    foreach (CandidateReference r in reference)
                    {
                        r.Insert();
                    }
                }
                
                candidate.Insert();
            }
            catch (Exception e)
            {
                return new JsonResult() { Data = new ResultModel() { StringResult = e.Message + e.StackTrace, ObjectResult = candidate } };
            }
            return new JsonResult() { Data = new ResultModel() { JavascriptResult = "window.location.href = '/'" } };
        }

        public ActionResult EditWorkExpForm()
        {
            return PartialView(new CandidateWorkExperience());
        }

        public ActionResult EditTrainingForm()
        {
            return PartialView();
        }

        public ActionResult EditEducationForm()
        {
            return PartialView();
        }

        public ActionResult EditLanguageForm()
        {
            return PartialView();
        }

        public ActionResult EditSkillForm()
        {
            return PartialView();
        }

        public ActionResult EditReferenceForm()
        {
            return PartialView();
        }

        // GET: RecruitmentCandidate
        public ActionResult Index()
        {
            return View(RecruitmentCandidate.GetAll());
        }

        // GET: RecruitmentCandidate/Details/5
        public ActionResult Details(int id)
        {
            return View(RecruitmentCandidate.GetById(id));
        }

        // GET: RecruitmentCandidate/Create
        public ActionResult Create()
        {
            var model = new RecruitmentCandidate() { LinkID = Guid.NewGuid()};
            return View(model);
        }

        // POST: RecruitmentCandidate/Create
        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here
				var model = new RecruitmentCandidate();
                TryUpdateModel(model);
                model.Insert();
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: RecruitmentCandidate/Edit/5
        public ActionResult Edit(int id)
        {
            return View(RecruitmentCandidate.GetById(id));
        }

        // POST: RecruitmentCandidate/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here
				var model = RecruitmentCandidate.GetById(id);
				TryUpdateModel(model);
                model.SaveOrUpDate();
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: RecruitmentCandidate/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: RecruitmentCandidate/Delete/5
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
