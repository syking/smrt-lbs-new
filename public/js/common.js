var sessionid = null;
var roleid;
var msgTO = null;
var populateSearch = false;
var targetid = -1;
var timeToCloseMsg = 10000;
var checkSessionInterval = 30000;  // 1 minute
var TIMEOUT_NOTIFICATION_TIME = 60000;  // 1 minute
var currentPageIndex = 0;
var liveview = false;
$.extend({
    escapeJs: function(data) {
        if (data) {
            return data.replace(/(\\|["'])/g, '\\$1');
        } else {
            return '';
        }
    }
});
$(function(){
    if (jQuery.validator) {
        jQuery.extend(jQuery.validator.prototype, {
            showLabel: function(element, message) {
                var error_span = '<div class="form_msg_inner"><div class="form_msg_arrow_wrap"><div class="form_msg_arrow form_msg_bg"></div></div><div class="form_msg_left form_msg_bg"></div><div class="form_msg_body form_msg_bg"><span>{message}</span></div><div class="form_msg_right form_msg_bg"></div></div>';
                message = error_span.replace('{message}', message);
                var label = this.errorsFor( element );
                if ( label.length ) {
                    // refresh error/success class
                    label.removeClass().addClass( this.settings.errorClass );

                    // check if we have a generated label, replace the message then
                    label.attr("generated") && label.html(message);
                } else {
                    // create label
                    label = $("<" + this.settings.errorElement + "/>")
                        .attr({"for":  this.idOrName(element), generated: true})
                        .addClass(this.settings.errorClass)
                        .html(message || "");
                    if ( this.settings.wrapper ) {
                        // make sure the element is visible, even in IE
                        // actually showing the wrapped element is handled elsewhere
                        label = label.hide().show().wrap("<" + this.settings.wrapper + "/>").parent();
                    }
                    if ( !this.labelContainer.append(label).length )
                        this.settings.errorPlacement
                            ? this.settings.errorPlacement(label, $(element) )
                            : label.insertAfter(element);
                }
                if ( !message && this.settings.success ) {
                    label.text("");
                    typeof this.settings.success == "string"
                        ? label.addClass( this.settings.success )
                        : this.settings.success( label );
                }
                this.toShow = this.toShow.add(label);
            }
        });

        jQuery.extend(jQuery.validator.defaults, {
            errorElement: 'span'
        });
    } 
    var page = window.location.pathname;

    $("#close_message").click(function() {
        $("#message_box").slideUp("slow");
    });

    // If signed in
    if (sessionid) {
        setInterval("checkSessionValidity();", checkSessionInterval);
    }
});

// Parses a datetime string and returns the number of milliseconds since epoch
// (1970 January 1, 00:00:00 UTC). If the datetime string cannot be parsed,
// returns null.
function parse_datetime(datetime_string) {
    var d = Date.parse(datetime_string);
    if (d) {
        return Date.UTC(d.getUTCFullYear(), d.getUTCMonth(), d.getUTCDate(), d.getUTCHours(), d.getUTCMinutes(), d.getUTCSeconds(), d.getUTCMilliseconds());
    }
    else {
        return null;
    }
}

function formatAccount(name, account_no) {
    var result;
    if (name == null || name.length == 0) {
        name = '(no name)';
    }
    else {
        name = string_truncate(name, 20);
    }
    if (account_no != null && account_no.length > 0) {
        result = name + ' (' + string_truncate(account_no, 20) + ')';
    }
    else {
        result = name;
    }
    return result;
}

function formatDevice(name, key) {
    var result;
    if (name == null || name.length == 0) {
        name = '(no name)';
    }
    else {
        name = string_truncate(name, 20);
    }
    if (key != null && key.length > 0) {
        result = name + ' (' + string_truncate(key, 20) + ')';
    }
    else {
        result = name;
    }
    return result;
}

function formatUser(login, name) {
    var result;
    if (login == null || login.length == 0) {
        login = '(no login)';
    }
    else {
        name = string_truncate(login, 20);
    }
    if (name != null && name.length > 0) {
        result = login + ' (' + string_truncate(name, 20) + ')';
    }
    else {
        result = login;
    }
    return result;
}

//function openShadow(title, content, width, height) {
//    if (width == null)
//        width = 650;
//    if (height == null)
//        height = 470;
//
//    Shadowbox.open({
//        title:title,
//        content: content,
//        width: width,
//        height: height,
//        player:'iframe'
//    });
//    return false;
//}

function populate_without_page(template, data, target) {
    $(target).html($(template).jqote(data));
}

function populate_with_page_loading(target) {
    $(target).html('<tr><td><span><img src="' + loader_url + '"/></span></td></tr>');
    $("#pagination").html('');
}

function populate_with_page(template, data, target) {
    if (data.length > 0) {
        var maxPageIndex = Math.floor((data.length - 1) / ITEMS_PER_PAGE);
        if (currentPageIndex < 0) {
            currentPageIndex = 0;
        }
        else if (currentPageIndex > maxPageIndex) {
            currentPageIndex = maxPageIndex;
        }
    }
    else {
        currentPageIndex = 0;
    }
    var paginator = $("#pagination");
    paginator.data("template", template);
    paginator.data("data", data);
    paginator.data("target", target);
    paginator.pagination(data.length, {
        items_per_page: ITEMS_PER_PAGE,
        callback: handlePaginationClick,
        num_display_entries: 10,
        num_edge_entries: 1,
        current_page: currentPageIndex
    });
}

function populate_with_page_ondemand(template, count, data, search_url, search_cond, search_result, target) {
    var search_maxid = 0;
    for (var i = 0; i < data.length; i++)
        if (data[i].id > search_maxid)
            search_maxid = data[i].id;
    while (data.length < count)
        data.push(null);
    if (count > 0) {
        var maxPageIndex = Math.floor((count - 1) / ITEMS_PER_PAGE);
        if (currentPageIndex < 0) {
            currentPageIndex = 0;
        }
        else if (currentPageIndex > maxPageIndex) {
            currentPageIndex = maxPageIndex;
        }
    }
    else {
        currentPageIndex = 0;
    }
    var search_info = {
        url: search_url,
        cond: search_cond,
        maxid: search_maxid,
        result: search_result
    };
    var paginator = $("#pagination");
    paginator.data("template", template);
    paginator.data("data", data);
    paginator.data("url", search_url);
    paginator.data("search", search_info);
    paginator.data("target", target);
    paginator.pagination(count, {
        items_per_page: ITEMS_PER_PAGE,
        callback: handlePaginationClickOnDemand,
        num_display_entries: 10,
        num_edge_entries: 1,
        current_page: currentPageIndex
    });
}

function handlePaginationClick(page_index, container) {
    if (page_index < 0)
        page_index = 0;
    currentPageIndex = page_index;
    var template = $(container.data("template"));
    var data = container.data("data");
    var target = $(container.data("target"));
    if (data == null)
        data = [];
    var content = [];
    var len = data.length;
    var start = page_index * ITEMS_PER_PAGE;
    var end = start + ITEMS_PER_PAGE;
    if (end > len)
        end = len;
    for (var i = start; i < end; i++) {
        var item = data[i];
        if ((i - start) % 2 == 0)
            item['trclass'] = 'even';
        else
            item['trclass'] = 'odd';
        content.push(template.jqote(item));
    }
    target.html(content.join('\n'));
    return false;
}

function handlePaginationClickOnDemand(page_index, container) {
    if (page_index < 0)
        page_index = 0;
    currentPageIndex = page_index;
    var data = $(container.data("data"));
    var search_info = container.data("search");
    var target = $(container.data("target"));
    var search_url = search_info.url;
    var search_cond = search_info.cond;
    var search_maxid = search_info.maxid;
    var search_result = search_info.result;
    var len = data.length;
    var start = page_index * ITEMS_PER_PAGE;
    var end = start + ITEMS_PER_PAGE;
    if (end > len)
        end = len;
    var has_null = false;
    for (var i = start; i < end; i++) {
        if (data[i] == null) {
            has_null = true;
            break;
        }
    }
    if (has_null) {
        $(target).html('<tr><td><span><img src="' + loader_url + '"/></span></td></tr>');
        var offset = start - (start % SEARCH_LENGTH);
        var added_cond = 'search_maxid=' + search_maxid + '&search_offset=' + offset + '&search_length=' + SEARCH_LENGTH;
        if (!search_cond)
            search_cond = added_cond;
        else
            search_cond = search_cond + '&' + added_cond;
        ajaxGet(search_url, search_cond, function(d) {
            var new_data = d[search_result];
            for (var i = 0; i < new_data.length; i++)
                data[offset + i] = new_data[i];
            container.data("data", data);
            handlePaginationClick(page_index, container);
	});
    }
    else {
        handlePaginationClick(page_index, container);
    }
    return false;
}

function checkSessionValidity() {
    ajaxGet(time_to_live_url, "sessionid="+sessionid,
        function(data) {
            if (!data || data.ttl <= 0) {
                timeout();
            }
            else if (data.ttl < TIMEOUT_NOTIFICATION_TIME) {
                var toContinue = confirm(SESSION_ABOUT_TIMEOUT);
                if (toContinue) {
                    ajaxGet(keep_alive_url, "sessionid="+sessionid,
                        function(data) {
                            if (!data || !data.success) {
                                timeout();
                            } 
                        }
                    );
                }
                else
                    logout();
            }
        }
    );
}

var beforeunload = false;
window.onbeforeunload = function () {
    beforeunload = true;
};

function setMessage(msg, error) {
    if (beforeunload && error != null && msg == FAIL_TO_CONNECT)
        return;

    clearTimeout(msgTO);
    $("#message_box").hide();
    if (error == null) {
        $("#message_img").attr("class", "pop-info-icon pop-info-icon-success background-image");
        $("#message_box").attr("class", "pop-success");
    } else {
        $("#message_img").attr("class", "pop-info-icon pop-info-icon-failed background-image");
        $("#message_box").attr("class", "pop-failed");
    }

    $("#message_box span").html(msg);
    $("#message_box").slideDown("fast");
    msgTO = setTimeout('$("#message_box").slideUp("slow")', timeToCloseMsg);
}

function closeMsgBoxes() {
    $("#message_box").slideUp("slow");
}

function submitLogin(url) {
    login($("input[name=username]").val(), $("input[name=password]").val(), url);
    return false;
}

function autoLogin(url) {
    login("admin", "admin", url);
}

function submitVoucherLogin(url) {
    url = listVoucherPage_url;
    voucherlogin(voucher_login_url, $("input[name=username]").val(), $("input[name=password]").val(), url);
    return false;
}

function voucherlogin(loginurl, username, pwd, url) {
    var params = {
        "username": username,
        "password": pwd,
        "mechanism": "plain"
    };
    if (url != null) {
        params.url = url;
    }
    ajaxPost(loginurl, params,
        function(data) {
            var authenticate = data.authenticate;
            var redirect_url = data.redirect_url;
            if (authenticate) {
                var url = data.url;
                if (url) {
                    redirect_url = redirect_url + '?url=' + encodeURI(url);
                }
                window.location.href = redirect_url;
            }
            else {
                window.location.href = redirect_url;
            }
        },
        function(jqXHR) {
            $("#loginError").html(jqXHR.responseText);
            
            $("#loginError").css("display", "inline");
        });
}

function submitResetPassword() {
    resetPassword($("input[name=username]").val(), $("input[name=email]").val());
    return false;
}

function submitAuthentication(url) {
    authenticate($("input[name=code]").val(), url);
    return false;
}

//function changePassword() {
//    if(!$("#change-password-form").valid())
//        return;
//
//    $("#loading").html("<img src='"+loader_url+"'/>")
//    $("#loading").css("display", "inline");
//
//    ajaxPost(editUser_url, "login="+readCookie("login")+"&id="+readCookie("userid")+"&"+$("#change-password-form").serialize(),
//        function(responseObj) {
//            $("#loading").css("display", "none");
//            if (responseObj == null || responseObj.status != STATUS_SUCCESS) {
//                window.parent.setMessage(ERROR + " " + responseObj.reason,true);
//                return;
//            } else {
//                window.parent.setMessage(PASSWORD_CHANGE_SUCCESS);
//                window.parent.Shadowbox.close();
//
//            }
//        },
//        function() {
//            $("#loading").css("display", "none");
//            alert(FAIL_TO_CONNECT);
//        });
//}

function login(username, pwd, url) {
    var params = {
        "username": username,
        "password": pwd,
        "mechanism": "plain"
    };
    if (url != null) {
        params.url = url;
    }
    ajaxPost("/sessions/create", params,
        function(data) {
            var authenticate = data.authenticate;
            var redirect_url = data.redirectUrl;
            if (authenticate) {
                var url = data.url;
                if (url) {
                    redirect_url = redirect_url + '?url=' + encodeURI(url);
                }
                window.location.href = redirect_url;
            }else {
            	$("#loginError").css("display", "inline").html(data.message);
            }
        });
}

function logout() {
    ajaxPost(logout_url, null,
        function() {
            window.location = successLogout_url;
        },
        function() {
            alert(FAIL_TO_CONNECT);
        }
    );
}

function timeout() {
    ajaxPost(logout_url, null,
        function() {
            window.location = timeout_url;
        },
        function() {
            window.location = timeout_url;
        }
    );
}

function authenticate(code, url){
    var params = {
        "code": code
    };
    if (url != null) {
        params.url = url;
    }
    ajaxPost(authentication_url, params,
        function(data) {
            var redirect_url = data.redirect_url;
            window.location = redirect_url;
        },
        function() {
            $("#loginError").css("display", "inline");
        });
}

function resetPassword(id, email){
    var params = {
        "username": id,
        "email": email
    };
    ajaxPost(resetPassword_url, params,
        function() {
            $("#resetSuccess").css("display", "inline");
            $("#resetError").css("display", "none");
        },
        function() {
            $("#resetSuccess").css("display", "none");
            $("#resetError").css("display", "inline");
        });
}

function submitForm(form_selector, action, message, callback) {
    var form = $(form_selector);
    if (!form.valid()) return false;
    $("input[type=submit]").attr("disabled", "disabled");
    $("#loading").html('<img src="'+loader_url+'"/>');
    $("#loading").css("display","inline");

    // Set unchecked checkboxes to the value false.
    var values = form.serializeArray();
    values = values.concat(form.find('input[type="checkbox"][name]:not(:checked)').map(
        function() {
            return {"name": this.name, "value": "false"};
        }).get()
    );

    ajaxPost(action, values,
        function(res) {
            if (callback) callback(res);
            if (message) {
                setMessage(message);
                $('div.popup_block a.close').click();
            }
            $("input[type=submit]").removeProp("disabled");
            $("input.change-password").val("");
            $("#loading").html("");

            // User action on forms should keep login session alive.
            ajaxGet(keep_alive_url, "sessionid="+sessionid,
                function(data) {
                    if (!data || !data.success) {
                        timeout();
                    } 
                }
            );
        },
        function(jqXHR) {
            if (message) {
                setMessage(ERROR + " " + jqXHR.responseText,true);
                $('div.popup_block a.close').click();
            }
            $("input[type=submit]").removeProp("disabled");
            $("#loading").html("");

            // User action on forms should keep login session alive.
            ajaxGet(keep_alive_url, "sessionid="+sessionid,
                function(data) {
                    if (!data || !data.success) {
                        timeout();
                    } 
                }
            );
        }
    );
    return false;
}

function confirmAction(message, url, data, success_message, post_func) {
    if (!confirm(message)) return;
    ajaxPost(url, data,
        function(res) {
            setMessage(success_message);
            if (post_func) {
                post_func();
            }
        },
        function(jqXHR) {
            setMessage(ERROR + " " + jqXHR.responseText,true);
        }
    );
}

function getURLParaValue( name )
{
    name = name.replace(/[\[]/,"\\\[").replace(/[\]]/,"\\\]");
    var regexS = "[\\?&]"+name+"=([^&#]*)";
    var regex = new RegExp( regexS );
    var results = regex.exec( window.location.href );
    if( results == null )
        return "";
    else
        return results[1];
}

function clearInputs() {
    $(":input[type=text]").val("");
    $("select").find("option:first").attr("selected", "selected");
    $("input[type=password]").val("");
    $("input[type=checkbox]").attr("checked", false);
    $("input[type=file]").val("");
    $("textarea").val("");
}

function populateComboBox(element, data, header) {
    var html = "";
    if (header!=null)
        html += "<option style=\"background-color:white;\" value=\"-1\">"+header+"</option>";
    if ($.isArray(data)) {
        data.sort();

        for (var i=0;i<data.length;i++) {
            html += "<option value=\""+data[i]+"\">"+data[i]+"</option>";
        }

    } else {
        for (var value in data) {
            html += "<option value=\""+value+"\">"+data[value]+"</option>";
        }
    }
    element.html(html);
}

//function jsonToInputs(object) {
//    for (var key in object) {
//        var target = $("input[name="+key+"]");
//        if (target.length > 0) {
//            target.val(object[key]);
//            if (target.attr('type') == 'checkbox') {
//                target.attr('checked', 'checked');
//            }
//        }
//        $("textarea[name="+key+"]").val(object[key]);
//        $("select[name="+key+"]").val(object[key]);
//    }
//}

function alertConnectionFail(obj) {
    alert(FAIL_TO_CONNECT);
}

function getSnapshotHtml(deviceid, width, height) {
    var data = new Object();
    data.sessionid = sessionid;
    data.deviceid = deviceid;

    if (width != null) {
        data.width = width;
    }
    else {
        width = "100%";
    }

    if (height != null) {
        data.height = height;
    }
    else {
        height = "100%";
    }

    var ran = (new Date()).getTime();
    return "<img width='"+width+"' height='"+height+"' src='"+snapshot_url+"?data="+ JSON.stringify(data)+"&t="+ran+"'/>";
}

function ajaxGet(url, params, succFunc, failFunc, extra) {
    ajax(url, params, succFunc, failFunc, 'GET', extra);
}
function ajaxPost(url, params, succFunc, failFunc, extra) {
    ajax(url, params, succFunc, failFunc, 'POST', extra);
}
function ajax(url, params, succFunc, failFunc, method, extra) {
    /*
    if (sessionid != null && params != null) {
        params = "sessionid="+sessionid+"&"+params;
    }
    */
    $.ajax({
        type: method,
        url: url,
        data: params,
        cache: false,
        success: function(data) {
            if (succFunc != null) {
                succFunc(data, extra);
            }
        },
        error: function(jqXHR, status) {
            if (failFunc) {
                failFunc(jqXHR, extra);
            }
            else {
                setMessage(FAIL_TO_CONNECT, true);
            }
            /*
            if (sessionid != null) {
                alert(SESSION_TIMEOUT);
                logout();
                return;
            }
            */
        }
    });
}

//******************* ASSIGNMENT PAGES *****************************

function toggleSelection(target) {
    $(target).toggleClass('selected-item');
}

function clear_selections() {
    $('.selected-item').removeClass('selected-item');
}

function selectAll(box) {
    $(box+ " .item").addClass('selected-item');
}

function newWindow(url, height, width, left, top) {
    if (height == null)
        height = 500;
    if (width == null)
        width = 600;
    if (top == null)
        top = 20;
    if (left == null)
        left = 20;
    popupWindow = window.open(url,'popUpWindow','height='+height+',width='+width+',left='+left+',top='+top+',resizable=yes,scrollbars=yes,toolbar=no,menubar=no,location=no,directories=no,status=no');
    popupWindow.focus();
}

var BrowserDetect = {
    init: function () {
        this.browser = this.searchString(this.dataBrowser) || "An unknown browser";
        this.version = this.searchVersion(navigator.userAgent)
        || this.searchVersion(navigator.appVersion)
        || "an unknown version";
        this.OS = this.searchString(this.dataOS) || "an unknown OS";
    },
    searchString: function (data) {
        for (var i=0;i<data.length;i++)        {
            var dataString = data[i].string;
            var dataProp = data[i].prop;
            this.versionSearchString = data[i].versionSearch || data[i].identity;
            if (dataString) {
                if (dataString.indexOf(data[i].subString) != -1)
                    return data[i].identity;
            }
            else if (dataProp)
                return data[i].identity;
        }
    },
    searchVersion: function (dataString) {
        var index = dataString.indexOf(this.versionSearchString);
        if (index == -1) return;
        return parseFloat(dataString.substring(index+this.versionSearchString.length+1));
    },
    dataBrowser: [
    {
        string: navigator.userAgent,
        subString: "Chrome",
        identity: "Chrome"
    },
    {
        string: navigator.userAgent,
        subString: "OmniWeb",
        versionSearch: "OmniWeb/",
        identity: "OmniWeb"
    },
    {
        string: navigator.vendor,
        subString: "Apple",
        identity: "Safari",
        versionSearch: "Version"
    },
    {
        prop: window.opera,
        identity: "Opera"
    },
    {
        string: navigator.vendor,
        subString: "iCab",
        identity: "iCab"
    },
    {
        string: navigator.vendor,
        subString: "KDE",
        identity: "Konqueror"
    },
    {
        string: navigator.userAgent,
        subString: "Firefox",
        identity: "Firefox"
    },
    {
        string: navigator.vendor,
        subString: "Camino",
        identity: "Camino"
    },
    {  // for newer Netscapes (6+)
        string: navigator.userAgent,
        subString: "Netscape",
        identity: "Netscape"
    },
    {
        string: navigator.userAgent,
        subString: "MSIE",
        identity: "Explorer",
        versionSearch: "MSIE"
    },
    {
        string: navigator.userAgent,
        subString: "Gecko",
        identity: "Mozilla",
        versionSearch: "rv"
    },
    {  // for older Netscapes (4-)
        string: navigator.userAgent,
        subString: "Mozilla",
        identity: "Netscape",
        versionSearch: "Mozilla"
    }
    ],
    dataOS : [
    {
        string: navigator.platform,
        subString: "Win",
        identity: "Windows"
    },
    {
        string: navigator.platform,
        subString: "Mac",
        identity: "Mac"
    },
    {
        string: navigator.userAgent,
        subString: "iPhone",
        identity: "iPhone/iPod"
    },
    {
        string: navigator.platform,
        subString: "Linux",
        identity: "Linux"
    }
    ]
};
BrowserDetect.init();

function isIE() {
    return BrowserDetect.browser=="Explorer";
}

function update_form(form, data, callback) {
    // User action on forms should keep login session alive.
    ajaxGet(keep_alive_url, "sessionid="+sessionid,
        function(data) {
            if (!data || !data.success) {
                timeout();
            } 
        }
    );

    var map = {
        'select.popup-update-account': ['/api/account/search', 'accounts'],
        'select.popup-update-account-assignable': ['/api/account/search?assignable_only=true', 'accounts'],
        'select.popup-update-role': ['/api/role/search', 'roles'],
        'select.popup-update-model': ['/api/model/search', 'models'],
        'select.popup-update-event-types': ['/api/event_type/search', 'event_types']
    };
    var update_form_counter = 0;
    for (var select_key in map) {
        (function (key, data_url, data_key) {
            var select = form.find(key);
            if (select) {
                update_form_counter++;
                ajaxGet(data_url, null, function(ret_data) {
                    var value, id, name;
                    var obj = ret_data[data_key];
                    select.empty();
                    if (data_key == 'accounts' && obj.length > 1) {
                        // Assume to be superuser.
                        $('<option>').attr('value', 1).html('Unassigned (no account)').appendTo(select);
                    }
                    for (var key in obj) {
                        value = obj[key];
                        id = value.id;
                        name = value.display_name;
                        if (!name)
                            name = value.display;
                        if (!name)
                            name = value.name;
                        $('<option>').attr('value', id).html(name).appendTo(select);
                    }
                    update_form_counter--;
                    if (update_form_counter == 0) {
                        update_form_done(form, data, callback);
                    }
                });
            }
        })(select_key, map[select_key][0], map[select_key][1]);
    }

    $(form).find("#geocode-error").hide();
    $(form).validate().resetForm();
    form.find('input[type="text"],input[type="radio"],input[type="password"],textarea,select').val('');
    form.find('input[type="checkbox"]').attr('checked', false);
}

function update_form_done(form, data, callback) {
    for (var key in data) {
        var value = data[key];
        var checkboxValue = false;
        if (typeof(value) == "boolean") {
            checkboxValue = value;
            value = String(value);
        } 
        $(form).find('input[name='+key+'][type!="checkbox"],textarea[name='+key+'],select[name='+key+']').val(value).keyup();
        $(form).find('input[name='+key+'][type="checkbox"]').attr('checked', checkboxValue).keyup();
    }
    $(form).unbind();
    if (callback) callback();
}

function update_user_edit_modal_window(obj, callback) {
    if (liveview) {
        hideAllViews();
    }
    if (obj) {
        var url = obj.attr('href').split('/');
        if (url) {
            var id = url.pop();
            ajaxGet('/api/user/detail', 'id=' + id, function(data) {
                update_form($('#edit-user-form'), data.user, function() {
                    $(".edit-change-password").hide();
                    $(".edit-reset-password").hide();
                    $('#edit-user-reset-password-btn').unbind('click');
                    if (data.user.email) {
                        $('#edit-user-form .reset-password-info').text(USER_RESET_PASSWORD_OK_INFO.replace('#{email}', data.user.email));
                        $('#edit-user-reset-password-btn').show();
                        $('#edit-user-reset-password-btn').click(function() {
                            if (!confirm('Are you sure you want to reset the password?'))
                                return;
                            ajaxPost('/api/user/reset_password_by_id', 'id=' + id,
                                function(data) {
                                    setMessage('Password has been reset.');
                                    $('div.popup_block a.close').click();
                                },
                                function() {
                                    setMessage('Error resetting password.');
                                }
                            );
                        });
                    }
                    else {
                        $('#edit-user-form .reset-password-info').text(USER_RESET_PASSWORD_ERROR_INFO);
                        $('#edit-user-reset-password-btn').hide();
                    }
                    if (callback) callback();
                });
            });
        }
    }
}

function unload_user_edit_modal_window() {
    if (liveview) {
        showAllViews();
    }
    checkPopup();
}

function update_device_edit_modal_window(obj, callback) {
    if (obj) {
        var url = obj.attr('href').split('/');
        if (url) {
            var id = url.pop();
            ajaxGet('/api/device/detail', 'id='+id+'&admin=true', function(data) {
                update_form($('#edit-device-form'), data.device, callback);
            });
        }
    }
}

function update_role_edit_modal_window(obj, callback) {
    if (obj) {
        var url = obj.attr('href').split('/');
        if (url) {
            var id = url.pop();
            ajaxGet('/api/role/detail', 'id='+id, function(data) {
                update_form($('#edit-role-form'), data.role, function() {
                    var ids = data.role.permission_ids;
                    for (var i in ids) {
                        var id = ids[i];
                        $('#edit-role-form').find('input.edit-role-permission[value=' + id + ']:checkbox').attr('checked', true);
                    }
                    if (callback) callback();
                });
            });
        }
    }
}

function update_account_edit_modal_window(obj, callback) {
    if (obj) {
        var url = obj.attr('href').split('/');
        if (url) {
            var id = url.pop();
            ajaxGet('/api/account/detail', 'id='+id, function(data) {
                update_form($('#edit-account-form'), data.account, callback);
            });
        }
    }
}

function update_account_manage_device_modal_window(obj, callback) {
}

function unload_account_edit_modal_window(obj, callback) {
    if (account != null) {
        updateDetailTable(account.id);
    }
}

function update_user_device_access_rights_modal_window(obj, callback) {
    if (obj) {
        var url = obj.attr('href').split('/');
        if (url) {
            var name = unescape(url.pop());
            var id = url.pop();
            userDevicesUserId = id;
            userDevicesUserName = name;
            updateUserDevicesWithoutAccessRights();
            updateUserDevicesWithAccessRights();
        }
    }
}

function update_voucher_edit_modal_window(obj, callback) {
    if (obj) {
        var url = obj.attr('href').split('/');
        if (url) {
            var id = url.pop();
            ajaxGet('/api/voucher/detail', 'id='+id, function(data) {
                update_form($('#edit-voucher-form'), data.voucher, callback);
            });
        }
    }
}

function string_truncate(str, max_len) {
    if (str == null) {
        str = '';
    }
    else if (str.length > max_len) {
        str = str.substring(0, max_len - 3) + '...';
    }
    return str;
}

$(function (){
    $('.search-button').click(function() {
        $('.search-box').toggle('fast');
    });
});

/**
 * aop 的实现
 * @param object 必须为对象，不能是方法本身
 * @example
 function aopTest()
{
    this.say1 =  function(s)
        {
        alert(s);
    };
    this.say2 =  function(s)
        {
        alert(s);
    };  
}
   
function beforeHander()
{
    alert("aspect said:");
}
function afterHander()
{
        alert("said by aspect");
}
  

var test = new aopTest();
bindAop(test);
test.before("say1",beforeHander); 
test.after("say1",afterHander);
test.say1("hello I'm say1");

test.before("say2",beforeHander);
test.after("say2",afterHander);
test.say2("hello I'm say2");
 */
function bindAop(object)
{
        if(typeof(object) != "object")
        {
                throw new Error("传入的对象类型必须为object！");
                return false;
        }
        object.yield = null;
        object.rv = {};
        object.before  = function(method, f)
        {
                var original = eval("this." + method);
                this[method] = function()
                {
                  f.apply(this, arguments);
                  return original.apply(this, arguments);
                };
        };   
        object.after = function(method, f)
        {
            var original = eval("this." + method);
            this[method] = function()
            {
              this.rv[method] = original.apply(this, arguments);
              return f.apply(this, arguments);
            };
        };   
        object.around = function(method, f)
        {
        var original = eval("this." + method);
        this[method] = function()
            {
              this.yield = original;
              return f.apply(this, arguments);
            };
        };
}
