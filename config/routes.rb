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

  get '/email' => 'horoscopes#email_form', as: 'email_form'
  put '/email' => 'horoscopes#emailer'

  get '/text' => 'horoscopes#text_form', as: 'text_form'
  put '/text' => 'horoscopes#text'
end
#              Prefix Verb   URI Pattern                         Controller#Action
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
#          email_form GET    /email(.:format)                    horoscopes#email_form
#               email PUT    /email(.:format)                    horoscopes#emailer
#           text_form GET    /text(.:format)                     horoscopes#text_form
#                text PUT    /text(.:format)                     horoscopes#text