// ************ Misc Urls *********************************************
var login_url           = "/sessions/create";
var logout_url          = "/sessions/destroy";
var authentication_url  = "/sessions/create";
var successLogin_url    = "/live";
var successLogout_url   = "/";
var version_check_url   = "/api/checkversion";
var time_to_live_url    = "/api/ttl";
var keep_alive_url      = "/api/keepalive";
var timeout_url         = "/error/timeout";

// ************ Role Management Urls **********************************
var searchRole_url      = "/api/role/search";
var addRole_url         = "/api/role/add";
var editRole_url        = "/api/role/edit";
var deleteRole_url      = "/api/role/delete";

// ************ User Management Urls **********************************
var addUser_url         = "/api/user/add";
var deleteUser_url      = "/api/user/delete";
var searchUser_url      = "/api/user/search";
var searchAssignedUser_url = "/api/user/search_assigned";
var searchUnassignedUser_url = "/api/user/search_unassigned";
var getUserDetail_url   = "/api/user/detail";
var editUser_url        = "/api/user/edit";
var editUserPage_url    = "/user/edit";
var assignDevPage_url   = "/user/assign_device";
var changePassword_url  = "/login/change_password";
var resetPassword_url   = "/api/user/reset_password";
var forgotPwdPage_url   = "/login/forgot_password";

// ************* Device Management Urls *******************************
var addDevice_url       = "/api/device/add";
var getModels_url       = "/api/model/search";
var snapshot_url        = "/api/snapshot";
var editDevicePage_url  = "/profile/device/edit";
var locationLiveView_url= "/camera/view";
var editDevice_url      = "/api/device/edit";
var deleteDevice_url    = "/api/device/delete";
var searchDevice_url    = "/api/device/search";
var searchAssignedDevice_url = "/api/device/search_assigned";
var searchUnassignedDevice_url = "/api/device/search_unassigned";
var searchEvent_url     = "/api/event/search";
var getDeviceDetail_url = "/api/device/detail";
var assignDevices_url   = "/api/device/assigntouser";
var unassignDevices_url = "/api/device/unassignfromuser";
var aimetisServer_url   = "http://kztech-demo.safe100.net:50000/default1.aspx";

// ************* Voucher ***************************************
//var voucher_login_url           = "/api/voucherlogin";
//var listVoucherPage_url         = "/voucher/list";
//var deleteVoucherPage_url       = "/voucher/delete";
//var getAllvouchers_url          = "/api/voucher/search";
//var addVoucher_url              = "/api/voucher/add";
//var deleteVoucher_url           = "/api/voucher/delete";
//var searchVoucher_url           = "/api/voucher/search";
//var getVoucherDetail_url        = "/api/voucher/detail";
//var editVoucher_url             = "/api/voucher/edit";
//var editVoucherPage_url         = "/voucher/edit";
//var createAccountByVoucher_url  = "/api/voucher/create_account";

// ************* Live View Urls ***************************************
var getViewConfigs_url  = "/api/view/search";
var getViewDetails_url  = "/api/view/detail";
var sendPTZ_url         = "/api/device/ptz";
var saveViewConfig_url  = "/api/view/config";

// ************* Account Management Urls ******************************
var addAccount_url              = "/api/account/add";
var getAllAccounts_url          = "/api/account/search";
var editAccount_url             = "/api/account/edit";
var deleteAccount_url           = "/api/account/delete";
var getAccountDetail_url        = "/api/account/detail";
var searchAccount_url           = "/api/account/search";
var assignDevicesToAcc_url      = "/api/account/assign/device";
var unassignDevicesToAcc_url    = "/api/account/unassign/device";
var assignUsersToAcc_url        = "/api/account/assign/user";
var unassignUsersToAcc_url      = "/api/account/unassign/user";

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
