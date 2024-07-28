function jpostal() {
  $('#zipcode').jpostal({
    postcode : ['#zipcode'],
    address : {
      '#fitness_gym_address': '%3%4%5'
    }
  });
}
$(document).on("turbolinks:load", jpostal);