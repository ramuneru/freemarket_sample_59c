// トップページ 広告下の人気カテゴリーボタンの指定位置スクロール用js
$(function(){

  // レディース
  $('.ladies-btn').on('click' ,function(){ 

    let targetTopLady = $('.ladies-10items').offset().top;
    $(window).scrollTop(targetTopLady);
  });

  // メンズ
  $('.mens-btn').on('click' ,function(){

    let targetTopMens = $('.mens-10items').offset().top;
    $(window).scrollTop(targetTopMens);
  });

  // 家電・スマホ・カメラ
  $('.e-appliances-btn').on('click' ,function(){
    
    let targetTopEleApp = $('.e-appliances-10items').offset().top;
    $(window).scrollTop(targetTopEleApp);
  });

});