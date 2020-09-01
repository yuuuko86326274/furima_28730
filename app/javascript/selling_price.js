window.addEventListener ("load",function() {
  const form = document.getElementById("item-price");
  const tax = 10;
  form.addEventListener("keyup", event => {
    tax2 = (form.value*tax)/100;
    pro = form.value-tax2;
    document.getElementById("add-tax-price").textContent = Math.round(tax2);
    document.getElementById("profit").textContent = Math.round(pro);
  });
});


//ページが読み込まれたときのイベント
//formの値を取得する
//キーを入力したときのイベント
//formの値に対して販売手数料を計算
//販売利益も計算
//上で計算した値を表示させる