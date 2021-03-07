window.addEventListener('load', () => {
const price = document.getElementById("item-price")
price.addEventListener('input', () => {
  const inprice = price.value  
  
  const addtax = document.getElementById("add-tax-price")
  tax = inprice * 0.1
  addtax.innerHTML = Math.floor(tax)
  
  const addprofit = document.getElementById("profit")
  gains = inprice - tax
  addprofit.innerHTML = gains
})
})