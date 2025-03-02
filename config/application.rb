require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module Agenda
  class Application < Rails::Application
    config.load_defaults 8.0
    config.autoload_lib(ignore: %w[assets tasks])

    config.time_zone = "Brasilia"
    config.active_record.default_timezone = :local
    # config.eager_load_paths << Rails.root.join("extras")

    config.i18n.default_locale = :"pt-BR"
  end
end
