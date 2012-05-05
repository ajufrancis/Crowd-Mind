CrowdMind::Application.routes.draw do
  resource :session, only: [:create, :destroy]
  match '/auth/:provider/callback', to: 'session#create'
end
