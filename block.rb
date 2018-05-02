require 'securerandom'

class Blockchain

	def initialize
		@chain=[]
		@trans=[]
		@wallet={}
	end

	def make_a_new_wallet
		address = SecureRandom.uuid.gsub("-","")
		@wallet[address]=1000
		@wallet
	end

	def make_a_trans(s,r,a)
		if @wallet[s].nil?
			"보내는 주소가 잘못되었습니다"
		elsif @wallet[r].nil?
			"받는 주소가 잘못되었습니다"
		elsif @wallet[s]<a.to_f
			"돈없다!"
		else

			trans={
				"sender"=>s,
				"receiver"=>r,
				"amount"=>a
			}
			@trans<<trans
			@trans
		end
	end

	def mining
		history =[]
		current_time=Time.now.to_f

		begin
			nonce =rand(1000000)
			history<<nonce
			hashed=Digest::SHA256.hexdigest(nonce.to_s)
		end while hashed[0..3]!='0000'
		nonce

		block={
			"index"=>@chain.size + 1,
			"time"=>Time.now,
			"nonce"=>nonce,
			"previous_address"=>Digest::SHA256.hexdigest(last_block.to_s),
			"transactions"=>@trans
		}
		@trans=[]
		@chain<<block
		block


	end

	def last_block
		@chain[-1]
	end

	def all_blocks
		@chain
	end


end
