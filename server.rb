# encoding: utf-8

require 'sinatra'
require './block'


aa=Blockchain.new

get '/' do

	message="<center>"

	aa.all_blocks.each do |b|
		message<<"번호 : " + b['index'].to_s + "<br>"
		message<<"시간 : " + b['time'].to_s + "<br>"
		message<<"Nonce : " +b['nonce'].to_s + "<br>"
		message<<"앞주소 : " + b['previous_address'].to_s + "<br>"
		message<<"내주소 : " + Digest::SHA256.hexdigest(b.to_s) + "<br>"
		message<<"<hr>"
	end

message + "</center>"

end


get '/mine' do
	aa.mining.to_s
end


