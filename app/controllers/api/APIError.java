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
	
	String PERM_CERATE_FAIL = "perm_create_fail";
	String PERM_FETCH_FAIL = "perm_fetch_fail";
	String PERM_UPDATE_FAIL = "perm_update_fail";
	String PERM_DESTROY_FAIL = "perm_destroy_fail";
	
	String DEPT_CERATE_FAIL = "dept_create_fail";
	String DEPT_FETCH_FAIL = "dept_fetch_fail";
	String DEPT_UPDATE_FAIL = "dept_update_fail";
	String DEPT_DESTROY_FAIL = "dept_destroy_fail";
	String DEPT_ASSIGN_FAIL = "dept_assign_fail";
}
