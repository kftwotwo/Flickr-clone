Rails.application.routes.draw do
  devise_for :users
  root to: "welcome#index"

  resources :users, :only => [:show, :update] do
    get 'upload' => 'users#upload_avatar'
    resources :photos, :except => [:edit, :update]
  end

  resources :photos, :only => [:show] do
    resources :comments
  end
end
