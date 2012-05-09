function updateEventTable(cond) {
    populate_with_page_loading('.report-events-list tbody');
    var paginator = $("#pagination");
    paginator.data('cond', cond);
    var added_cond = 'search_offset=0&search_length=' + SEARCH_LENGTH;
    if (!cond)
        cond = added_cond;
    else
        cond = cond + '&' + added_cond;
    ajaxGet(searchEvent_url, cond, populateEventTable);
}

function populateEventTable(data) {
    var paginator = $("#pagination");
    var cond = paginator.data('cond');
    populate_with_page_ondemand('#template-report-events-table', data.count, data.events, searchEvent_url, cond, 'events', '.report-events-list tbody');
}

function searchEvent(form) {
    var cond = {};
    $.each($(form).serializeArray(), function(i, field) {
        if (field.value) {
            cond[field.name] = field.value;
        }
    });
    currentPageIndex = 0;
    updateEventTable($.param(cond, true));
    return false;
}

function exportEvent(form, format) {
    $(form).attr({
        action: '/api/event/export?format=' + format,
        method: 'post'
    });
    $(form).submit();
}
