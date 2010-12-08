Rails.application.routes.draw do
	
	#match '/ogone_notification' => 'ogone_notification#show', :as => :show

	resource :ogone_notification, :controller => 'ogone_notification'
	
end