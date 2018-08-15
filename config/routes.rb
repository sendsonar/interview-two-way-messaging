Rails.application.routes.draw do
  post 'conversations/match', to: 'conversations#match'
  post '/process_message', to: 'conversations#process_message'
  post 'conversations/send_user_message', to: 'conversations#send_user_message'
end
