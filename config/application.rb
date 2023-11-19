# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module DeviseVue
  class Application < Rails::Application
    config.load_defaults 7.0

    config.session_store :cookie_store, key: '_interslice_session'

    config.middleware.use ActionDispatch::Cookies

    config.middleware.use config.session_store, config.session_options

    config.before_configuration do
      env_file = File.join(Rails.root, 'config', '.env.yml')
      if File.exist?(env_file)
        YAML.load(File.open(env_file)).each do |key, value|
          ENV[key.to_s] = value
        end
      end
    end
    config.api_only = true
  end
end
