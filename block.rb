class Blockchain

	def mining
		history =[]
		current_time=Time.now.to_f
		begin
			nonce =rand(100000)
			history<<nonce
		end while nonce !=0

		history.size
		Time.now.to_f-current_time

	end

	def transaction

		"거래완료!"
	end


end
