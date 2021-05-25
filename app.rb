require_relative 'config/environment'
require 'pry'

class App < Sinatra::Base

    # In Sinatra we enable sessions within the controller (e.g. app.rb)
    # by adding two lines in the configure block

    configure do
        enable :sessions
        set :session_secret, "secret"
    end

    get '/' do
        erb :index
    end

    post '/checkout' do
        session[:item] = params[:item]
        @session = session
        erb :'checkout'
    end
end