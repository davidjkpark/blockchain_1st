class Blockchain

	def mining
		history =[]
		begin
			nonce =rand(100000)
			history<<nonce
			history.push(nonce)
			history=history+nonce
		end while nonce !=0
		nonce
	end

	def transaction

		"거래완료!"
	end


end
