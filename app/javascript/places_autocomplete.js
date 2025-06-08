window.initAutocomplete = function () {
  const destinationInput = document.getElementById("destination");
  const addressInput = document.getElementById("address");

  if (!destinationInput || !addressInput) return;

  const autocomplete = new google.maps.places.Autocomplete(destinationInput, {
    fields: ["name", "formatted_address"],
    types: ["establishment"]
  });

  autocomplete.addListener("place_changed", function () {
    const place = autocomplete.getPlace();
    if (!place.name || !place.formatted_address) return;

    // スポット名だけをdestinationに、住所だけをaddressに
    destinationInput.value = place.name;

    const address = place.formatted_address
      .replace(/^日本、?\s*/, "")
      .replace(/〒\d{3}-\d{4}\s*/, "");
    addressInput.value = address;
  });
}
document.addEventListener("turbo:load", function () {
  window.initAutocomplete && window.initAutocomplete();
});
