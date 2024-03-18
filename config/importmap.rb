# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"




# config/importmap.rb

pin "@hotwired/turbo-rails", to: "turbo"
pin "controllers", to: "controllers"
pin "jquery", to: "jquery"
