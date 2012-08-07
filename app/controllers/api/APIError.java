package controllers.api;

public interface APIError {
	String ACCESS_DENIED = "access_denied";
	
	String USER_LOGIN_FAIL = "user_login_fail";
	String USER_LOGIN_REQUIRED = "user_login_required";
	String USER_LOGOUT_FAIL = "user_logout_fail";
	
	String USER_CERATE_FAIL = "user_create_fail";
	String USER_FETCH_FAIL = "user_fetch_fail";
	String USER_UPDATE_FAIL = "user_update_fail";
	String USER_DESTROY_FAIL = "user_destroy_fail";
	
	String ROLE_CERATE_FAIL = "role_create_fail";
	String ROLE_FETCH_FAIL = "role_fetch_fail";
	String ROLE_UPDATE_FAIL = "role_update_fail";
	String ROLE_DESTROY_FAIL = "role_destroy_fail";
	String ROLE_ASSIGN_FAIL = "role_assign_fail";
	String ROLE_UNASSIGN_FAIL = "role_unassign_fail";
	
	
	String PERM_CERATE_FAIL = "perm_create_fail";
	String PERM_FETCH_FAIL = "perm_fetch_fail";
	String PERM_UPDATE_FAIL = "perm_update_fail";
	String PERM_DESTROY_FAIL = "perm_destroy_fail";
	
	String DEPT_CERATE_FAIL = "dept_create_fail";
	String DEPT_FETCH_FAIL = "dept_fetch_fail";
	String DEPT_UPDATE_FAIL = "dept_update_fail";
	String DEPT_DESTROY_FAIL = "dept_destroy_fail";
	String DEPT_ASSIGN_FAIL = "dept_assign_fail";
	String DEPT_UNASSIGN_FAIL = "dept_unassign_fail";
	
	String FLEET_CERATE_FAIL = "fleet_create_fail";
	String FLEET_FETCH_FAIL = "fleet_fetch_fail";
	String FLEET_UPDATE_FAIL = "fleet_update_fail";
	String FLEET_DESTROY_FAIL = "fleet_destroy_fail";
	String FLEET_ASSIGN_FAIL = "fleet_assign_fail";
	String FLEET_UNASSIGN_FAIL = "fleet_unassign_fail";
	
	String DRIVER_CERATE_FAIL = "driver_create_fail";
	String DRIVER_FETCH_FAIL = "driver_fetch_fail";
	String DRIVER_UPDATE_FAIL = "driver_update_fail";
	String DRIVER_DESTROY_FAIL = "driver_destroy_fail";
	
	String DEVICE_CERATE_FAIL = "device_create_fail";
	String DEVICE_FETCH_FAIL = "device_fetch_fail";
	String DEVICE_UPDATE_FAIL = "device_update_fail";
	String DEVICE_DESTROY_FAIL = "device_destroy_fail";
	
	String COUNSELLING_CERATE_FAIL = "counselling_create_fail";
	String COUNSELLING_FETCH_FAIL = "counselling_fetch_fail";
	String COUNSELLING_UPDATE_FAIL = "counselling_update_fail";
	String COUNSELLING_DESTROY_FAIL = "counselling_destroy_fail";
}
