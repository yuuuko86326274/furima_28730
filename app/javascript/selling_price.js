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