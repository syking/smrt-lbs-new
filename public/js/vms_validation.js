 /**
	 * 判断str1字符串是否以str2为结束
	 * 
	 * @param str1
	 *            原字符串
	 * @param str2
	 *            子串
	 * @author pansen
	 * @return 是-true,否-false
	 */
function endWith(str1, str2){
	if(str1 == null || str2 == null){
		return false;
	}
	if(str1.length < str2.length){
		return false;
	}else if(str1 == str2){
		return true;
	}else if(str1.substring(str1.length - str2.length) == str2){
		return true;
	}
	return false;
}
/**
 * 判断str1字符串是否以str2为开头
 * 
 * @param str1
 *            原字符串
 * @param str2
 *            子串
 * @author pansen
 * @return 是-true,否-false
 */
function startWith(str1, str2){
	if(str1 == null || str2 == null){
		return false;
	}
	if(str1.length < str2.length){
		return false;
	}else if(str1 == str2){
		return true;
	}else if(str1.substr(0, str2.length) == str2){
		return true;
	}
	return false;
}

function show_validation_error(e){
	var err = e.responseText;
	if (!err || $.trim(err).length == 0)
		err = "server error or connection failed";
	
	var _win_dom = $("<div style='padding:15px; color:red;' ></div>");
	_win_dom.kendoWindow({
        title: "Valdiation errors",
		visible: false
    });
    
    var _win = _win_dom.data("kendoWindow").content(err);
	_win.center().open();
}
function validate_enum(input, array) {
	var _name = input.attr("name");
	if (endWith(_name, "_input"))
		return true;
	
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
	var _name = input.attr("name");
	if (endWith(_name, "_input"))
		return true;
	
	input.attr("data-custom-msg", "Cannot be empty");
	var val = input.val();
    return $.trim(val).length > 0;
}