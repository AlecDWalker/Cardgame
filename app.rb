require 'sinatra/base'

class Spin < Sinatra::Base
  enable :sessions
  get '/' do
    erb :index
  end

  get '/card' do
    erb :card
  end

  get '/field' do
    erb :field
  end

  run! if app_file == $0
end
