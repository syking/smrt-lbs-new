package models;

import java.io.Serializable;

import play.mvc.Http;

/**
 * Application JSON CallBack for RESTful HTTP Request
 * 
 * @author weiwei
 * 
 */
public class CallBack implements Serializable{
	
	private boolean success = true;
	private String message;
	private Object data;

	public CallBack() {
		super();
	}
	
	public CallBack(boolean success, String message, Object data) {
		super();
		this.success = success;
		this.message = message;
		this.data = data;
	}

	public boolean isSuccess() {
		return success;
	}

	public void setSuccess(boolean success) {
		this.success = success;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public Object getData() {
		return data;
	}

	public void setData(Object data) {
		this.data = data;
	}
}
