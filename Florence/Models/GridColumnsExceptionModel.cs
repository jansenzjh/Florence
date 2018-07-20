using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Web;

namespace Florence.Models
{
    public class GridColumnsExceptionModel
    {
        public string[] JobPostRequisitionException { get {return new string[]{ "id", "CandidateQualification", "CandidateExperience", "JobPostDescription", "CreatedBy", "DepartmentSID", "CandidateAgeRangeEnd", "SalaryEndRange" }; } }
        public string[] JobPostException { get { return new string[] { "id", "CandidateQualification", "CandidateExperience", "JobPostDescription", "CreatedBy", "DepartmentSID", "CandidateAgeRangeEnd", "SalaryEndRange" }; } }
        public string[] RecruitmentCandidateException { get { return new string[] { "id", "LinkID", "Zip", "Address", "Interests", "Achievements", "SalaryEndRange" }; } }
        public string[] JobTestException { get { return new string[] { "id", "TestDescription", "CreatedBy"}; } }
        public string[] ReimbursementDetailException { get { return new string[] { "id", "CreatedBy" }; } }
        public string[] OvertimeException { get { return new string[] { "id", "CreatedBy" }; } }
        public string[] JobInterviewException { get { return new string[] { "id", "CreatedBy", "InterviewDesc" }; } }
        public string[] ProvidentFundException { get { return new string[] { "id", "CreatedBy" }; } }
        public string[] EmployeeExitException { get { return new string[] { "id", "CreatedBy" }; } }
        public string[] AppUserException { get { return new string[] { "id", "CreatedBy" }; } }
        public string[] PerformanceEvaluationException { get { return new string[] { "id", "CreatedBy", "Description" }; } }
        public string[] LoanException { get { return new string[] { "id", "CreatedBy" }; } }
        public string[] TerminationException { get { return new string[] { "id", "CreatedBy", "Description" }; } }
        public string[] MemoException { get { return new string[] { "id", "CreatedBy" }; } }
        public string[] WarningException { get { return new string[] { "id", "CreatedBy","Description" }; } }
        public string[] InsuranceException { get { return new string[] { "id", "CreatedBy" }; } }
        public string[] ComplaintException { get { return new string[] { "id", "CreatedBy", "Description" }; } }
        public string[] PromotionException { get { return new string[] { "id", "CreatedBy", "PromotionDescription" }; } }
        public string[] AdminDepartmentException { get { return new string[] { "id", "CreatedBy" }; } }
        public string[] TrainingException { get { return new string[] { "id", "CreatedBy", "Description" }; } }
        public string[] TravelException { get { return new string[] { "id", "CreatedBy", "TravelDescription" }; } }
        public string[] TrainingNeedAssessmentException { get { return new string[] { "id", "CreatedBy" }; } }
        public string[] TrainingEventException { get { return new string[] { "id", "CreatedBy", "Description" }; } }
        public string[] AchievementException { get { return new string[] { "id", "CreatedBy" }; } }
        public string[] TrainerException { get { return new string[] { "id", "CreatedBy", "Description" }; } }
        public string[] ResignationException { get { return new string[] { "id", "CreatedBy" }; } }
        public string[] TrainingEvaluationException { get { return new string[] { "id", "CreatedBy", "Description" }; } }
        public string[] TransferException { get { return new string[] { "id", "CreatedBy", "TransferDescription" }; } }
        public string[] RequistionException { get { return new string[] { "id", "CreatedBy", "RequistionDescription" }; } }
        public string[] AssignmentException { get { return new string[] { "id", "CreatedBy", "AssignmentDescription" }; } }
        public string[] ContractException { get { return new string[] { "id", "CreatedBy" }; } }
        public string[] CompanyException { get { return new string[] { "id", "CreatedBy" }; } }
        public string[] EmployeeJoiningException { get { return new string[] { "id", "CreatedBy" }; } }
        public string[] EmployeeException { get { return new string[] { "id", "CreatedBy", "Zip", "Address","Country", "UserName", "Password", "ShowInOrganogram", "DOB", "BloodGroup", "Nationality", "SSN", "PassportID", "PassportExpiration", "HomePhone", "OfficePhone", "DriverLicense", "DriverLicenseExpiration", "EmergencyContactName", "EmergencyRelationship", "EmergencyPhone" }; } }
        public string[] StateException { get { return new string[] { "id", "CreatedBy" }; } }
        public string[] AttendanceException { get { return new string[] { "id", "CreatedBy" }; } }
        public string[] LeaveException { get { return new string[] { "id", "CreatedBy" }; } }
        public string[] WorkShiftException { get { return new string[] { "id", "CreatedBy" }; } }
        public string[] HolidayException { get { return new string[] { "id", "CreatedBy", "Description" }; } }
        public string[] PayrollOptionException { get { return new string[] { "id", "CreatedBy" }; } }
        public string[] PayslipAllowanceException { get { return new string[] { "id", "CreatedBy" }; } }
        public string[] ExtraPayrollItemsException { get { return new string[] { "id", "CreatedBy" }; } }
        public string[] MenuItemsException { get { return new string[] { "id", "CreatedBy" }; } }
        public string[] TaxRuleException { get { return new string[] { "id", "CreatedBy" }; } }
        public string[] TaxExemptEmployeeException { get { return new string[] { "id", "CreatedBy" }; } }
        public string[] MenuItemsGroupException { get { return new string[] { "id", "CreatedBy" }; } }
        public string[] AutoDeductionException { get { return new string[] { "id", "CreatedBy" }; } }
        public string[] AutoOvertimeException { get { return new string[] { "id", "CreatedBy" }; } }
        public string[] SalaryCalculationException { get { return new string[] { "id", "CreatedBy" }; } }
        public string[] NewsException { get { return new string[] { "id", "CreatedBy","Content" }; } }
        public string[] PolicyException { get { return new string[] { "id", "CreatedBy", "Content" }; } }
        public string[] ModelTypesException { get { return new string[] { "id", "CreatedBy" }; } }
        public string[] SalaryException { get { return new string[] { "id", "CreatedBy" }; } }
        public string[] CandidateEducationException { get { return new string[] { "id", "CreatedBy" }; } }
        public string[] CandidateWorkExperienceException { get { return new string[] { "id", "CreatedBy" }; } }
        public string[] CandidateTrainingException { get { return new string[] { "id", "CreatedBy" }; } }
        public string[] SalaryPayslipException { get { return new string[] { "id", "CreatedBy", "InstanceID", "Details", "Note" }; } }
        public string[] CandidateLanguageException { get { return new string[] { "id", "CreatedBy" }; } }
        public string[] SalaryPayslipDetailException { get { return new string[] { "id", "CreatedBy" }; } }
        public string[] CandidateSkillException { get { return new string[] { "id", "CreatedBy" }; } }
        public string[] HourlyWageException { get { return new string[] { "id", "CreatedBy", "Description" }; } }
        public string[] CandidateReferenceException { get { return new string[] { "id", "CreatedBy" }; } }
        public string[] SalaryItemException { get { return new string[] { "id", "CreatedBy", "Description" }; } }
        public string[] ReimbursementException { get { return new string[] { "id", "CreatedBy", "InstanceID", "Description", "CreatedBy", "Details" }; } }

        public static string[] GetColumnException(Type type)
        {
            var obj = new GridColumnsExceptionModel();
            return obj.GetType().GetProperty(type.Name + "Exception").GetValue(obj, null) as string[];
        }
    }
}