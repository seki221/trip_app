// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
// import "bootstrap"

document.addEventListener("turbo:load", () => {
  $('#startdate').datepicker({
    yearSuffix: '年',
    showMonthAfterYear: true,
    monthNames: [ '1月', '2月', '3月', '4月', '5月', '6月', '7月', '8月', '9月', '10月', '11月', '12月' ],
    dayNamesMin: [ '日', '月', '火', '水', '木', '金', '土' ]
  });
  $('#enddate').datepicker({
    yearSuffix: '年',
    showMonthAfterYear: true,
    monthNames: [ '1月', '2月', '3月', '4月', '5月', '6月', '7月', '8月', '9月', '10月', '11月', '12月' ],
    dayNamesMin: [ '日', '月', '火', '水', '木', '金', '土' ]
  });
});