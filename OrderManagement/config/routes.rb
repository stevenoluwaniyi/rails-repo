Rails.application.routes.draw do
	namespace 'api' do
		namespace 'v1' do
			#index route definition
			get 'orders' => 'orders#index'

			#show
			get 'orders/:id' => 'orders#show'

			#create
			post 'orders' => 'orders#create'

			#update
			patch 'orders/:id' => 'orders#update'

			#delete
			delete 'orders/:id' => 'orders#destroy'
		end
	end		 
end
