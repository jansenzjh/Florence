using System;
using System.Text;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using Florence.Models.Shared;
using NHibernate;
using Florence.Models;
using System.Linq;
using NHibernate.Linq;

namespace Florence {

    public class Roles : ObjectBase<Roles> {
        public virtual int RoleId { get; set; }
        [Required]
        public virtual string RoleName { get; set; }
        [Required]
        public virtual string RoleDescription { get; set; }

        

        public static ResultModel DeleteRoles(int employee)
        {

            var roles = new UserRoles().GetObjectsValueFromExpression(x => x.UserId.id == employee);
            if (roles != null && roles.Count > 0)
            {
                foreach(var r in roles)
                {
                    r.Delete();
                }
            }
            return ResultModel.SuccessResult();
        }


    }

    public class RoleItems
    {
        public const string SuperAdmin = "SuperAdmin";
        public const string Admin = "Admin";
        public const string Employee = "Employee";
        public const string ReimbursementDetail_Admin = "ReimbursementDetail_Admin";
        public const string Overtime_Admin = "Overtime_Admin";
        public const string JobTest_Admin = "JobTest_Admin";
        public const string JobInterview_Admin = "JobInterview_Admin";
        public const string ProvidentFund_Admin = "ProvidentFund_Admin";
        public const string EmployeeExit_Admin = "EmployeeExit_Admin";
        public const string AppUser_Admin = "AppUser_Admin";
        public const string PerformanceEvaluation_Admin = "PerformanceEvaluation_Admin";
        public const string Loan_Admin = "Loan_Admin";
        public const string Termination_Admin = "Termination_Admin";
        public const string Memo_Admin = "Memo_Admin";
        public const string Warning_Admin = "Warning_Admin";
        public const string Insurance_Admin = "Insurance_Admin";
        public const string Complaint_Admin = "Complaint_Admin";
        public const string Promotion_Admin = "Promotion_Admin";
        public const string AdminDepartment_Admin = "AdminDepartment_Admin";
        public const string Training_Admin = "Training_Admin";
        public const string Travel_Admin = "Travel_Admin";
        public const string TrainingNeedAssessment_Admin = "TrainingNeedAssessment_Admin";
        public const string TrainingEvent_Admin = "TrainingEvent_Admin";
        public const string Achievement_Admin = "Achievement_Admin";
        public const string Trainer_Admin = "Trainer_Admin";
        public const string Resignation_Admin = "Resignation_Admin";
        public const string TrainingEvaluation_Admin = "TrainingEvaluation_Admin";
        public const string Transfer_Admin = "Transfer_Admin";
        public const string Requistion_Admin = "Requistion_Admin";
        public const string Assignment_Admin = "Assignment_Admin";
        public const string Contract_Admin = "Contract_Admin";
        public const string Company_Admin = "Company_Admin";
        public const string EmployeeJoining_Admin = "EmployeeJoining_Admin";
        public const string Employee_Admin = "Employee_Admin";
        public const string State_Admin = "State_Admin";
        public const string CandidateScore_Admin = "CandidateScore_Admin";
        public const string Designation_Admin = "Designation_Admin";
        public const string Leave_Admin = "Leave_Admin";
        public const string WorkShift_Admin = "WorkShift_Admin";
        public const string Holiday_Admin = "Holiday_Admin";
        public const string PayrollOption_Admin = "PayrollOption_Admin";
        public const string PayslipAllowance_Admin = "PayslipAllowance_Admin";
        public const string Attendance_Admin = "Attendance_Admin";
        public const string ExtraPayrollItems_Admin = "ExtraPayrollItems_Admin";
        public const string MenuItems_Admin = "MenuItems_Admin";
        public const string TaxRule_Admin = "TaxRule_Admin";
        public const string TaxExemptEmployee_Admin = "TaxExemptEmployee_Admin";
        public const string MenuItemsGroup_Admin = "MenuItemsGroup_Admin";
        public const string AutoDeduction_Admin = "AutoDeduction_Admin";
        public const string AutoOvertime_Admin = "AutoOvertime_Admin";
        public const string SalaryCalculation_Admin = "SalaryCalculation_Admin";
        public const string News_Admin = "News_Admin";
        public const string Policy_Admin = "Policy_Admin";
        public const string ModelTypes_Admin = "ModelTypes_Admin";
        public const string JobPostRequisition_Admin = "JobPostRequisition_Admin";
        public const string Salary_Admin = "Salary_Admin";
        public const string JobPost_Admin = "JobPost_Admin";
        public const string Roles_Admin = "Roles_Admin";
        public const string CandidateEducation_Admin = "CandidateEducation_Admin";
        public const string UserRoles_Admin = "UserRoles_Admin";
        public const string CandidateWorkExperience_Admin = "CandidateWorkExperience_Admin";
        public const string CandidateTraining_Admin = "CandidateTraining_Admin";
        public const string SalaryPayslip_Admin = "SalaryPayslip_Admin";
        public const string UserActionLog_Admin = "UserActionLog_Admin";
        public const string CandidateLanguage_Admin = "CandidateLanguage_Admin";
        public const string SalaryPayslipDetail_Admin = "SalaryPayslipDetail_Admin";
        public const string CandidateSkill_Admin = "CandidateSkill_Admin";
        public const string HourlyWage_Admin = "HourlyWage_Admin";
        public const string CandidateReference_Admin = "CandidateReference_Admin";
        public const string SalaryItem_Admin = "SalaryItem_Admin";
        public const string RecruitmentCandidate_Admin = "RecruitmentCandidate_Admin";
        public const string Reimbursement_Admin = "Reimbursement_Admin";
    }
}
