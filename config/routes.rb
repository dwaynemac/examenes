Examenes::Application.routes.draw do

  devise_for :users

  resource :examen_vivo, :only => [:new, :create ]
  resources :people

  root :to => "static#home"
end
