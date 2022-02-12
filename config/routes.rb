Rails.application.routes.draw do

  devise_for :users, :controllers => {  registrations: 'users/registrations',
                                        sessions: 'users/sessions',
                                        passwords: 'users/passwords',
                                        unlocks: 'users/unlocks',
                                        confirmations: 'users/confirmations'
                                      }

  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do

    root :to          => "pages#home"

    get '/home',                    :to => 'pages#home'
    get '/terms-of-service',        :to => 'pages#terms_of_service'
    get 'users/:id/settings',       :to => 'users#settings',           as: :user_settings

    get 'users/:id/locale/:locale', :to => 'users#locale'

    # delete later
    get '/todo',                    :to => 'pages#todo'


    # ressources
    resources :users
    resources :posts

    resources :users do
      resource  :posts
    end

  end

end