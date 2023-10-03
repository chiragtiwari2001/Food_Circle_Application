// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import * as bootstrap from "bootstrap"

import jquery from 'jquery'
window.jQuery = jquery
window.$ = jquery

//= require link_to_add_fields

$(document).ready(function() {
  $('add-to-cart').click(function() {
    
  });
});