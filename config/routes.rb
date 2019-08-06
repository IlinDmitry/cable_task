Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'file_upload#index'
  post 'file_upload/upload'
end
