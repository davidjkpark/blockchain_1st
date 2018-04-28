class Blockchain

	def mining
		history =[]
		current_time=Time.now.to_f

		begin
			nonce =rand(1000000)
			history<<nonce
			hashed=Digest::SHA256.hexdigest(nonce.to_s)
		end while hashed[0..3]!='0000'

		Time.now.to_f-current_time

		nonce

	end

	def transaction

		"거래완료!"
	end


end
