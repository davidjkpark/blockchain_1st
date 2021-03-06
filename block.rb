require 'securerandom'
require 'httparty'

class Blockchain

	def initialize
		@chain=[]
		@trans=[]
		@wallet={}
		@node=[]
	end

	def show_all_wallet
		@wallet
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
		elsif @wallet[s].to_f<a.to_f
			"돈없다!"
		else

			@wallet[s]=@wallet[s]-a.to_f
			@wallet[r]=@wallet[r]+a.to_f

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

	def recv(blocks)
		blocks.each do |b|
			@chain << b
		end
		@chain
	end

	def ask_other_block
		@node.each do |n|
			other_block = HTTParty.get("http://localhost:"+n+"/number_of_blocks").body
			if @chain.size < other_block.to_i
				jsoned_chain=@chain.to_json
				full_chain=HTTParty.get("http://localhost:"+n+"/recv?blocks=" + jsoned_chain)
				@chain=JSON.parse(full_chain)
			end
		end
	end

	def add_node(node)
		@node<<node
		@node.uniq!
		@node
	end

end
