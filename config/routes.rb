Rails.application.routes.draw do

  root  'welcome#index'
  get   'tickets'                                                            => 'tickets#index'
  get   'movies/:movie_name/showtimes'                                       => 'movies#showtimes'

  get   'purchase/movies/:id/tickets/new'                                    => 'purchase#new'
  post  'purchase/movies/:id/tickets/create'                                 => 'purchase#create'

  resources :auditoriums,  only: [:index, :new, :edit, :create, :update, :destroy] do
    resources :movies
  end

  match 'auditoriums/:id/edit' => 'auditoriums#edit', :via => :get
  match 'auditoriums/:auditorium_id/movies/:id' => "movies#destroy",  :via=>:delete

end