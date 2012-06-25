/**
 * handle the login form's submit action
 * @param form
 * @param url
 * @returns {Boolean}
 */
function submitLogin(form, url) {
	var loginUri = "/api/users/authenticate";
	var $form = $(form);
	var params = $form.serializeArray();
	
	$.getJSON(loginUri, params, function(data){
		var authenticate = data.authenticate;
		var redirectUrl = data.redirectUrl;
		var message = data.message;
		
		if (authenticate){
			window.location.href = redirectUrl;
		}else {
			$("#loginError").css("display", "inline").html(message);
		}
	});
	
    return false;
}