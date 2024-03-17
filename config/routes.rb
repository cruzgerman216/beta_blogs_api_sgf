Rails.application.routes.draw do
  get 'web/bootstrap'
  resources :blogs do 
    # localhost:3000/blogs/:blog_id/like
    post 'like'
    delete 'unlike'
  end
  resources :users, only: [:create]
  post '/login', to: 'sessions#create'

  scope '/web' do 
    get 'bootstrap', to: 'web#bootstrap'
  end
end
