require 'sinatra/base'

class Spin < Sinatra::Base
  enable :sessions
  post '/' do
    erb :index
  end

  post '/card' do
    erb :card
  end

  post '/field' do
    erb :field
  end

  run! if app_file == $0
end
