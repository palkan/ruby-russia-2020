# frozen_string_literal: true

require_relative "boot"

require "rails"

require "active_model/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_view/railtie"
require "action_cable/engine"
require "view_component/engine"

Bundler.require(*Rails.groups)

module RubyRussia2020
  class Application < Rails::Application
    config.load_defaults 6.1

    config.i18n.available_locales = %w[en ru]
    config.i18n.default_locale = :ru

    config.hosts = [] if ENV["CODESPACES"] == "true"

    config.autoload_paths << Rails.root.join("app", "frontend", "components")
    config.view_component.preview_paths << Rails.root.join("app", "frontend", "components")

    config.session_store :cache_store

    config.generators do |g|
      g.assets false
      g.helper false
      g.orm :active_record
      g.stylesheets false
      g.javascripts false
      g.test_framework nil
    end
  end
end
