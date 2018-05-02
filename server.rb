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
		message<<"Transactions : " + b['transactions'].to_s + "<br>"
		message<<"<hr>"
	end

message + "</center>"

end


get '/mine' do
	aa.mining.to_s
end


get '/trans' do
	aa.make_a_trans(params["sender"],params["recv"],params["amount"]).to_s
end

get '/new_wallet' do
	aa.make_a_new_wallet.to_s
end

get '/all_wallet' do
	aa.show_all_wallet.to_s
end

