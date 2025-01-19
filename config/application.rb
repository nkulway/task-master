require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module AngularRails
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 8.0

    # Please, add to the `ignore` list any other `lib` subdirectories that do
    # not contain `.rb` files, or that should not be reloaded or eager loaded.
    # Common ones are `templates`, `generators`, or `middleware`, for example.
    config.autoload_lib(ignore: %w[assets tasks])

    # Configuration for the application, engines, and railties goes here.
    config.api_only = true

    # Add Swagger middleware for API docs and UI
    # config.middleware.use Rswag::Ui::Middleware
    # config.middleware.use Rswag::Api::Middleware
  end
end
