# encoding: utf-8

require 'sinatra'
require './block'


aa=Dog.new

get '/' do
	aa.my_weight.to_s
end

get '/eating' do
	aa.eat
	"먹었음"
end


