function updateAccountTable(cond) {
    populate_with_page_loading('#account-list tbody');
    ajaxGet(searchAccount_url, cond, populateAccountTable);
}

function updateDetailTable(id) {
    ajaxGet(searchAccount_url, 'id='+id, populateDetailTable);
}

function populateAccountTable(data) {
    populate_with_page('#template-account-table', data.accounts, '#account-list tbody');
}

function populateDetailTable(data) {
    populate_without_page('#template-account-detail-table', data.accounts, '#account-detail-list tbody');
}

function selectAccountDetail() {
    if ($("#filter-account-name").val() != targetid && $("#filter-account-name").val() != -1) {
        window.location = accountDetailsPage_url + "&id="+$("#filter-account-name").val();
    }
}

/* user assignment functions */
function updateUserAvailableTable() {
    ajaxGet(searchUnassignedUser_url, '', populateUserAvailableBox);
}
function populateUserAvailableBox(data) {
    populate_without_page('#template-user-assign-table', data.users, '#user-available-box');
}
function updateUserAssignedTable(account_id) {
    ajaxGet(searchAssignedUser_url, 'account_id=' + account_id, populateUserAssignedBox);
}
function populateUserAssignedBox(data) {
    populate_without_page('#template-user-unassign-table', data.users, '#user-assigned-box');
}

/* device assignment functions */
function updateDeviceAvailableTable() {
    ajaxGet(searchUnassignedDevice_url, '', populateDeviceAvailableBox);
}
function populateDeviceAvailableBox(data) {
    populate_without_page('#template-device-assign-table', data.devices, '#device-available-box');
}
function updateDeviceAssignedTable() {
    ajaxGet(searchAssignedDevice_url, 'account_id=' + account.id + '&admin=true', populateDeviceAssignedBox);
}
function populateDeviceAssignedBox(data) {
    populate_without_page('#template-device-unassign-table', data.devices, '#device-assigned-box');
}

function updateAccountUserList() {
    ajaxGet(searchAssignedUser_url, 'account_id=' + account.id, populateAccountUserTable);
}

function updateAccountDeviceList() {
    ajaxGet(searchAssignedDevice_url, 'account_id=' + account.id + '&admin=true', populateAccountDeviceTable);
}

function populateAccountUserTable(data) {
    populate_without_page('#template-account-user-table', data.users, '.show-list #user-list');
}

function populateAccountDeviceTable(data) {
    populate_without_page('#template-account-device-table', data.devices, '.show-list #device-list');
}

function assign_device() {
    var items = $('#device-available-box .selected-item');
    if (items.length == 0) return;
    var message = DEVICE_ASSIGNED.replace('#{name}', account.name);
    var ids = [];
    items.each(function() {
        ids.push($(this).attr('id').replace('item-', ''));
    });
    ajaxPost(assignDevicesToAcc_url+'/'+account.id+'/'+ids.join(','), null,
        function() {
            items.appendTo($('#device-assigned-box'));
            account.device_used += ids.length;
            populateDetailTable({"accounts": account});
            updateAccountDeviceList();
            setMessage(message);
        },
        function(jqXHR) {
            setMessage(ERROR + " " + jqXHR.responseText, true);
            //window.parent.Shadowbox.close();
        });
}

function unassign_device() {
    var items = $('#device-assigned-box .selected-item');
    if (items.length == 0) return;
    var message = DEVICE_UNASSIGNED.replace('#{name}', account.name);
    var ids = [];
    items.each(function() {
        ids.push($(this).attr('id').replace('item-', ''));
    });
    ajaxPost(unassignDevicesToAcc_url+'/'+account.id+'/'+ids.join(','), null,
        function() {
            items.appendTo($('#device-available-box'));
            account.device_used -= ids.length;
            populateDetailTable({"accounts": account});
            updateAccountDeviceList();
            setMessage(message);
        },
        function(jqXHR) {
            setMessage(ERROR + " " + jqXHR.responseText, true);
        });
}

function assign_user() {
    var items = $('#user-available-box .selected-item');
    if (items.length == 0) return;
    var message = USER_ASSIGNED.replace('#{name}', account.name);
    var ids = [];
    items.each(function() {
        ids.push($(this).attr('id').replace('item-', ''));
    });
    ajaxPost(assignUsersToAcc_url+'/'+account.id+'/'+ids.join(','), null,
        function() {
            items.appendTo($('#user-assigned-box'));
            account.user_used += ids.length;
            populateDetailTable({"accounts": account});
            updateAccountUserList();
            setMessage(message);
        },
        function(jqXHR) {
            setMessage(ERROR + " " + jqXHR.responseText, true);
            //window.parent.Shadowbox.close();
        });
}

function unassign_user() {
    var items = $('#user-assigned-box .selected-item');
    if (items.length == 0) return;
    var message = USER_UNASSIGNED.replace('#{name}', account.name);
    var ids = [];
    items.each(function() {
        ids.push($(this).attr('id').replace('item-', ''));
    });
    ajaxPost(unassignUsersToAcc_url+'/'+account.id+'/'+ids.join(','), null,
        function() {
            items.appendTo($('#user-available-box'));
            account.user_used -= ids.length;
            populateDetailTable({"accounts": account});
            updateAccountUserList();
            setMessage(message);
        },
        function(jqXHR) {
            setMessage(ERROR + " " + jqXHR.responseText, true);
        });
}

function refreshAccountTable() {
    if ($('#account-list').length > 0) {
        var cond = {};
        $.each($('#account-search-form').serializeArray(), function(i, field) {
            if (field.value) {
                cond[field.name] = field.value;
            }
        });
        updateAccountTable($.param(cond, true));
    }
}

function submitEditAccount() {
    var name = $('#account-name').val();
    var account_no = $('#account-no').val();
    var message = ACCOUNT_UPDATED.replace('#'+'{name}', formatAccount(name, account_no));
    submitForm('#edit-account-form', editAccount_url, message, refreshAccountTable);
}

function deleteAccount(id, name, detailsPage) {
    var message = ACCOUNT_DEL_CONFIRM.replace('#{name}', name);
    if ($('#account-list').length > 0) {
        confirmAction(message, deleteAccount_url, 'id='+id, ACCOUNT_DELETED.replace('#{name}', name), refreshAccountTable);
    } else {
        confirmAction(message, deleteAccount_url, 'id='+id, ACCOUNT_DELETED.replace('#{name}', name), function() {
            window.location = '/account/list';
        });
    }
}

function searchAccount(form) {
    var cond = {};
    $.each($(form).serializeArray(), function(i, field) {
        if (field.value) {
            cond[field.name] = field.value;
        }
    });
    currentPageIndex = 0;
    updateAccountTable($.param(cond, true));
    return false;
}

function exportAccount(form, format) {
    $(form).attr({
        action: '/api/account/export?format=' + format,
        method: 'post'
    });
    $(form).submit();
}

