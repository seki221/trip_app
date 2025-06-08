// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "./places_autocomplete";

// import "bootstrap"

// パスワード表示切り替え
document.addEventListener("DOMContentLoaded", function () {
    const toggle = (inputId, buttonId) => {
      const input = document.getElementById(inputId);
      const button = document.getElementById(buttonId);

      button.addEventListener("click", function () {
        if (input.type === "password") {
          input.type = "text";
          button.textContent = "非表示";
        } else {
          input.type = "password";
          button.textContent = "表示";
        }
      });
    };

    toggle("passwordInput", "showPasswordButton");
    toggle("passwordConfirmationInput", "showPasswordConfirmationButton");
  });
// 予定入力フォームカレンダー
document.addEventListener("turbo:load", () => {
  $('#startdate').datepicker({
    yearSuffix: '年',
    dateFormat: "yy/mm/dd",
    showMonthAfterYear: true,
    monthNames: [ '1月', '2月', '3月', '4月', '5月', '6月', '7月', '8月', '9月', '10月', '11月', '12月' ],
    dayNamesMin: ['日', '月', '火', '水', '木', '金', '土'],
    firstDay: '1'
  });
  $('#enddate').datepicker({
    yearSuffix: '年',
    dateFormat: "yy/mm/dd",
    showMonthAfterYear: true,
    monthNames: [ '1月', '2月', '3月', '4月', '5月', '6月', '7月', '8月', '9月', '10月', '11月', '12月' ],
    dayNamesMin: ['日', '月', '火', '水', '木', '金', '土'],
    firstDay: '1'
    
  });
});
