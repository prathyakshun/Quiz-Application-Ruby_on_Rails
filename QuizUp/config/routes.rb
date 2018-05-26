Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :questionsets
  devise_for :users, :controllers => {:omniauth_callbacks => "omniauth_callbacks"}
  resources :options
  resources :questions
  resources :subgenres
  resources :genres
  root 'questions#landingpage'
  get 'landingpage' => 'questions#landingpage'
  get 'category' => 'questions#category'
  post 'category' => 'questions#redirectsubcategory'
  get 'subcategory' => 'questions#subcategory'
  post 'subcategory' => 'questions#redirectdisplayquestions'
  get 'displayquestions' => 'questions#displayquestions'
  post 'displayquestions' => 'questions#check_correct'
  get 'getquestions' => 'questions#getquestions'
  get 'result' => 'questions#result'
  get 'leaderboard' => 'questions#leaderboard'
  post 'leaderboard' => 'questions#redirectleaderboardsubcategory'
  get 'leaderboardsubcategory' => 'questions#leaderboardsubcategory'
  post 'leaderboardsubcategory' => 'questions#redirectsubleaderboard'
  get 'subleaderboard' => 'questions#subleaderboard'
  get 'pastquiz' => 'questions#pastquiz'
  get 'fiftyfifty' => 'questions#fiftyfifty'
  get 'check_incomplete' => 'questions#check_incomplete'
  get 'getfreshquestions' => 'questions#getfreshquestions'
  get 'doubledip' => 'questions#doubledip'
  get 'firstoption' => 'question#firstoption'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
