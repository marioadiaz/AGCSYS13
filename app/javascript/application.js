// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
// app/assets/javascripts/application.js
//= require jquery
//= require bootstrap.bundle.min // O el nombre de tu archivo de Bootstrap
//= require_tree .

import "@hotwired/turbo-rails"
import "controllers"
import * as bootstrap from "bootstrap"
import "@fortawesome/fontawesome-free"

import "custom/multiselect"
import "custom/scroll_top"

import * as jquery from "jquery"

import $ from "jquery"
window.$ = $
window.jQuery = $


// Hacer que jQuery sea global (para plugins que lo requieran)
window.$ = window.jQuery = jQuery

document.addEventListener("turbo:load", () => {
  console.log("✅ jQuery funcionando en Rails 8 con Importmap!");
});