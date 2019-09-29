


$(function() {

	$('.main-contents__list__ul li:nth-child(1)').addClass('active');

	$('.main-contents__list__ul li').click(function() {

		var index = $(this).parent().children('li').index(this);

		$(this).parent('.main-contents__list__ul').each(function(){

			$('>li',this).removeClass('active').eq(index).addClass('active');

		});

		$(this).parent().next().children('.lists-way ul').hide().eq(index).show();

	}).first().click();
});