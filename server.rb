# encoding: utf-8

require 'sinatra'
require './block'


aa=Blockchain.new

get '/' do
	"블럭 리스트 입니다."
end

get '/mine' do
	aa.mining.to_s
end


