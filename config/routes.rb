Rails.application.routes.draw do
  root 'welcome#index'

  resources :teams do
    collection do
      post :auto_generate
    end
  end

  resources :groups do
    collection do
      post :auto_generate
    end
  end

  delete 'erase_db', to: 'erase#erase'
end
