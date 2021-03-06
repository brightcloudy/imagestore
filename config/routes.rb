Rails.application.routes.draw do
  devise_for :users
  root 'splash#index'

  resources :image, except: [:show, :index, :destroy]
  get 'image/:random_url', to: 'image#show'
  get 'image/:random_url/med', to: 'image#view_med'
  get 'image/:random_url/xxl', to: 'image#view_xxl'
  get 'image/:random_url/xl', to: 'image#view_xl'
  get 'image/:random_url/lg', to: 'image#view_lg'
  get 'image/:random_url/sm', to: 'image#view_sm'
  get 'image/:random_url/thumb', to: 'image#view_thumb'
  delete 'image/:random_url', to: 'image#destroy'
  get 'images', to: 'image#index'

  resources :phone_number, only: [:index, :create, :destroy]

  post 'twilio/voice_call' => 'twilio#voice_call'
  post 'twilio/sms' => 'twilio#sms'
  post 'twilio/send_mms' => 'twilio#send_mms'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
