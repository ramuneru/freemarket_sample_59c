


$(function() {

	$('.main-contents__p__list li:nth-child(1)').addClass('active');

	$('.main-contents__p__list li').click(function() {

		var index = $(this).parent().children('li').index(this);

		$(this).parent('.main-contents__p__list').each(function(){

			$('>li',this).removeClass('active').eq(index).addClass('active');

		});

		$(this).parent().next().children('.lists ul').hide().eq(index).show();

	}).first().click();
});