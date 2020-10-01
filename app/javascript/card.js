
const pay = ()=> {
  //プラウざのカード情報取得
  Payjp.setPublicKey("");// PAY.JPテスト公開鍵
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();
    
    const formResult = document.getElementById("charge-form");//ビュー画面で入力されたカード情報をformResult定数へ代入
    const formData = new FormData(formResult);//FormDataオブジェクトをnewで生成し、入力されたカード情報（Result）の値を取得し、定数formDataへ代入。

    const card = {
      number: formData.get("credit_address[number]"),//定数formDataからname属性'number'の値をnumber:へ紐付ける。
      cvc: formData.get("credit_address[cvc]"),
      exp_month: formData.get("credit_address[exp_month]"),
      exp_year: `20${formData.get("credit_address[exp_year]")}`,
    };
  //プラウざのカード情報取得

    
  Payjp.createToken(card, (status, response) => {//クレカ情報をpay.jpへ送信とトークン発酵
    if (status == 200) {
      const token = response.id;
      const renderDom = document.getElementById("charge-form");
      const tokenObj = `<input value=${token} type="hidden" name='token'>`;
      renderDom.insertAdjacentHTML("beforeend", tokenObj);//insertAdjacentHTMLを使用してフォームにtokenObjを追加。"beforeend"で、最後より手前に追加されるように指定。
    }
    
  //属性に指定された値を取り除く
  //フォームに入力されたカード情報を削除。カード情報がコントローラーに送られ、値がそのままデータベースに保存されるのを防ぐ
  document.getElementById("card-number").removeAttribute("name");
  document.getElementById("card-cvc").removeAttribute("name");
  document.getElementById("card-exp-month").removeAttribute("name");
  document.getElementById("card-exp-year").removeAttribute("name");
    //属性に指定された値を取り除く

  document.getElementById("charge-form").submit();//submitメソッドを用いて、クレカ情報入力したフォームの情報をサーバーサイドに送信し、コントローラーに処理を移す。
 
  document.getElementById("charge-form").reset();//フォームに入力されたカード情報をリセット
  })

  })


}




window.addEventListener("load", pay);
