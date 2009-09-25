# Put your extension routes here.

map.namespace :admin do |admin|
  admin.resources :products do |product|
    product.update_availability 'update_availability', :controller => 'product_availabilities', :action => 'update'
    product.view_availability 'view_availability', :controller => 'product_availabilities', :action => 'show'
  end
  admin.resources :availabilities
end