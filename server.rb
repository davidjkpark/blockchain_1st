# encoding: utf-8

require 'sinatra'
require './block'


aa=Blockchain.new

get '/' do

	message=""

	aa.all_blocks.each do |b|
		message<<b['index'].to_s + "<br>"
		message<<b['time'].to_s + "<br>"
		message<<b['nonce'].to_s + "<br>"
		message<<b['previous_address'].to_s + "<br>"
		message<<"<hr>"
	end

message

end


get '/mine' do
	aa.mining.to_s
end


