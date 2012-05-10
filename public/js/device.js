$(function(){
    /* 
    $("#camera-image-recording").change(function() {
        if ($(this).val() == 0) {
            $("#camera-record-interval").html('<option value="-1">' + COMBOBOX_DEFAULT + '</option>');
        } else {
            populateComboBox($("#camera-record-interval"), RECINTERVALS)
        }
    });
    */
    $("#device-image-recording").change(function() {
        if ($(this).val() == 0) {
            $("#device-record-interval").attr("disabled", "disabled");
        } else {
            $("#device-record-interval").removeProp("disabled");
        }
    });
});

function updateDeviceTable(cond) {
    populate_with_page_loading('#device-list tbody');
    if (cond)
        cond = cond + '&admin=true';
    else
	cond = 'admin=true';
    ajaxGet(searchDevice_url, cond, populateDeviceTable);
}

function deleteDevice(id, name) {
    var message = DEVICE_DEL_CONFIRM.replace("#{name}", name);
    confirmAction(message, deleteDevice_url, "id="+id, DEVICE_DELETED.replace("#{name}", name), refreshDeviceTable);
}

function populateDeviceTable(data) {
    populate_with_page('#template-device-table', data.devices, '#device-list tbody');
}

function checkDeviceStatus(id, ip) {
    var img = new Image();
     
    $(img).load(function () {
        $("#deviceStatus" + id).html("Online");
        $("#deviceStatus" + id).css("color", "green");
    });
          
    $(img).error(function () {
        $("#deviceStatus" + id).html("Online");
        $("#deviceStatus" + id).css("color", "green");
    });
    $(img).attr('src', 'http://' + ip);
}

function refreshDeviceTable() {
    var cond = {};
    $.each($('#device-search-form').serializeArray(), function(i, field) {
        if (field.value) {
            cond[field.name] = field.value;
        }
    });
    updateDeviceTable($.param(cond, true));
}

function submitEditDevice() {
    var name = $('#edit-device-name').val();
    var key = $('#edit-device-key').val();
    var message = DEVICE_UPDATED.replace('#' + '{name}', formatDevice(name, key));
    submitForm('#edit-device-form', editDevice_url, message, refreshDeviceTable);
}

function searchDevice(form) {
    var cond = {};
    $.each($(form).serializeArray(), function(i, field) {
        if (field.value) {
            cond[field.name] = field.value;
        }
    });
    currentPageIndex = 0;
    updateDeviceTable($.param(cond, true));
    return false;
}

function exportDevice(form, format) {
    $(form).attr({
        action: '/api/device/export?format=' + format,
        method: 'post'
    });
    $(form).submit();
}

