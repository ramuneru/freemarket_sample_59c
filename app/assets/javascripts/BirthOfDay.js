$("#birthday_dateOfbirth_1i,#birthday_dateOfbirth_2i").on({
  change : function() {

      // 要素取得と初期化
      var dateSelect = $("#birthday_dateOfbirth_3i");
      dateSelect.empty();

      var y = $("#birthday_dateOfbirth_1i").val();
      var m = $("#birthday_dateOfbirth_2i").val();

      // 閏年判定
      if (2 == m && (0 == y % 400 || (0 == y % 4 && 0 != y % 100))) {
          var last = 29;
      } else {
          var last = new Array(31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31)[m - 1];
      }

      //  日の要素生成
      var options = [];
      last += 1;
      for (var i = 1; i < last; i++) {
          var option = $('<option>').attr('value', i).text(i);
          options.push(option);
      }
      dateSelect.append(options);
  }
});

$("#birthday_dateOfbirth_1i,#birthday_dateOfbirth_2i,#birthday_dateOfbirth_3i").on({
  change : function() {
      var y = $("#birthday_dateOfbirth_1i").val();
      var m = $("#birthday_dateOfbirth_2i").val();
      var d = $("#birthday_dateOfbirth_3i").val();
      $('#userBirthDay').val(y + '/' + m + '/' + d);
  }
})