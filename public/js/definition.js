// ************ Misc Urls *********************************************
var image_dir           = base + '/' + theme + '/images/';
var loader_url          = base + '/' + theme + "/images/loader.gif";
var login_url           = apibase + "/sessions/create";
var logout_url          = apibase + "/sessions/destroy";
var authentication_url  = apibase + "/sessions/create";
var successLogin_url    = apibase + "/live";
var successLogout_url   = apibase + "/";
var version_check_url   = apibase + "/api/checkversion";
var time_to_live_url    = apibase + "/api/ttl";
var keep_alive_url      = apibase + "/api/keepalive";
var timeout_url         = apibase + "/error/timeout";

// ************ Role Management Urls **********************************
var searchRole_url      = apibase + "/api/role/search";
var addRole_url         = apibase + "/api/role/add";
var editRole_url        = apibase + "/api/role/edit";
var deleteRole_url      = apibase + "/api/role/delete";

// ************ User Management Urls **********************************
var addUser_url         = apibase + "/api/user/add";
var deleteUser_url      = apibase + "/api/user/delete";
var searchUser_url      = apibase + "/api/user/search";
var searchAssignedUser_url = apibase + "/api/user/search_assigned";
var searchUnassignedUser_url = apibase + "/api/user/search_unassigned";
var getUserDetail_url   = apibase + "/api/user/detail";
var editUser_url        = apibase + "/api/user/edit";
var editUserPage_url    = apibase + "/user/edit";
var assignDevPage_url   = apibase + "/user/assign_device";
var changePassword_url  = apibase + "/login/change_password";
var resetPassword_url   = apibase + "/api/user/reset_password";
var forgotPwdPage_url   = apibase + "/login/forgot_password";

// ************* Device Management Urls *******************************
var addDevice_url       = apibase + "/api/device/add";
var getModels_url       = apibase + "/api/model/search";
var snapshot_url        = apibase + "/api/snapshot";
var editDevicePage_url  = apibase + "/profile/device/edit";
var locationLiveView_url= apibase + "/camera/view";
var editDevice_url      = apibase + "/api/device/edit";
var deleteDevice_url    = apibase + "/api/device/delete";
var searchDevice_url    = apibase + "/api/device/search";
var searchAssignedDevice_url = apibase + "/api/device/search_assigned";
var searchUnassignedDevice_url = apibase + "/api/device/search_unassigned";
var searchEvent_url     = apibase + "/api/event/search";
var getDeviceDetail_url = apibase + "/api/device/detail";
var assignDevices_url   = apibase + "/api/device/assigntouser";
var unassignDevices_url = apibase + "/api/device/unassignfromuser";
var aimetisServer_url   = "http://kztech-demo.safe100.net:50000/default1.aspx";

// ************* Voucher ***************************************
//var voucher_login_url           = apibase + "/api/voucherlogin";
//var listVoucherPage_url         = apibase + "/voucher/list";
//var deleteVoucherPage_url       = apibase + "/voucher/delete";
//var getAllvouchers_url          = apibase + "/api/voucher/search";
//var addVoucher_url              = apibase + "/api/voucher/add";
//var deleteVoucher_url           = apibase + "/api/voucher/delete";
//var searchVoucher_url           = apibase + "/api/voucher/search";
//var getVoucherDetail_url        = apibase + "/api/voucher/detail";
//var editVoucher_url             = apibase + "/api/voucher/edit";
//var editVoucherPage_url         = apibase + "/voucher/edit";
//var createAccountByVoucher_url  = apibase + "/api/voucher/create_account";

// ************* Live View Urls ***************************************
var getViewConfigs_url  = apibase + "/api/view/search";
var getViewDetails_url  = apibase + "/api/view/detail";
var sendPTZ_url         = apibase + "/api/device/ptz";
var saveViewConfig_url  = apibase + "/api/view/config";

// ************* Account Management Urls ******************************
var addAccount_url              = apibase + "/api/account/add";
var getAllAccounts_url          = apibase + "/api/account/search";
var editAccount_url             = apibase + "/api/account/edit";
var deleteAccount_url           = apibase + "/api/account/delete";
var getAccountDetail_url        = apibase + "/api/account/detail";
var searchAccount_url           = apibase + "/api/account/search";
var assignDevicesToAcc_url      = apibase + "/api/account/assign/device";
var unassignDevicesToAcc_url    = apibase + "/api/account/unassign/device";
var assignUsersToAcc_url        = apibase + "/api/account/assign/user";
var unassignUsersToAcc_url      = apibase + "/api/account/unassign/user";

// *************** Constants *********************************************
var NULL_VALUE      = -1;
var ITEMS_PER_PAGE  = 20;

// ROLES
var ROLE_SUPERADMIN = 1;
var ROLE_ADMIN = 2;
var ROLE_SUPPORT = 3;
var ROLE_USER = 4;

var ROLE_NAMES = {
    1    : "Superadmin",
    2    : "Admin",
    3    : "Support",
    4    : "User",
    "Superadmin" : 1,
    "Admin"      : 2,
    "Support"    : 3,
    "User"       : 4
};

// Record Interval
var RECINTERVALS = {
    5000       : "5 secs",
    10000      : "10 secs",
    30000      : "30 secs",
    60000      : "60 secs",
    300000     : "5 mins",
    600000     : "10 mins",
    1800000    : "30 mins",
    3600000    : "60 mins",
    //18000000   : "5 hrs",
    43200000   : "12 hrs"
    //86400000   : "24 hrs"
};

var LED_FONT_SIZES = {
    0   : "Large",
    1   : "Small"
};

var LED_FONT_COLORS = {
    0   : "Red",
    1   : "Green",
    3   : "Amber"
};

//********************* Status Codes **********************
var STATUS_SUCCESS      = 200; // Success
var STATUS_BAD_REQUEST  = 400; // Bad Request (Normally caused by missing required parameter)
var STATUS_NOT_AUTH     = 401; // Not authorized
var STATUS_FORBIDDEN    = 403; // Forbidden (May be caused by session expiry
var STATUS_NOT_FOUND    = 404; // API not found

// *** Search ***
var SEARCH_LENGTH = 1000;
