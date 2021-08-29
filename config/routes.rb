Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root "urls#index"

  resources :urls do
    collection do
      get :leader_board
    end

    member do
      get :visit_original
    end
  end
end
