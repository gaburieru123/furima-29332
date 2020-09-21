
function calc_money(){

  const price = document.getElementById("item-price")
  const price_fee = document.getElementById("add-tax-price")
  const price_profit = document.getElementById("profit")

  price.addEventListener('keyup', function(){
   const value = price.value

    const commission = value * 0.1
    const profit_Money = value - commission

    price_fee.textContent =  Math.floor(commission)
    price_profit.textContent = Math.floor(profit_Money)

  })
}

window.addEventListener('turbolinks:load', calc_money)