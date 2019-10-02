$(function(){
  








  
  // プライスから手数料&利益を算出
  $('.price-input').on("keyup", function(){
    
    let price = $(this).val();
    let fee_decimal = price * 0.1;
    let fee = Math.floor(fee_decimal);
    let total = price - fee;

    if (price >= 300 && price < 10000000){
      $('.fee').text("¥" + fee);
      $('.sales-profit').text("¥" + total);
    }else if( price < 299 || price >=  10000000){
      $('.fee').text("-");
      $('.sales-profit').text("-");
    }
  });
});