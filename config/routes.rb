Rails.application.routes.draw do

  root  'welcome#index'
  get   'tickets'                                                            => 'ticket#index'
  get   'auditoriums'                                                        => 'auditorium#index'
  get   'auditoriums/:auditorium_id/movies'                                  => 'movie#index'
  get   'auditoriums/:auditorium_id/movies/new'                              => 'movie#new'
  get   'auditoriums/:auditorium_id/movies/show/:id'                         => 'movie#show'
  post  'auditoriums/:auditorium_id/movies/create'                           => 'movie#create'
  put   'auditoriums/:auditorium_id/movies/update/:id'                       => 'movie#update'
  get   'auditoriums/:auditorium_id/movies/destroy/:id'                      => 'movie#destroy'
  
  get   'movies/:movie_name/showtimes'                                       => 'movie#showtimes'

  get   'purchase/movies/:id/tickets/new'                                    => 'purchase#new'
  post  'purchase/movies/:id/tickets/create'                                 => 'purchase#create'

  
end
