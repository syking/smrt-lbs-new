function check_required() {
    if ($('#user-sms-check-box').attr('checked')) {
        $('#mobile-no').addClass('required');
    } else {
        $('#mobile-no').removeClass('required');
        $('#mobile-no').unbind();
    }
    if ($('#user-email-check-box').attr('checked')) {
        $('#user-email').addClass('required');
    } else {
        $('#user-email').removeClass('required');
        $('#user-email').unbind();
    }
}

function input_focus(){
    $('input.input-focus,textarea.input-focus').focus(function(){
        $(this).addClass("input-focused");
        $(this).removeClass("input-focusout");
    });
    $('input.input-focus,textarea.input-focus').focusout(function(){
        $(this).addClass("input-focusout");
        $(this).removeClass("input-focused");
    });
}

function apply_required_info(){
    var none_required_field = $("label input");
    none_required_field.each(function(){
        $(this).prev('span').hide().css('opacity', 0);
    });

    var required_field = $("label input.required");
    required_field.each(function() {
        if ($(this).val()) {
            $(this).prev('span').hide().css('opacity', 0);
        } else {
            $(this).prev('span').css('display', 'block').css('opacity', 1);
        }
    });

    $(required_field).focus(function () {
	if($(this).val()){
            $(this).prev('span').animate({opacity: 0},10);
	} else{
            $(this).prev('span').animate({opacity: 0.4},100);
	}
    });

    $(required_field).keyup(function () {
        if ($(this).val()) {
            $(this).prev('span').hide().animate({opacity: 0},100);
        } else {
            $(this).prev('span').css('display', 'block').animate({opacity: 0.4},100);
        }
    });

    $(required_field).focusout(function () {
	if (!$(this).val()) {
            $(this).prev('span').animate({opacity: 1},100);
	} else {
            $(this).prev('span').animate({opacity: 0},100);

	}
    });
}

$(function() {
    check_required();
    apply_required_info();
    input_focus();
    $('#user-sms-check-box').change(function() {
        check_required();
        apply_required_info();
        input_focus();
    });
    $('#user-email-check-box').change(function() {
        check_required();
        apply_required_info();
        input_focus();
    });
    $('.input-required-info').click(function() {
        $(this).next().focus();
    });
});
