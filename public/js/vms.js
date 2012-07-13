
function exportButtonClick(button){
	var _formId = $(button).attr("formId");
	var $form = $("#"+_formId);
	var params = $form.serialize();
	var url = $(button).attr("url") + "?"+params;
	var win = window.open().location = url;
}
$(document).ready(function(){
	$(".export-excel-button").click(function(){
		exportButtonClick(this);
	});

	$(".print-button").click(function(){
		window.print();
	});
});