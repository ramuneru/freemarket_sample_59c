$(function() {

  // ①タブをクリックしたら発動
  $('.main-contents__p__list li').click(function() {

    // ②クリックされたタブの順番を変数に格納
    var index = $('.main-contents__p__list li').index(this);

    // ③クリック済みタブのデザインを設定したcssのクラスを一旦削除
    $('.main-contents__p__list li').removeClass('active');
// --------------------------------------------------------------------÷
    // ④クリックされたタブにクリック済みデザインを適用する
    $(this).addClass('active');

    // ⑤コンテンツを一旦非表示にし、クリックされた順番のコンテンツのみを表示
    $('.lists ul').removeClass('show').eq(index).addClass('show');

  });
});

$(function() {

  // ①タブをクリックしたら発動
  $('.main-contents__p__list li').click(function() {

    // ②クリックされたタブの順番を変数に格納
    var index = $('.main-contents__p__list li').index(this);

    // ③クリック済みタブのデザインを設定したcssのクラスを一旦削除
    $('.main-contents__p__list li').removeClass('active');
// --------------------------------------------------------------------÷
    // ④クリックされたタブにクリック済みデザインを適用する
    $(this).addClass('active');

    // ⑤コンテンツを一旦非表示にし、クリックされた順番のコンテンツのみを表示
    $('.lists ul').removeClass('show').eq(index).addClass('show');

  });
});