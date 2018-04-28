class Blockchain

	def mining
		history =[]
		begin
			nonce =rand(100000)
			history<<nonce
		end while nonce !=0
		history.size
	end

	def transaction

		"거래완료!"
	end


end
