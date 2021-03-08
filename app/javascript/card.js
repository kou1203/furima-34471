const pay = () => {
  
  Payjp.setPublicKey("pk_test_c1ef4777199f1c6e5ed6df90");
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();

    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("purchase_product_history[number]"),
      cvc: formData.get("purchase_product_history[cvc]"),
      exp_month: formData.get("purchase_product_history[exp_month]"),
      exp_year: `20${formData.get("purchase_product_history[exp_year]")}`,
    };
    console.log(card)


    Payjp.createToken(card, (status, response) => {
      console.log(response)

      if (status == 200) {
        console.log(status)
        console.log(response)
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden">`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }

      document.getElementById("card-number").removeAttribute("name");
      document.getElementById("card-cvc").removeAttribute("name");
      document.getElementById("card-exp-month").removeAttribute("name");
      document.getElementById("card-exp-year").removeAttribute("name");

      document.getElementById("charge-form").submit();
    });
  });
};

window.addEventListener("load", pay);