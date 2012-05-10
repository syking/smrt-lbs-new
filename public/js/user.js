function setAccountRow() {
    if ($("#user-role").val() == ROLE_SUPERADMIN || $("#user-role").val() == ROLE_SUPPORT) {
        $("#account-row").hide();
        $('#user-account').val(-1);
    } else {
        $("#account-row").show();
    }
}

function updateUserTable(cond) {
    populate_with_page_loading('#user-list tbody');
    ajaxGet(searchUser_url, cond, populateUserTable);
}

function populateUserTable(data) {
    populate_with_page('#template-user-table', data.users, '#user-list tbody');
}

function deleteUser(id, name) {
    var message = USER_DEL_CONFIRM.replace('#{name}', name);
    confirmAction(message, deleteUser_url, 'id='+id, USER_DELETED.replace('#{name}', name), refreshUserTable);
}

function refreshUserTable() {
    if ($('#user-list').length > 0) {
        var cond = {};
        $.each($('#user-search-form').serializeArray(), function(i, field) {
            if (field.value) {
                cond[field.name] = field.value;
            }
        });
        updateUserTable($.param(cond, true));
    }
}

function submitEditUser(form) {
    if ($('input#old-password').val() || $('input#new-password').val() || $('input#confirm-password').val()) {
        $('.change-password').addClass('required');
    } else {
        $('.change-password').removeClass('required');
    }
    $.removeData(form, 'validator');
    $(form).validate({
        rules: {
            confirm_password: {
                equalTo: '#password'
            }
        },
        messages: {
            confirm_password: {
                equalTo: PASSWORD_CONFIRM_MISMATCH
            }
        }
    });
    var login = $('#user-login').val();
    var name = $('#user-name').val();
    var message = USER_UPDATED.replace('#'+'{name}', formatUser(login, name));
    submitForm('#edit-user-form', editUser_url, message, refreshUserTable);
}

function searchUser(form) {
    var cond = {};
    $.each($(form).serializeArray(), function(i, field) {
        if (field.value) {
            cond[field.name] = field.value;
        }
    });
    currentPageIndex = 0;
    updateUserTable($.param(cond, true));
    return false;
}

function exportUser(form, format) {
    $(form).attr({
        action: '/api/user/export?format=' + format,
        method: 'post'
    });
    $(form).submit();
}

