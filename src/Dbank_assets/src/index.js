import { Dbank } from "../../declarations/Dbank"

window.addEventListener("load", async () => {
  const amount = await Dbank.checkBalance();
  document.getElementById("value").innerText = Math.round(amount * 100) / 100
})

document.querySelector("form").addEventListener("submit", async (event) => {
  event.preventDefault();

  const inputAmt = parseFloat(document.getElementById("input-amount").value);
  const outputAmt = parseFloat(document.getElementById("withdrawal-amount").value);

  const button = event.target.querySelector("#submit-btn");

  button.setAttribute("disabled", true)
  if (inputAmt > 0) {
    await Dbank.topUp(inputAmt);
    document.getElementById("input-amount").value = ""
  }

  if (outputAmt > 0) {
    await Dbank.withdrawl(outputAmt)
    document.getElementById("withdrawal-amount").value = ""
  }

  button.removeAttribute("disabled")

  const amount = await Dbank.checkBalance();
  document.getElementById("value").innerText = amount
})