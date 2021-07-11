window.addEventListener('load', function () {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    console.log(inputValue);
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.round(inputValue * 0.1);
    console.log(addTaxDom);
    const profitSale = document.getElementById ("profit");
    profitSale.innerHTML = (Math.floor(inputValue - addTaxDom.innerHTML));
    console.log(profitSale);
  });
});