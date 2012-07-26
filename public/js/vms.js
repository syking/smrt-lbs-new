
function sendEmailButtonClick(button,e){
	var _formId = $(button).attr("formId");
	var $form = $("#"+_formId);
	var params = $form.serializeArray();
	var url = $(button).attr("url");
	var $loading = $("<img id='__loading' style='z-index:99999999; position:absolute; top:40%; left:40%;' src='/public/images/email-sending.gif' />").insertAfter("head");
	$.getJSON(url, params, function(json){
		$loading.remove();
		if (json.success){
			alert("email send successfully");
		}else{
			alert(json.message);
		}
	});
}

function exportButtonClick(button){
	var _formId = $(button).attr("formId");
	var $form = $("#"+_formId);
	var params = $form.serialize();
	var url = $(button).attr("url") + "?"+params;
	window.open(url, 'export');
}

$(document).ready(function(){
	$(".send-email-button").unbind("click");
	$(".send-email-button").click(function(){
		sendEmailButtonClick(this);
	});
	
	$(".export-excel-button").unbind("click");
	$(".export-excel-button").click(function(){
		exportButtonClick(this);
	});
	
	$(".export-pdf-button").unbind("click");
	$(".export-pdf-button").click(function(){
		exportButtonClick(this);
	});

	$(".print-button").unbind("click");
	$(".print-button").click(function(){
		window.print();
	});
});