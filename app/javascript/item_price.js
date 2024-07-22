window.addEventListener('turbo:load', setPriceCalculation);
window.addEventListener('turbo:render', setPriceCalculation);

function setPriceCalculation() {
  const priceInput = document.getElementById('item-price');
  const taxOutput = document.getElementById('add-tax-price');
  const profitOutput = document.getElementById('profit');
  let tax;

  if (priceInput) {
    priceInput.addEventListener("input", () => {
      const inputValue = priceInput.value;

      tax = Math.floor(inputValue * 0.1);
      taxOutput.innerHTML = tax;

      const profit = inputValue - tax;
      profitOutput.innerHTML = Math.floor(profit);
    });
  }
}
