# Pin npm packages by running ./bin/importmap

# config/importmap.rb
Rails.application.config.importmap.draw do
    pin "application"
    pin "@hotwired/turbo-rails", to: "https://cdn.skypack.dev/@hotwired/turbo-rails"
    pin "@hotwired/stimulus", to: "https://cdn.skypack.dev/@hotwired/stimulus"
    pin "@hotwired/stimulus-loading", to: "https://cdn.skypack.dev/@hotwired/stimulus-loading"
    pin_all_from "app/javascript/controllers", under: "controllers"
  end
  # Pin npm packages by running ./bin/importmap

