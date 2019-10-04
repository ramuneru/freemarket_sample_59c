$(function(){
  
  $('.shipping_fee_burden').on('change',function(){

    let value = $(this).val();
    function buildHTML(){
      let burdenSellerHTML = `<label>配送方法</label>
                              <span class="required">必須</span>
                              <select class="collection_select-default shipping_method-select", name="shipping_method", id="shipping_method">
                                <option value="">---</option> 
                                <option value="1">未定</option>
                                <option value="2">らくらくメルカリ便</option>
                                <option value="3">ゆうメール</option>
                                <option value="4">レターパック</option>
                                <option value="5">普通郵便(定形、定形外)</option>
                                <option value="6">クロネコヤマト</option>
                                <option value="7">ゆうパック</option>
                                <option value="8">クリックポスト</option>
                                <option value="9">ゆうパケット</option>
                              </select>`
      return burdenSellerHTML;

      let burdenBuyerHTML =  `<label>配送方法</label>
      <span class="required">必須</span>
      <select class="collection_select-default shipping_method-select", name="shipping_method", id="shipping_method">
        <option value="">---</option> 
        <option value="1">未定</option>
        <option value="2">クロネコヤマト</option>
        <option value="3">ゆうパック</option>
        <option value="4">ゆうメール</option>
      </select>`
      return burdenBuyerHTML; 
    }




    if( value == 1){

    }else if( value == 2){

    }



// = f.collection_select(:shipping_method, Shipping_method.all, :id, :method, {prompt:"---"},{class:"collection_select-default shipping_method-select"})


{/* <select class="select-default shipping_fee_burden-select" name="shipping_fee_burden" id="shipping_fee_burden"><option value="">---</option>
<option value="1">送料込み(出品者負担)</option>
<option value="2">着払い(購入者負担)</option></select> */}



    $('.shipping-method_hidden').append(shipping_method_html);



  })







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