package controllers;

import models.User;
import play.cache.Cache;
import play.data.validation.Required;
import play.i18n.Lang;
import play.mvc.Before;
import play.mvc.Controller;

import java.util.HashMap;
import java.util.Map;

import static models.User.Constant.*;

public class Interceptor extends Controller {

	@Before(priority = 0)
	static void setup() {
		Lang.set("en");
		renderArgs.put(THEME, "default");
		renderArgs.put("base", "");
		renderArgs.put("static_dir", "/public");
		renderArgs.put("apibase", "");
		renderArgs.put("language", Lang.get());
		renderArgs.put("baseUrl", "http://localhost:9000");

	}

	@Before(priority = 1, unless = { "Users.authenticate", "Application.login", "Application.logout" })
	static void checkAccess() throws Throwable {

		if (Cache.get(LOGIN_USER_ATTR) == null) {
			flash.put("url", "GET".equals(request.method) ? request.url : "/"); 
			Application.login();
		}

		renderArgs.put("user", Cache.get(LOGIN_USER_ATTR));
	}
}
