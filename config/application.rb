require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module SensorCloud
  # todo gko app:update removed this block..
  def self.rake?
    !!@rake
  end

  def self.rake=(value)
    @rake = !!value
  end
  # ###########################################
  
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # todo gko app:update tried to delete this:
    config.autoload_paths += %W(#{config.root}/lib)

    config.assets.precompile += %w(*.png *.jpg *.jpeg *.gif)

		config.assets.precompile << Proc.new do |path|
  		if path =~ /\.(css|js)\z/
    		full_path = Rails.application.assets.resolve(path).to_s
    		app_assets_path = Rails.root.join('app', 'assets').to_s
    		if full_path.starts_with? app_assets_path
      		puts "including asset: " + full_path
      		true
    		else
      		puts "excluding asset: " + full_path
      		false
    		end
  		else
    		false
  		end
		end
    ####################

    # todo the next the lines added due to onmiauth.. Do I need anything? Remove session_store.rb?
    # https://github.com/omniauth/omniauth#integrating-omniauth-into-your-rails-api
    config.session_store :cookie_store, key: '_interslice_session'
    config.middleware.use ActionDispatch::Cookies # Required for all session management
    config.middleware.use ActionDispatch::Session::CookieStore, config.session_options
  end
end
