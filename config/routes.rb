Rails.application.routes.draw do
  root 'chat#intro'
  get 'room', to: 'chat#room'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
