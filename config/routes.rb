Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  mount Api::Test => '/api'
  mount Api::Library => '/api'
end
