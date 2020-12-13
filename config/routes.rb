Rails.application.routes.draw do
  get '/about', to: 'about#index'
  root 'clients#index'
  get '/index', to: 'clients#index', constraints: lambda { |req| req.format == :amp }
end
