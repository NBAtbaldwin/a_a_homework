console.log("Hello from the JavaScript console!");

// Your AJAX request here
$.ajax({
  url: 'http://api.openweathermap.org/data/2.5/weather?q=new%20york,US&appid=bcb83c4b54aee8418983c2aff3073b3b',
  type: 'GET',
  success: function(weather) {
    const $weather = weather;
    console.log(`It's ${$weather['weather'][0]['main']} with ${$weather['weather'][0]['description']} and the temperature is somehow ${$weather['main']['temp']}`);
  },
  error: function(errMsg) {
    console.log(errMsg);
  }
});

console.log("doing a console log");
// Add another console log here, outside your AJAX request
