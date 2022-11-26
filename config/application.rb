require_relative "boot"

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_mailbox/engine"
require "action_text/engine"
require "action_view/railtie"
require "action_cable/engine"
# require "sprockets/railtie"
require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module App
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    # Railsアプリのデフォルトタイムゾーン
    config.time_zone = ENV['TZ']
    # active recordのタイムゾーン
    config.active_record.default_timezone = :utc
    # i18nで使われる言語
    config.i18n.default_locale = :ja
    # $LOAD_PATHにauto load pathを追加しない
    # https://railsguides.jp/autoloading_and_reloading_constants.html
    config.add_autoload_paths_to_load_path = false

    
    # config.eager_load_paths << Rails.root.join("extras")

    # Only loads a smaller set of middleware suitable for API only apps.
    # Middleware like session, flash, cookies can be added back manually.
    # Skip views, helpers and assets when generating a new resource.
    config.api_only = true
  end
end
