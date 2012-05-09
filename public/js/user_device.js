var userDevicesUserId = 0;
var userDevicesUserName = '';

function updateUserDevicesWithoutAccessRights() {
    $('#user-devices-without-access-rights-box').html('<img src="' + loader_url + '"/>');
    ajaxPost('/api/user_device/search_devices', 'user_id=' + userDevicesUserId + '&access_right=false', populateUserDevicesWithoutAccessRightsBox);
}

function populateUserDevicesWithoutAccessRightsBox(data) {
    populate_without_page('#template-user-devices-without-access-rights-table', data.devices, '#user-devices-without-access-rights-box');
}

function updateUserDevicesWithAccessRights() {
    $('#user-devices-with-access-rights-box').html('<img src="' + loader_url + '"/>');
    ajaxPost('/api/user_device/search_devices', 'user_id=' + userDevicesUserId + '&access_right=true', populateUserDevicesWithAccessRightsBox);
}

function populateUserDevicesWithAccessRightsBox(data) {
    populate_without_page('#template-user-devices-with-access-rights-table', data.devices, '#user-devices-with-access-rights-box');
}

function user_device_grant_access_rights() {
    var items = $('#user-devices-without-access-rights-box .selected-item');
    if (items.length == 0)
        return;
    var message = USER_DEVICE_ACCESS_RIGHTS_GRANTED.replace('#{name}', userDevicesUserName);
    var ids = [];
    items.each(function() {
        ids.push($(this).attr('id').replace('item-', ''));
    });
    ajaxPost('/api/user_device/grant_user_rights', 'user_id=' + userDevicesUserId + '&device_ids=' + ids.join(',') + '&access_right=true',
        function() {
            items.appendTo($('#user-devices-with-access-rights-box'));
            setMessage(message);
        },
        function(jqXHR) {
            setMessage(ERROR + " " + jqXHR.responseText, true);
        });
}

function user_device_ungrant_access_rights() {
    var items = $('#user-devices-with-access-rights-box .selected-item');
    if (items.length == 0)
        return;
    var message = USER_DEVICE_ACCESS_RIGHTS_UNGRANTED.replace('#{name}', userDevicesUserName);
    var ids = [];
    items.each(function() {
        ids.push($(this).attr('id').replace('item-', ''));
    });
    ajaxPost('/api/user_device/grant_user_rights', 'user_id=' + userDevicesUserId + '&device_ids=' + ids.join(',') + '&access_right=false',
        function() {
            items.appendTo($('#user-devices-without-access-rights-box'));
            setMessage(message);
        },
        function(jqXHR) {
            setMessage(ERROR + " " + jqXHR.responseText, true);
        });
}
