package controllers;

import play.cache.Cache;
import play.data.validation.Required;
import play.i18n.Lang;
import play.mvc.Before;
import play.mvc.Controller;
import play.mvc.With;
import static models.User.Constant.*;

@With(Interceptor.class)
public class Users extends Controller {

	public static void login() {
		renderTemplate(renderArgs.get(THEME)+"/users/login.html");
	}

	public static void logout() throws Throwable {
		Cache.delete(LOGIN_USER_ATTR);
		login();
	}

}
