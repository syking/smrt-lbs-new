package controllers;

import play.mvc.*;

public class Schedules extends Controller {

    public static void index() {
        render();
    }

    public static void lines(){
    	
    	renderJSON("");
    }
    
}
