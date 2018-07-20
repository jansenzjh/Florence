using System;
using System.Text;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;


namespace Florence {
    
    public class RecruitmentCandidate : ObjectBase<RecruitmentCandidate> {
        public virtual int id { get; set; }
        [Required]
        public virtual System.Guid LinkID { get; set; }
        [Required]
        public virtual string Name { get; set; }
        [Required]
        public virtual string Gender { get; set; }
        [Required]
        public virtual DateTime DOB { get; set; }
        [Required]
        public virtual string Nationality { get; set; }
        [Required]
        public virtual string JobField { get; set; }
        public virtual bool? HaveWorkingPermit { get; set; }
        [Required]
        public virtual string Email { get; set; }
        [Required]
        public virtual string Phone { get; set; }
        [Required]
        public virtual string Address { get; set; }
        [Required]
        public virtual string City { get; set; }
        [Required]
        public virtual string State { get; set; }
        [Required]
        public virtual string Zip { get; set; }
        [Required]
        public virtual string Country { get; set; }
        [Required]
        public virtual string Interests { get; set; }
        [Required]
        public virtual string Achievements { get; set; }
        
        public virtual int Age()
        {
            return DateTime.Today.Year - this.DOB.Year;
        }

        public virtual int YearsOfExp()
        {
            var exps = new CandidateWorkExperience().GetObjectsValueFromExpression(x => x.LinkID == this.LinkID);
            if (exps != null && exps.Count > 0)
            {
                return DateTime.Today.Year - exps.OrderBy(x => x.StartDate).FirstOrDefault().StartDate.Year;
            }
            return 0;
        }

        public virtual string BestEduDegree()
        {
            var edu = new CandidateEducation().GetObjectsValueFromExpression(x => x.LinkID == this.LinkID);
            if (edu != null && edu.Count > 0)
            {
                return edu.OrderByDescending(x => x.GraduationYear).FirstOrDefault().Degree;
            }
            return "N/A";
        }

        public virtual decimal OverallScore()
        {
            var scores = new CandidateScore().GetObjectsValueFromExpression(x => x.LinkID == this.LinkID);
            if (scores != null && scores.Count > 0)
            {
                return (scores.Sum(x => x.DressCode)
                    + scores.Sum(x => x.Attitude)
                    + scores.Sum(x => x.CommunicationSkills)
                    + scores.Sum(x => x.TechnicalKnowledge)
                    + scores.Sum(x => x.Confidence)
                    + scores.Sum(x => x.Potential)
                    + scores.Sum(x => x.LearningAbility)
                    + scores.Sum(x => x.MentalCapacity)
                    + scores.Sum(x => x.AnalytialApproach)
                    + scores.Sum(x => x.WillingnessToWork)) / scores.Count;

            }
            return 0;
        }
    }
}
