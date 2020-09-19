
function calc_money(){

  const price = document.getElementById("item-price")
  const fee = document.getElementById("add-tax-price")
  const profit = document.getElementById("profit")

  price.addEventListener('keyup', function(){
   const value = price.value

    const commission = value * 0.1
    const profit_Money = value - commission

    fee.textContent =  commission;
    profit.textContent = profit_Money;

  })
}

window.addEventListener('load', calc_money)