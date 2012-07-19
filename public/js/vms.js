
function sendEmailButtonClick(button){
	var _formId = $(button).attr("formId");
	var $form = $("#"+_formId);
	var params = $form.serializeArray();
	var url = $(button).attr("url");
	$.getJSON(url, params, function(json){
		alert(kendo.stringify(json));
	});
}

function exportButtonClick(button){
	var _formId = $(button).attr("formId");
	var $form = $("#"+_formId);
	var params = $form.serialize();
	var url = $(button).attr("url") + "?"+params;
	var win = window.open().location = url;
}

$(document).ready(function(){
	$(".send-email-button").click(function(){
		sendEmailButtonClick(this);
	});
	
	$(".export-excel-button").click(function(){
		exportButtonClick(this);
	});

	$(".print-button").click(function(){
		window.print();
	});
});