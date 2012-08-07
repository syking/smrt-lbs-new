function validate_enum(input, array) {
	input.attr("data-custom-msg", array);
	var val = input.val();
	if (!val || $.trim(val).length == 0)
		return true;
	
	var flag = false;
	$.each(array, function(i, v){
		if (v === val){
			flag = true;
			return ;
		}
	});
	
	return flag;
}

function validate_empty(input) {
	input.attr("data-custom-msg", "Can't be empty");
	var val = input.val();
    return $.trim(val).length > 0;
}