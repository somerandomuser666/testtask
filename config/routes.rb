Rails.application.routes.draw do
  root 'welcome#index'

  resources :teams

  resources :groups do
    collection do
      post :play_off_generate
      post :final_generate
    end
  end

  delete 'erase_db', to: 'erase#destroy'
end
