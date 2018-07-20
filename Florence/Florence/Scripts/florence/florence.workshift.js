function InsertNewWorkShift(wsTitle, isRedirect) {
    if (wsTitle == undefined || wsTitle == null || wsTitle.length == 0) {
        wsTitle = $("#WorkShiftTitle").val();
    }
    if (isRedirect == undefined || isRedirect == null || isRedirect.length == 0) {
        isRedirect = true;
    }
    var workDaysList = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];
    var workshifts = new Array();
    var guid = Math.uuid();

    $(workDaysList).each(function( index, workday ) {
        if ($("." + workday).find("[name=isWorkday]").prop('checked')){
            var obj =
            {
                InstanceID : guid,
                WorkShiftTitle :wsTitle,
                WorkDays : workday,
                RegularWorkHoursFrom :$("." + workday).find("[name=workFrom]").val(),
                RegularWorkHoursTo :$("." + workday).find("[name=workTo]").val(),
                LunchBreakHoursFrom :$("." + workday).find("[name=lunchFrom]").val(),
                LunchBreakHoursTo :$("." + workday).find("[name=lunchTo]").val(),
                AdditionalBreakHoursFrom : $("." + workday).find("[name=breakFrom]").val(),
                AdditionalBreakHoursTo :$("." + workday).find("[name=breakTo]").val()
            }
            workshifts.push(obj);
        }
    });

    $.ajax({
        type: 'POST',
        url: '/WorkShift/SaveWorkShifts',
        dataType: 'json',
        data: {
            Workshifts: workshifts
        },
        success: function (data) {
            console.log(data);
            toastr.success('Work Shift Save Success!', 'Notification')
            if (isRedirect) {
                window.location.href = "/WorkShift/Index";
            }
        },
        error: function (xhr, ajaxOptions, error) {
            console.log(xhr.status);
            console.log('Error: ' + xhr.responseText);
        }
    });
}


function deleteWorkShift(wsTitle) {
    $.ajax({
        type: 'POST',
        url: '/WorkShift/DeleteWorkShifts',
        dataType: 'json',
        data: {
            workshiftTitle: wsTitle
        },
        success: function (data) {
            if (isRedirect) {
                window.location.href = "/WorkShift/Index";
            }
        },
        error: function (xhr, ajaxOptions, error) {
            console.log(xhr.status);
            console.log('Error: ' + xhr.responseText);
        }
    });
}

function saveWorkShift(wsTitle) {
    $.ajax({
        type: 'POST',
        url: '/WorkShift/DeleteWorkShifts',
        dataType: 'json',
        data: {
            workshiftTitle: wsTitle
        },
        success: function (data) {
            console.log(data);
            InsertNewWorkShift(wsTitle, false);
        },
        error: function (xhr, ajaxOptions, error) {
            console.log(xhr.status);
            console.log('Error: ' + xhr.responseText);
        }
    });
}