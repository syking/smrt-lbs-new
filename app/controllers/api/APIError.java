package controllers.api;

public interface APIError {

	String USER_LOGIN_FAIL = "user_login_fail";
	String USER_LOGIN_REQUIRED = "user_login_required";
	String USER_CERATE_FAIL = "user_create_fail";
	String USER_LOGOUT_FAIL = "user_logout_fail";
	String ACCESS_DENIED = "access_denied";
	String USER_FETCH_FAIL = "user_fetch_fail";
	String USER_UPDATE_FAIL = "user_update_fail";
	String USER_DESTROY_FAIL = "user_destroy_fail";
}
