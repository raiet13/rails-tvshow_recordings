Rails.application.routes.draw do
  
  resources :shows do
    resources :characters
  end

  resources :recordings
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
