# encoding: utf-8

require 'sinatra'
require './block'


aa=Blockchain.new

get '/' do

	message=""

	aa.all_blocks.each do |b|
		message<<"번호 : " + b['index'].to_s + "<br>"
		message<<"시간 : " + b['time'].to_s + "<br>"
		message<<"Nonce : " +b['nonce'].to_s + "<br>"
		message<<"주소 : " + b['previous_address'].to_s + "<br>"
		message<<"<hr>"
	end

message

end


get '/mine' do
	aa.mining.to_s
end


