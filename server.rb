# encoding: utf-8

require 'sinatra'
require './block'


aa=Blockchain.new

get '/' do

	message=""

	aa.all_blocks.each do |b|

end

get '/mine' do
	aa.mining.to_s
end


