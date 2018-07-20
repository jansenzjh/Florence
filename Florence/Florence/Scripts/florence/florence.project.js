//Global Variables
_addProject = "addProject";
_addProjectActivity = "addProjectActivity";
_closeProjectActivity = "closeProjectActivity";

function punchOuttoProject(projectID) {
    createWindow(_addProject, "New Activity", "ProjectActivity", "Create", "id=");
}

function loadProjectPunchOutView() {
    $("#projPunchOutModal").load('/ProjectActivity/ProjectPunchOutView');
}

function punchIntoProject(projectID) {
    $.ajax({
        type: 'POST',
        url: '/ProjectActivity/PunchIntoProject',
        dataType: 'json',
        data: {
            projectID: projectID
        },
        success: function (data) {
            toastr.success('Punched in!', 'Notification');
            initProjectButton(true);
        },
        error: function (xhr, ajaxOptions, error) {
            console.log(xhr.status);
            console.log('Error: ' + xhr.responseText);
        }
    });

}

function punchOutProject(projectID, comment) {
    $.ajax({
        type: 'POST',
        url: '/ProjectActivity/PunchOutProject',
        dataType: 'json',
        data: {
            projectID: projectID,
            comment: comment
        },
        success: function (data) {
            if (data.BooleanResult) {
                toastr.success("Punch Out Success!", 'Notification');
                initProjectButton(false);
            } else {
                toastr.error(data.StringResult, 'Notification');
            }
            
        },
        error: function (xhr, ajaxOptions, error) {
            console.log(xhr.status);
            console.log('Error: ' + xhr.responseText);
        }
    });
}