//When you click on a link with class of poplight and the href starts with a #

function setupModal() {
    $('a.modal-window').unbind();
    $('a.modal-window').live('click', function() {
        var popID = $(this).attr('rel');
        var func_name = 'update_'+$(this).attr('rel');
        var unload_func_name = 'unload_'+$(this).attr('rel');
        var target = $('.' + popID);
        if (eval('typeof ' + func_name) == 'function') {
            eval(func_name)($(this), function() {
                $('#loading').hide();
                target.find('form').show();
            });
        }
        target.find('form').hide();
        $('#loading').show();
        target.fadeIn().prepend('<a href="#" class="close btn_close background-image"></a>');
        $('body').append('<div class="fade"></div>'); //Add the fade layer to bottom of the body tag.
        $('.fade').css({
            'filter' : 'alpha(opacity=50)'
        }).fadeIn(); //Fade in the fade layer - .css({'filter' : 'alpha(opacity=50)'}) is used to fix the IE Bug on fading transparencies
        $(document).data('modal_unload_func', unload_func_name);
        return false;
    });

    //Close Popups and Fade Layer
    $('a.close, .fade').live('click', function() { //When clicking on the close or fade layer...
        var unload_func_name = $(document).data('modal_unload_func');
        if (eval('typeof ' + unload_func_name) == 'function') {
            eval(unload_func_name)($(this), null);
        }
        $('html').css({'overflow':'auto'});
        $('.fade , .popup_block').fadeOut(function() {
            $('.fade, a.close').remove();  //fade them both out
        });
        return false;
    });
}

