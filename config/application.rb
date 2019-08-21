<<<<<<< HEAD
# frozen_string_literal: true

=======
>>>>>>> 762ea5f5c6f95f9adf39127e991b29cee37821c7
require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Chessapp
<<<<<<< HEAD
  # Application class configuration is at the app root
=======
>>>>>>> 762ea5f5c6f95f9adf39127e991b29cee37821c7
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

<<<<<<< HEAD
    # Settings in config/environments/* take precedence over those specified
    # here. Application configuration can go into files in config/initializers
=======
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
>>>>>>> 762ea5f5c6f95f9adf39127e991b29cee37821c7
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
