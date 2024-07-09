// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "bootstrap"
import jQuery from 'jquery';
window.$ = jQuery
window.jQuery = jQuery

import 'bootstrap/dist/js/bootstrap'
require("jgrowl")
Rails.start()
Turbolinks.start()
ActiveStorage.start()
//= require rails-ujs
//= require jquery3
//= require popper
//= require bootstrap-sprockets
$(document).ready(function(){
  // Initialize Bootstrap popovers
  $('.popover-test').popover();

  // Initialize Bootstrap tooltips
  $('.tooltip-test').tooltip();
});
//= require bootstrap_select
