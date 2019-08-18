// function to get value from div and submit (ajax)
const priceSlider = () => {
  const priceSlider = document.getElementById("payoutReset");
  priceSlider.addEventListener('click', (event) => {
    Rails.fire(form, "submit");
  });
}
