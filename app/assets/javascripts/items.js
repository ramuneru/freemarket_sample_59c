$(function(){

  // 子カテゴリセレクト
  function buildHTML(children){
    var option =``
    children.forEach(function(child){
      option += `<option value="${child.id}">${child.name}</option>`
    });
    var html = `<select class="collection_select-default children-select", name="category", id="category-children_select", required>
                  <option value="">---</option>
                  ${option}
                </select>
                <i class="fa fa-chevron-down"></i>`
    return html;
  };
  $(document).on('change', "#category-parent_select", function(){
    $('.children-select').remove();
    $('.grandchildren-select').remove();
    $("#third-children").empty();
    $('#size-select').empty();
    var parent_id = $('option:selected').val();
    console.log(parent_id);
    parent_id.selected = true; 

    $.ajax({
      url:  '/api/category/children',
      type: "GET",
      data: { parent_id: parent_id },
      dataType: 'json'
    })
    .done(function(data){
      var html = buildHTML(data);
      $("#second-children").append(html);
    })
  });


  // 孫カテゴリセレクト
  function buildHTML2(grandchildren){
    var option =``
    grandchildren.forEach(function(grandchild){
      option += `<option value="${grandchild.id}">${grandchild.name}</option>`
    });
    var html = `<select class="collection_select-default grandchildren-select", name="category", id="category-grandchildren_select", required>
                  <option value="">---</option>
                  ${option}
                </select>
                <i class="fa fa-chevron-down"></i>`
    return html;
  };
  $(document).on('change', "#category-children_select", function(){
    $('.grandchildren-select').remove();
    $('#size-select').empty();
    var parent_id = $(this).val();
    parent_id.selected = true; 
    
    $.ajax({
      url:  '/api/category/children',
      type: "GET",
      data: { parent_id: parent_id },
      dataType: 'json'
    })
    .done(function(data){
      var html = buildHTML2(data);
      $("#third-children").append(html);
    })
  });

    // サイズセレクト
    function addHTML(sizes){
      var option =``
      sizes.forEach(function(size){
        option += `<option value="${size.id}">${size.size}</option>`
      });
      var html = `<label>サイズ</label>
                  <span class="required">必須</span>
                  <div class="select-wrap">
                    <select class="collection_select-default size-select", name="item[size_id]", required>
                    <option value="">---</option>
                    ${option}
                    </select><i class="fa fa-chevron-down"></i>
                  </div>`
      return html;
    };
    $(document).on('change', "#category-grandchildren_select", function(){
      $('#size-select').empty();
      var grandchild_id = $(this).val();

      $.ajax({
        url:  '/api/size',
        type: "GET",
        data: { grandchild_id: grandchild_id},
        dataType: 'json'
      })
      .done(function(data){
        var html = addHTML(data);
        $("#size-select").append(html);
      })
    });
  

  // 配送方法のjs記述途中
//   $('.shipping_fee_burden').on('change',function(){

//     let value = $(this).val();
//     function buildSellerHTML(){
//       let burdenSellerHTML = `<label>配送方法</label>
//                               <span class="required">必須</span>
//                               <select class="collection_select-default shipping_method-select", name="shipping_method", id="shipping_method">
//                                 <option value="">---</option> 
//                                 <option value="1">未定</option>
//                                 <option value="2">らくらくメルカリ便</option>
//                                 <option value="3">ゆうメール</option>
//                                 <option value="4">レターパック</option>
//                                 <option value="5">普通郵便(定形、定形外)</option>
//                                 <option value="6">クロネコヤマト</option>
//                                 <option value="7">ゆうパック</option>
//                                 <option value="8">クリックポスト</option>
//                                 <option value="9">ゆうパケット</option>
//                               </select>`
//       return burdenSellerHTML;

//       let burdenBuyerHTML =  `<label>配送方法</label>
//       <span class="required">必須</span>
//       <select class="collection_select-default shipping_method-select", name="shipping_method", id="shipping_method">
//         <option value="">---</option> 
//         <option value="1">未定</option>
//         <option value="2">クロネコヤマト</option>
//         <option value="3">ゆうパック</option>
//         <option value="4">ゆうメール</option>
//       </select>`
//       return burdenBuyerHTML; 
//     }

//     if( value == 1){

//     }else if( value == 2){

//     }
// // = f.collection_select(:shipping_method, Shipping_method.all, :id, :method, {prompt:"---"},{class:"collection_select-default shipping_method-select"})


// {/* <select class="select-default shipping_fee_burden-select" name="shipping_fee_burden" id="shipping_fee_burden"><option value="">---</option>
// <option value="1">送料込み(出品者負担)</option>
// <option value="2">着払い(購入者負担)</option></select> */}

//     $('.shipping-method_hidden').append(shipping_method_html);

//   })

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


