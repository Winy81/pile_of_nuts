Rails.application.routes.draw do

  root 'nuts#index'

  get 'nuts/manual_read', to: 'nuts#manual_read'
  post 'nuts/manual_read', to: 'nuts#compute_manual_read'

  get 'nuts/file_read', to: 'nuts#file_read'
  post 'nuts/file_read', to: 'nuts#compute_file_read'

end
