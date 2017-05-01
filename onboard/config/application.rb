require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Onboard
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    # config.autoload_paths << Rails.root.join('lib')
    config.generators do |g|
	  g.test_framework  :rspec, :fixture => true
	  g.fixture_replacement :factory_girl, :dir=>"spec/factories"
	  g.helper_specs false
      g.stylsheets = false
      g.javascripts = false
      g.helper = false
	end
  end
end
