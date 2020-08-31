window.addEventListener('load',function(){

  const priceArea = document.getElementById("fee");
  priceArea.addEventListener('input',function(){
    const price = this.value;
    let priceFee = price * 0.1;
    let priceProfit = price - priceFee;
    document.getElementById('add-tax-price').innerText = priceFee;
    document.getElementById('profit').innerText = priceProfit;
  });  
});