window.addEventListener('load', () => {

  const priceBuy = document.getElementById("item-price");
  priceBuy.addEventListener("input", () => {
    const inputValue = priceBuy.value;
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = (Math.floor(0.1 * inputValue));
    
    const profitDom = document.getElementById("profit");
    profitDom.innerHTML = (Math.floor(0.9 * inputValue));

  })
});
