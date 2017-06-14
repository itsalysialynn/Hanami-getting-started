# Configure your routes here
# See: http://hanamirb.org/guides/routing/overview/
#
# Example:
# get '/hello', to: ->(env) { [200, {}, ['Hello from Hanami!']] }
post '/lendings', to: 'lendings#create'
get '/lendings', to: 'lendings#index'
get '/lendings/new', to: 'lendings#new'

post '/books',    to: 'books#create'
get '/books/new', to: 'books#new'
get '/books',     to: 'books#index'
root              to: 'home#index'
get '/books/authors', to: 'books#authors'

resources :books, only: [:index, :new, :create]
