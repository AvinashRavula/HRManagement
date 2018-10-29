Rails.application.routes.draw do
  get 'welcome/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get '/employees' => 'employees#index'
  # get '/employees/new' => 'employees#new'
  # post 'employees' => 'employees#create'
  get '/employees/under_team_lead/:id' => "employees#show_employees_under_team_lead"

  resources :employees
  resources :skills
  resources :projects

  root 'welcome#index'
end
