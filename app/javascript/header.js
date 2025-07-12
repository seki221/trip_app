document.addEventListener("turbo:load", function () {
  const header = document.getElementById("header");

  function getTimeClass(hour) {
  if (hour >= 4.5 && hour < 5) return "morning1";
  if (hour >= 5 && hour < 5.5) return "morning2";
  if (hour >= 5.5 && hour < 6) return "morning3";
  if (hour >= 6 && hour < 17) return "day";
  if (hour >= 17 && hour < 19) return "evening";
  return "night";
}

function updateHeaderClass() {
  const now = new Date();
  const currentClass = getTimeClass(now.getHours());

  // すでに設定されているクラスを除去
  header.classList.remove("morning1", "morning2", "morning3", "day", "evening", "night");
  // 現在の時間帯クラスを付ける
  header.classList.add(currentClass);
}


// 初回実行
updateHeaderClass();

// 初回実行

// 以降、1分ごとにチェック（60000ミリ秒）
setInterval(updateHeaderClass, 60000);
});

document.addEventListener("turbo:load", function () {
  const logo = document.getElementById("logo");

  function getTimeClass(hour) {
    if (hour >= 4.5 && hour < 5) return "part1";
    if (hour >= 5 && hour < 5.5) return "part2";
    if (hour >= 5.5 && hour < 6) return "part3";
    return "other";
  }

  function updateLogoClass() {
    const now = new Date();
    const currentClass = getTimeClass(now.getHours());

    // すでに設定されているクラスを除去
    logo.classList.remove("part1", "part2", "part3", "other");
    // 現在の時間帯クラスを付ける
    logo.classList.add(currentClass);
  }
  updateLogoClass();
});