function validate_empty(input) {
	input.attr("data-custom-msg", "Can't be empty");
	var val = input.val();
    return val.trim().length > 0;
}