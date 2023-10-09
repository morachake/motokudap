import {dbank_backend} from "../../declarations/dbank_backend"

window.addEventListener("load", async function () {
  console.log("loading")
  const currentAmount = await dbank_backend.checkBalance();
  this.document.getElementById("value").innerHTML = Math.round(currentAmount * 100 )
})

document.querySelector("form").addEventListener("submit",async function (event){
  event.preventDefault();
  console.log("submitted")
  const inputAmount =  document.getElementById("input-amount").value;
  const outputAmount = document.getElementById("withdrawal-amount").value;

  await dbank_backend.topUp(inputAmount)
})