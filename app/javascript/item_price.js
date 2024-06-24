window.addEventListener('turbo:load', () => { 
  const  priceInput = document.getElementById('item-price');
  let tax;

  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    console.log(inputValue);

    tax = Math.floor(inputValue * 0.1);
    const addTaxDom = document.getElementById('add-tax-price');
    addTaxDom.innerHTML = tax;

    const profit = document.getElementById('profit');
    profit.innerHTML = Math.floor(inputValue - tax);
  })
});
