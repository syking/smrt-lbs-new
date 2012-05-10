
function initMenu() {
  	 $('#menu ul').hide();
     $('.menu-item').hover(
        function(){
          $(this).addClass("hover");
        },
        function(){
          $(this).removeClass("hover");
        });

    $('#menu li div').click(
        function(){
            var checkElement = $(this).next();
            if((checkElement.is('ul')) && (checkElement.is(':visible'))) {
                return false;
            }
            if((checkElement.is('ul')) && (!checkElement.is(':visible'))) {
                $('#menu ul:visible').slideUp('normal');
                checkElement.slideDown('normal');
                return false;
            }
        });

    $('.sub-menu li').hover(
        function () {
            $(this).addClass("hover");
            $(this).find('a div.menu-li-icon').addClass("hover");
            $(this).find('a span.sub-menu-text').addClass("hover");
        },
        function () {
            if ($(this).hasClass("active")) return;
            $(this).removeClass("hover");
            $(this).find('a div.menu-li-icon').removeClass("hover");
            $(this).find('a span.sub-menu-text').removeClass("hover");
        });
	
		$('.menu-profile li').hover(
	        function () {
	            $(this).addClass("hover");
	            $(this).find('a div.menu-li-icon').addClass("hover");
	            $(this).find('a span.sub-menu-text').addClass("hover");
	        },
	        function () {
	            if ($(this).hasClass("active")) return;
	            $(this).removeClass("hover");
	            $(this).find('a div.menu-li-icon').removeClass("hover");
	            $(this).find('a span.sub-menu-text').removeClass("hover");
	        });

    function removeHover(target) {
    }

}
$(document).ready(function() {
    initMenu();
});

