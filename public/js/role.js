function updateRoleTable(cond) {
    populate_with_page_loading('#role-list tbody');
    ajaxGet(searchRole_url, cond, populateRoleTable);
}

function populateRoleTable(data) {
    populate_with_page('#template-role-table', data.roles, '#role-list tbody');
}

function submitEditRole() {
    var permissionIds = [];
    $('input.edit-role-permission:checkbox:checked').each(function() {
        permissionIds.push(this.value);
    });
    $('#edit-role-permission-ids').val(permissionIds.join(','));

    var name = $('#edit-role-name').val();
    var message = ROLE_UPDATED.replace('#{name}', name);
    submitForm('#edit-role-form', editRole_url, message, refreshRoleTable);
}

function refreshRoleTable() {
    var cond = {};
    $.each($('#role-search-form').serializeArray(), function(i, field) {
        if (field.value) {
            cond[field.name] = field.value;
        }
    });
    updateRoleTable($.param(cond, true));
}

function deleteRole(id, name) {
    var message = ROLE_DEL_CONFIRM.replace("#{name}", name);
    confirmAction(message, deleteRole_url, "id="+id, ROLE_DELETED.replace("#{name}", name), refreshRoleTable);
}

function searchRole(form) {
    var cond = {};
    $.each($(form).serializeArray(), function(i, field) {
        if (field.value) {
            cond[field.name] = field.value;
        }
    });
    currentPageIndex = 0;
    updateRoleTable($.param(cond, true));
    return false;
}

function exportRole(form, format) {
    $(form).attr({
        action: '/api/role/export?format=' + format,
        method: 'post'
    });
    $(form).submit();
}

