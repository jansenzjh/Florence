//String format
String.prototype.format = function () {
    var formatted = this;
    for (var i = 0; i < arguments.length; i++) {
        var regexp = new RegExp('\\{' + i + '\\}', 'gi');
        formatted = formatted.replace(regexp, arguments[i]);
    }
    return formatted;
};

toastr.options = {
    "closeButton": true,
    "debug": false,
    "progressBar": true,
    "preventDuplicates": false,
    "positionClass": "toast-top-right",
    "onclick": null,
    "showDuration": "400",
    "hideDuration": "1000",
    "timeOut": "7000",
    "extendedTimeOut": "1000",
    "showEasing": "swing",
    "hideEasing": "linear",
    "showMethod": "fadeIn",
    "hideMethod": "fadeOut"
}

//Universal form ajax submit function
function ajaxFormSubmit(e, successFunc) {
    var url = $(e).closest("form").attr("action");
    var formData = $(e).closest("form").serialize();
    $.ajax({
        type: "POST",
        url: url,
        data: formData,
        success: successFunc
    });
}


//View Javascript Generic Init
function genericInit() {
    //Date
    formattingDateUI();
    //Editor
    formatSummernote();
    //Dropdown
    $("div select").kendoDropDownList({});
}



//reload jqGrid data
function reloadGridData(gridID, data) {
    jQuery('#' + gridID).jqGrid('clearGridData');
    jQuery('#' + gridID).jqGrid('setGridParam', { data: data });
    jQuery('#' + gridID).trigger('reloadGrid');
}

//Telerik window handling

function createWindow(divID, title, controller, action, params) {
    $("body").append("<div id = '{0}'></div>".format(divID));
    var window = $("#{0}".format(divID));

    window.kendoWindow({
        width: "650px",
        height: "650px",
        visible: false,
        scrollable: true,
        title: title,
        content: "/{0}/{1}{2}".format(controller, action, params),
        close: function () {
            window.data("kendoWindow").destroy();
            $("body").remove("#{0}".format(divID));
        }
    });
    window.data("kendoWindow").center().open();
}

function formatSummernote() {
    
}

function formattingDateUI() {
    $('#CloseDate').kendoDatePicker({});
    //$('#SalaryDate').kendoDatePicker({});
    


}
