Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

#mechanics
get "/mechanics", to: 'mechanics#index'
get "/mechanics/:id", to: 'mechanics#show'


#parks
get "/parks/:id", to: 'parks#show'
end
