class Blockchain

	def mining
		history =[]
		current_time=Time.now.to_f

		begin
			nonce =rand(1000000)
			history<<nonce
			hashed=Digest::SHA256.hexdigest(nonce.to_s)
		end while hashed[0..3]!='0000'

		tt=[]

		tt<<Time.now.to_f-current_time
		tt<<nonce
		tt


	end

	def transaction

		"거래완료!"
	end


end
