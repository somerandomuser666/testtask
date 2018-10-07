Rails.application.routes.draw do
  root 'welcome#index'

  resources :teams do
    collection do
      post :auto_generate
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
