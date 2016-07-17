Rails.application.routes.draw do
  root to: 'horoscopes#index'
  resources :horoscopes do 
    member do 
      get 'tomorrow'
    end

    member do 
      get 'yesterday'
    end

    member do 
    	put :like
    end

    member do
    	put :dislike
    end
  end

  get '/email' => 'horoscopes#emailer'
  put '/email' => 'horoscopes#emailer'
end


# get '/' => 'tests#test'
#   Prefix Verb   URI Pattern                         Controller#Action
#                root GET    /                                   horoscopes#index
#  tomorrow_horoscope GET    /horoscopes/:id/tomorrow(.:format)  horoscopes#tomorrow
# yesterday_horoscope GET    /horoscopes/:id/yesterday(.:format) horoscopes#yesterday
#      like_horoscope PUT    /horoscopes/:id/like(.:format)      horoscopes#like
#   dislike_horoscope PUT    /horoscopes/:id/dislike(.:format)   horoscopes#dislike
#          horoscopes GET    /horoscopes(.:format)               horoscopes#index
#                     POST   /horoscopes(.:format)               horoscopes#create
#       new_horoscope GET    /horoscopes/new(.:format)           horoscopes#new
#      edit_horoscope GET    /horoscopes/:id/edit(.:format)      horoscopes#edit
#           horoscope GET    /horoscopes/:id(.:format)           horoscopes#show
#                     PATCH  /horoscopes/:id(.:format)           horoscopes#update
#                     PUT    /horoscopes/:id(.:format)           horoscopes#update
#                     DELETE /horoscopes/:id(.:format)           horoscopes#destroy
#               email GET    /email(.:format)                    horoscopes#test
#                     PUT    /email(.:format)                    horoscopes#test_email