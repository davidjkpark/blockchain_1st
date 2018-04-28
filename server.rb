# encoding: utf-8

require 'sinatra'
require './block'


aa=Blockchain.new

get '/' do
	aa.all_blocks.to_s
end

get '/mine' do
	aa.mining.to_s
end


