
const price = () => {
  const priceInput = document.getElementById("item-price"); //販売価格に対する入力フィールド
  priceInput.addEventListener("input", () => {
  
 })
  if (priceInput) { 
      priceInput.addEventListener("input", () => {
      const inputValue = Math.floor(priceInput.value); // 販売価格を整数に変換
      const addTaxDom = document.getElementById("add-tax-price"); // 手数料を表示する要素
      const fee = Math.floor(inputValue * 0.1); // 手数料を計算し、小数点以下を切り捨て
      addTaxDom.innerHTML = fee; 

      const profitDom = document.getElementById("profit"); // 利益を表示する要素
      const profit = inputValue - fee; // 利益を計算
      profitDom.innerHTML = profit; // 利益を表示
   });
  }
};
window.addEventListener("turbo:load", price);
window.addEventListener("turbo:render", price);