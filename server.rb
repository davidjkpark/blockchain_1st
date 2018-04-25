# encoding: utf-8

require 'sinatra'
require './block'


aa=Dog.new

get '/' do
	"#{aa.my_weight}"
end

get '/eating' do

end


