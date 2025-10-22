# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"

pin "jquery", to: "jquery.js", preload: true
# config/importmap.rb
#pin "popper", to: "popper.js", preload: true
pin "bootstrap", to: "bootstrap.bundle.min.js", preload: true
#pin "@fortawesome/fontawesome-free", to: "@fortawesome--fontawesome-free.js" # @7.1.0
#pin "fontawesome-free", to: "fontawesome-free/js/all.min.js"
pin "@fortawesome/fontawesome-free", to: "fontawesome-free/js/all.js"

pin "custom/multiselect", to: "custom/multiselect.js"
pin "custom/scroll_top", to: "custom/scroll_top.js"
