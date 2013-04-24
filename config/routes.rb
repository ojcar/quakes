Quakes::Application.routes.draw do
  namespace :api do
    resources :earthquakes, :only => [:index] 
  end
end
