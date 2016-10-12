Rails.application.routes.draw do

  root  'welcome#index'
  get   'tickets'                                                            => 'tickets#index'
  resources :auditoriums, only: [:index] do
    resources :movies
  end
  
  get   'movies/:movie_name/showtimes'                                       => 'movies#showtimes'

  get   'purchase/movies/:id/tickets/new'                                    => 'purchase#new'
  post  'purchase/movies/:id/tickets/create'                                 => 'purchase#create'

  
end
