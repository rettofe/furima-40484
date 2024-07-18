window.addEventListener('turbo:load', () => {
  const priceInput = document.getElementById("item-price"); //販売価格に対する入力フィールド
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value; 
    const addTaxDom = document.getElementById("add-tax-price"); //"add-tax-price"のidをもつHTML要素で手数料を表示
    addTaxDom.innerHTML = (Math.floor(inputValue * 0.1)); 
    const profitDom = document.getElementById("profit"); //"profit"のidをもつHTML要素で利益を表示
    profitDom.innerHTML = (Math.floor(inputValue * 0.9)); // 利益=販売価格-手数料 なので、販売価格の90%を計算
 })
});

