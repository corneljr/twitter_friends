Rails.application.routes.draw do
  match 'auth/:provider/callback'
end
