require 'active_merchant_ogone'
require 'spree_core'
require 'ogone_gateway_hooks'

module OgoneGateway
  class Engine < Rails::Engine

	config.autoload_paths += %W(#{config.root}/lib)
	
    def self.activate
      Dir.glob(File.join(File.dirname(__FILE__), "../app/**/*_decorator*.rb")) do |c|
			Rails.env.production? ? require(c) : load(c)
      end
	  
	  Billing::Ogone.register
    
    # Do what the ActiveMerchant init does but not as a gem.
    ActionView::Base.send(:include, ActiveMerchant::Billing::Integrations::ActionViewHelper)
	  

 end

    config.to_prepare &method(:activate).to_proc
  end
end