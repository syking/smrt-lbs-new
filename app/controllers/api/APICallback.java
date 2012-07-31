package controllers.api;

import java.io.Serializable;

import play.mvc.Http;

/**
 * Application JSON CallBack for RESTful HTTP Request
 * 
 * @author weiwei
 * 
 */
public class APICallback implements Serializable {

	private boolean success = true;
	private Object data;
	private String error;
	private String error_desc;
	private String request_uri;

	public APICallback() {
		super();
	}

	public APICallback(boolean success, Object data) {
		super();
		this.success = success;
		this.data = data;
	}
	
	public static APICallback success() {
		return success(null);
	}
	
	public static APICallback success(Object data) {
		APICallback cb = new APICallback();
		cb.setSuccess(true);
		cb.setData(data);
		
		return cb;
	}
	
	public static APICallback user_info_required(){
		return fail(APIError.USER_CERATE_FAIL, "User info required");
	}
	
	public static APICallback fail(final String error, final String error_desc){
		return fail(null, error, error_desc);
	}
	
	public static APICallback fail(final Object data, final String error, final String error_desc){
		APICallback cb = new APICallback();
		cb.setSuccess(false);
		cb.setError(error);
		cb.setError_desc(error_desc);
		cb.setData(data);
		
		return cb;
	}
	
	public boolean isSuccess() {
		return success;
	}

	public void setSuccess(boolean success) {
		this.success = success;
	}

	public Object getData() {
		return data;
	}

	public void setData(Object data) {
		this.data = data;
	}

	public String getError() {
		return error;
	}

	public void setError(String error) {
		this.error = error;
	}

	public String getError_desc() {
		return error_desc;
	}

	public void setError_desc(String error_desc) {
		this.error_desc = error_desc;
	}

	public String getRequest_uri() {
		return request_uri;
	}

	public void setRequest_uri(String request_uri) {
		this.request_uri = request_uri;
	}

}
