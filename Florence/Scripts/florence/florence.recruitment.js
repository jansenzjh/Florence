//Global Variables
_addWorkExp = "addWorkExp";
_addTraining = "addTraining";
_addEducation = "addEducation";
_addLanguage = "addLanguage";
_addSkill = "addSkill";
_addReference = "addReference";
_addCandateRate = "_addCandateRate";

_workExpArr = new Array();
_trainingsArr = new Array();
_educationArr = new Array();
_languageArr = new Array();
_skillArr = new Array();
_referenceArr = new Array();

function saveCandidateScore() {
    var score = {
        LinkID: $("#LinkID").val(),
        DressCode: $("#DressCode").val(),
        Attitude: $("#Attitude").val(),
        CommunicationSkills: $("#CommunicationSkills").val(),
        TechnicalKnowledge: $("#TechnicalKnowledge").val(),
        Confidence: $("#Confidence").val(),
        Potential: $("#Potential").val(),
        LearningAbility: $("#LearningAbility").val(),
        MentalCapacity: $("#MentalCapacity").val(),
        AnalytialApproach: $("#AnalytialApproach").val(),
        WillingnessToWork: $("#WillingnessToWork").val(),
    }

    $.ajax({
        type: 'POST',
        url: '/RecruitmentCandidate/SaveCandidateScore',
        dataType: 'json',
        data: {
            score: score
        },
        success: function (data) {
            console.log(data);
            //setTimeout(data.JavascriptResult, 250);
        },
        error: function (xhr, ajaxOptions, error) {
            console.log(xhr.status);
            console.log('Error: ' + xhr.responseText);
        }
    });
}

function saveRecruitmentData() {
    var candidate = {
        LinkID: $("#LinkID").val(),
        Name: $("#Name").val(),
        Gender: $("#Gender").val(),
        DOB: $("#DOB").val(),
        Nationality: $("#Nationality").val(),
        JobField: $("#JobField").val(),
        HaveWorkingPermit: $("#HaveWorkingPermit").val(),
        Email: $("#Email").val(),
        Phone: $("#Phone").val(),
        Address: $("#Address").val(),
        City: $("#City").val(),
        State: $("#State").val(),
        Zip: $("#Zip").val(),
        Country: $("#Country").val(),
        Interests: $("#Interests").val(),
        Achievements: $("#Achievements").val()
    }


    $.ajax({
        type: 'POST',
        url: '/RecruitmentCandidate/saveRecruitmentData',
        dataType: 'json',
        data: {
            work: _workExpArr,
            train: _trainingsArr,
            edu: _educationArr,
            lang: _languageArr,
            skill: _skillArr,
            reference: _referenceArr,
            candidate: candidate
        },
        success: function (data) {
            console.log(data);
            setTimeout(data.JavascriptResult, 250);
        },
        error: function (xhr, ajaxOptions, error) {
            console.log(xhr.status);
            console.log('Error: ' + xhr.responseText);
        }
    });
}


function generateReferenceGrid() {
    $("#referenceGrid").jqGrid({
        data: _referenceArr,
        datatype: "local",
        autowidth: true,
        shrinkToFit: true,
        rowNum: 10,
        rowList: [],
        colNames: ['Name', 'Organization', 'Phone', 'Email'],
        colModel: [
            { name: 'Name', index: 'Name', width: 60 },
            { name: 'Organization', index: 'Organization', width: 90 },
            { name: 'Phone', index: 'Phone', width: 60 },
            { name: 'Email', index: 'Email', width: 90 }
        ],
        pager: "#pager_list_6",
        viewrecords: false,
        caption: "References",
        hidegrid: false
    });
}

function generateSkillGrid() {
    $("#skillGrid").jqGrid({
        data: _skillArr,
        datatype: "local",
        autowidth: true,
        shrinkToFit: true,
        rowNum: 10,
        rowList: [],
        colNames: ['SkillName', 'SkillLevel'],
        colModel: [
            { name: 'SkillName', index: 'SkillName', width: 60 },
            { name: 'SkillLevel', index: 'SkillLevel', width: 90 }
        ],
        pager: "#pager_list_5",
        viewrecords: false,
        caption: "Skills",
        hidegrid: false
    });
}

function generateLanguageGrid() {
    $("#languageGrid").jqGrid({
        data: _languageArr,
        datatype: "local",
        autowidth: true,
        shrinkToFit: true,
        rowNum: 10,
        rowList: [],
        colNames: ['Language', 'ListeningLevel', 'SpeakingLevel', 'ReadingLevel', 'WritingLevel'],
        colModel: [
            { name: 'Language', index: 'Language', width: 60 },
            { name: 'ListeningLevel', index: 'ListeningLevel', width: 90 },
            { name: 'SpeakingLevel', index: 'SpeakingLevel', width: 100 },
            { name: 'ReadingLevel', index: 'ReadingLevel', width: 80, align: "right" },
            { name: 'WritingLevel', index: 'WritingLevel', width: 80, align: "right" }
        ],
        pager: "#pager_list_4",
        viewrecords: false,
        caption: "Languages",
        hidegrid: false
    });
}

function generateEducationGrid() {
    $("#educationGrid").jqGrid({
        data: _educationArr,
        datatype: "local",
        autowidth: true,
        shrinkToFit: true,
        rowNum: 10,
        rowList: [],
        colNames: ['Degree', 'Subject', 'Institute', 'Grade', 'GraduationYear'],
        colModel: [
            { name: 'Degree', index: 'Degree', width: 60 },
            { name: 'Subject', index: 'Subject', width: 90 },
            { name: 'Institute', index: 'Institute', width: 100 },
            { name: 'Grade', index: 'Grade', width: 80, align: "right"},
            { name: 'GraduationYear', index: 'GraduationYear', width: 80, align: "right" }
        ],
        pager: "#pager_list_3",
        viewrecords: false,
        caption: "Education",
        hidegrid: false
    });
}

function generateWorkExpGrid() {
    $("#workExpGrid").jqGrid({
        data: _workExpArr,
        datatype: "local",
        autowidth: true,
        shrinkToFit: true,
        rowNum: 10,
        rowList: [],
        colNames: ['Job Field', 'Organization', 'Designation', 'Start Date', 'End Date', 'Job Desc'],
        colModel: [
            { name: 'JobField', index: 'JobField', width: 60 },
            { name: 'OrganizationName', index: 'OrganizationName', width: 90 },
            { name: 'Designation', index: 'Designation', width: 100 },
            { name: 'StartDate', index: 'StartDate', width: 80, align: "right", formatter: "date" },
            { name: 'EndDate', index: 'EndDate', width: 80, align: "right", formatter: "date" },
            { name: 'JobDescription', index: 'JobDescription', width: 80, align: "left" }
        ],
        pager: "#pager_list_1",
        viewrecords: false,
        caption: "Work Experience",
        hidegrid: false
    });
}


function generateTraingingGrid() {
    $("#trainingGrid").jqGrid({
        data: _trainingsArr,
        datatype: "local",
        autowidth: true,
        shrinkToFit: true,
        rowNum: 10,
        rowList: [],
        colNames: ['Field', 'Organization', 'TrainingTitle', 'Location'],
        colModel: [
            { name: 'Field', index: 'Field', width: 60 },
            { name: 'OrganizationName', index: 'OrganizationName', width: 100 },
            { name: 'TrainingTitle', index: 'TrainingTitle', width: 100 },
            { name: 'Location', index: 'Location', width: 80, align: "right" }
        ],
        pager: "#pager_list_2",
        viewrecords: false,
        caption: "Trainings",
        hidegrid: false
    });
}
